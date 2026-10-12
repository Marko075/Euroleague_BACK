package com.takima.backskeleton.services;

import com.takima.backskeleton.DAO.JoueurDao;
import com.takima.backskeleton.DAO.MatchDao;
import com.takima.backskeleton.DAO.SaisonDao;
import com.takima.backskeleton.DAO.StatsJoueurMatchDao;
import com.takima.backskeleton.DTO.MatchStatsDto;
import com.takima.backskeleton.DTO.MoyennesJoueurDto;
import com.takima.backskeleton.DTO.StatsJoueurDto;
import com.takima.backskeleton.models.Joueur;
import com.takima.backskeleton.models.Match;
import com.takima.backskeleton.models.StatsJoueurMatch;
import com.takima.backskeleton.services.SimulateurMatch.Ligne;
import com.takima.backskeleton.services.SimulateurMatch.Profil;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Simulation des matchs pas encore joués : scores, statistiques des joueurs et MVP sont
 * enregistrés en base, comme si les matchs avaient eu lieu. Classements, bilans et pages
 * de matchs se mettent donc à jour tout seuls.
 */
@Service
public class SimulationService {

    private static final int EFFECTIF_MINIMUM = 5;

    private final SaisonDao saisonDao;
    private final MatchDao matchDao;
    private final JoueurDao joueurDao;
    private final StatsJoueurMatchDao statsJoueurMatchDao;
    private final SimulateurMatch simulateur;

    public SimulationService(SaisonDao saisonDao, MatchDao matchDao, JoueurDao joueurDao,
                             StatsJoueurMatchDao statsJoueurMatchDao, SimulateurMatch simulateur) {
        this.saisonDao = saisonDao;
        this.matchDao = matchDao;
        this.joueurDao = joueurDao;
        this.statsJoueurMatchDao = statsJoueurMatchDao;
        this.simulateur = simulateur;
    }

    @Transactional
    public List<MatchStatsDto> simulerMiniSaison(Long saisonId, int miniSaison) {
        return simuler(matchsDeLaMiniSaison(saisonId, miniSaison));
    }

    @Transactional
    public List<MatchStatsDto> simulerJournee(Long saisonId, int miniSaison, int journee) {
        List<Match> matchs = matchsDeLaMiniSaison(saisonId, miniSaison).stream()
                .filter(m -> Objects.equals(m.getJournee(), journee))
                .toList();
        if (matchs.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND,
                    "Journée " + journee + " introuvable dans la mini-saison " + miniSaison);
        }
        return simuler(matchs);
    }

    // Les matchs de la mini-saison redeviennent « à venir » : scores, MVP et statistiques effacés
    @Transactional
    public void reinitialiserMiniSaison(Long saisonId, int miniSaison) {
        List<Match> matchs = matchsDeLaMiniSaison(saisonId, miniSaison);
        matchs.forEach(Match::reinitialiser);
        statsJoueurMatchDao.deleteByMatchIds(matchs.stream().map(Match::getId).toList());
    }

    // Matchs de la mini-saison, dans l'ordre du calendrier (404 si la saison ou la mini-saison n'existe pas)
    private List<Match> matchsDeLaMiniSaison(Long saisonId, int miniSaison) {
        if (!saisonDao.existsById(saisonId)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Saison " + saisonId + " introuvable");
        }
        List<Match> matchs = matchDao.findBySaisonIdOrdered(saisonId).stream()
                .filter(m -> Objects.equals(m.getMiniSaison(), miniSaison))
                .toList();
        if (matchs.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Mini-saison " + miniSaison + " introuvable");
        }
        return matchs;
    }

    private List<MatchStatsDto> simuler(List<Match> matchs) {
        List<Match> aJouer = matchs.stream().filter(m -> !m.estJoue()).toList();
        if (aJouer.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Tous ces matchs ont déjà été joués");
        }

        Map<Long, MoyennesJoueurDto> moyennes = new HashMap<>();
        for (MoyennesJoueurDto m : statsJoueurMatchDao.findMoyennesParJoueur()) {
            moyennes.put(m.joueurId(), m);
        }
        Map<Long, List<Profil>> effectifs = new HashMap<>();

        List<MatchStatsDto> resultat = new ArrayList<>();
        for (Match match : aJouer) {
            List<Profil> domicile = effectifs.computeIfAbsent(match.getClubDomicile().getId(), id -> effectif(id, moyennes));
            List<Profil> exterieur = effectifs.computeIfAbsent(match.getClubExterieur().getId(), id -> effectif(id, moyennes));
            SimulateurMatch.Resultat simule = simulateur.simuler(domicile, exterieur);

            List<StatsJoueurMatch> stats = new ArrayList<>();
            for (Ligne ligne : simule.domicile()) {
                stats.add(versStats(match, ligne));
            }
            for (Ligne ligne : simule.exterieur()) {
                stats.add(versStats(match, ligne));
            }
            statsJoueurMatchDao.saveAll(stats);
            match.terminer(simule.scoreDomicile(), simule.scoreExterieur(), simule.mvp());

            resultat.add(versDto(match, simule));
        }
        return resultat;
    }

    private List<Profil> effectif(Long clubId, Map<Long, MoyennesJoueurDto> moyennes) {
        List<Joueur> joueurs = joueurDao.findByClubIdOrderByNomAsc(clubId);
        if (joueurs.size() < EFFECTIF_MINIMUM) {
            throw new ResponseStatusException(HttpStatus.CONFLICT,
                    "Effectif insuffisant pour simuler les matchs du club " + clubId);
        }
        return joueurs.stream().map(j -> profil(j, moyennes.get(j.getId()))).toList();
    }

    // Un joueur qui a déjà joué garde ses moyennes ; sa présence dépend de son nombre de matchs
    private Profil profil(Joueur joueur, MoyennesJoueurDto m) {
        if (m == null) {
            return profilParDefaut(joueur);
        }
        return new Profil(joueur, m.matchs() + 1, m.lancersFrancs(), m.deuxPoints(), m.troisPoints(),
                m.rebonds(), m.passesDecisives(), m.interceptions());
    }

    // Jamais joué (ex. recrue) : peu de chances d'être aligné, et des moyennes types de son poste
    private Profil profilParDefaut(Joueur joueur) {
        return switch (joueur.getPoste()) {
            case "M" -> new Profil(joueur, 0.5, 1.0, 1.2, 0.7, 1.5, 3.0, 0.8);
            case "AR" -> new Profil(joueur, 0.5, 1.0, 1.4, 0.9, 1.8, 1.6, 0.6);
            case "AF" -> new Profil(joueur, 0.5, 0.9, 1.7, 0.4, 3.5, 0.9, 0.4);
            case "P" -> new Profil(joueur, 0.5, 1.0, 2.0, 0.1, 4.5, 0.7, 0.4);
            default -> new Profil(joueur, 0.5, 0.9, 1.5, 0.7, 2.6, 1.1, 0.5);
        };
    }

    private StatsJoueurMatch versStats(Match match, Ligne ligne) {
        return new StatsJoueurMatch(match, ligne.joueur(), ligne.lancersFrancs(), ligne.deuxPoints(),
                ligne.troisPoints(), ligne.rebonds(), ligne.passes(), ligne.interceptions());
    }

    // Même format que GET /matchs/derniers ; les points sont recalculés ici (en base, c'est PostgreSQL qui le fait)
    private MatchStatsDto versDto(Match match, SimulateurMatch.Resultat simule) {
        Joueur mvp = simule.mvp();
        return new MatchStatsDto(
                match.getId(),
                match.getMiniSaison(),
                match.getJournee(),
                match.getDateMatch(),
                match.getClubDomicile().getId(),
                match.getClubDomicile().getNom(),
                simule.scoreDomicile(),
                match.getClubExterieur().getId(),
                match.getClubExterieur().getNom(),
                simule.scoreExterieur(),
                mvp.getId(),
                mvp.getNom(),
                mvp.getPrenom(),
                versDtos(simule.domicile()),
                versDtos(simule.exterieur())
        );
    }

    private List<StatsJoueurDto> versDtos(List<Ligne> lignes) {
        return lignes.stream()
                .sorted(Comparator.comparingInt(Ligne::points).reversed())
                .map(l -> new StatsJoueurDto(
                        l.joueur().getId(),
                        l.joueur().getNom(),
                        l.joueur().getPrenom(),
                        l.joueur().getPoste(),
                        l.points(),
                        l.lancersFrancs(),
                        l.deuxPoints(),
                        l.troisPoints(),
                        l.rebonds(),
                        l.passes(),
                        l.interceptions()))
                .toList();
    }
}
