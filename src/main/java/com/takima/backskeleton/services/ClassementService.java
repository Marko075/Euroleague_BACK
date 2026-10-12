package com.takima.backskeleton.services;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.takima.backskeleton.DAO.MatchDao;
import com.takima.backskeleton.DAO.SaisonDao;
import com.takima.backskeleton.DTO.ClassementLigneDto;
import com.takima.backskeleton.DTO.ClassementMiniSaisonDto;
import com.takima.backskeleton.models.Club;
import com.takima.backskeleton.models.Match;
import com.takima.backskeleton.models.Saison;

@Service
public class ClassementService {

    private final SaisonDao saisonDao;
    private final MatchDao matchDao;

    public ClassementService(SaisonDao saisonDao, MatchDao matchDao) {
        this.saisonDao = saisonDao;
        this.matchDao = matchDao;
    }

    /** Une équipe dans le classement d'une mini-saison. */
    private static class Equipe {
        final Long clubId;
        final String nom;
        int victoires = 0;
        int defaites = 0;
        int diff = 0;          // paniers marqués - paniers encaissés (tous les matchs)
        int duelsVictoires = 0; // victoires dans les matchs entre équipes à égalité
        int duelsDiff = 0;      // +/- dans les matchs entre équipes à égalité

        Equipe(Long clubId, String nom) {
            this.clubId = clubId;
            this.nom = nom;
        }
    }

    @Transactional(readOnly = true)
    public List<ClassementMiniSaisonDto> findClassementsSaisonEnCours() {
        List<Saison> saisons = saisonDao.findByStatut("EN_COURS");
        if (saisons.isEmpty()) {
            return new ArrayList<>();
        }
        List<Match> matchs = matchDao.findBySaisonIdOrdered(saisons.get(0).getId());
        return calculerClassements(matchs);
    }

    /** Un classement par mini-saison qui a au moins un match joué. */
    List<ClassementMiniSaisonDto> calculerClassements(List<Match> matchs) {
        // matchs terminés, regroupés par mini-saison (TreeMap = trié par numéro)
        Map<Integer, List<Match>> parMiniSaison = new TreeMap<>();
        for (Match match : matchs) {
            boolean joue = "TERMINE".equals(match.getStatut())
                    && match.getScoreDomicile() != null
                    && match.getScoreExterieur() != null;
            if (joue) {
                parMiniSaison.computeIfAbsent(match.getMiniSaison(), k -> new ArrayList<>()).add(match);
            }
        }

        List<ClassementMiniSaisonDto> resultat = new ArrayList<>();
        for (Map.Entry<Integer, List<Match>> entry : parMiniSaison.entrySet()) {
            List<Match> matchsDuMini = entry.getValue();

            // dernière journée jouée de cette mini-saison
            int derniereJournee = 0;
            for (Match match : matchsDuMini) {
                derniereJournee = Math.max(derniereJournee, match.getJournee());
            }

            resultat.add(new ClassementMiniSaisonDto(
                    entry.getKey(), derniereJournee, classer(matchsDuMini)));
        }
        return resultat;
    }

    private List<ClassementLigneDto> classer(List<Match> matchs) {
        // 1) victoires, défaites et +/- de chaque équipe
        Map<Long, Equipe> equipes = new LinkedHashMap<>();
        for (Match match : matchs) {
            Equipe domicile = equipe(equipes, match.getClubDomicile());
            Equipe exterieur = equipe(equipes, match.getClubExterieur());
            int sd = match.getScoreDomicile();
            int se = match.getScoreExterieur();

            if (sd > se) {
                domicile.victoires++;
                exterieur.defaites++;
            } else if (se > sd) {
                exterieur.victoires++;
                domicile.defaites++;
            }
            domicile.diff += sd - se;
            exterieur.diff += se - sd;
        }

        // 2) tri : victoires, puis +/-, puis ordre alphabétique
        List<Equipe> classement = new ArrayList<>(equipes.values());
        classement.sort(Comparator
                .comparingInt((Equipe e) -> e.victoires).reversed()
                .thenComparing(Comparator.comparingInt((Equipe e) -> e.diff).reversed())
                .thenComparing(e -> e.nom));

        // 3) égalités parfaites (même victoires et même +/-) : on départage avec les
        //    matchs joués entre ces équipes
        int debut = 0;
        while (debut < classement.size()) {
            int fin = debut + 1;
            while (fin < classement.size()
                    && classement.get(fin).victoires == classement.get(debut).victoires
                    && classement.get(fin).diff == classement.get(debut).diff) {
                fin++;
            }
            if (fin - debut > 1) {
                departager(classement.subList(debut, fin), matchs);
            }
            debut = fin;
        }

        // 4) rang : la position, ou "equal" si l'équipe est identique à la précédente
        List<ClassementLigneDto> lignes = new ArrayList<>();
        for (int i = 0; i < classement.size(); i++) {
            Equipe e = classement.get(i);
            boolean egalite = i > 0 && memeScore(classement.get(i - 1), e);
            lignes.add(new ClassementLigneDto(
                    egalite ? "equal" : String.valueOf(i + 1),
                    e.clubId, e.nom, e.victoires, e.defaites, e.diff));
        }
        return lignes;
    }

    /**
     * Départage des équipes à égalité : 1) victoires dans les confrontations directes,
     * 2) +/- uniquement sur ces confrontations, 3) ordre alphabétique (les équipes
     * restées identiques seront marquées "equal").
     */
    private void departager(List<Equipe> groupe, List<Match> matchs) {
        for (Equipe e : groupe) {
            e.duelsVictoires = 0;
            e.duelsDiff = 0;
        }
        for (Match match : matchs) {
            Equipe domicile = trouver(groupe, match.getClubDomicile().getId());
            Equipe exterieur = trouver(groupe, match.getClubExterieur().getId());
            if (domicile == null || exterieur == null) {
                continue; // ce match ne concerne pas deux équipes du groupe
            }
            int sd = match.getScoreDomicile();
            int se = match.getScoreExterieur();
            if (sd > se) {
                domicile.duelsVictoires++;
            } else if (se > sd) {
                exterieur.duelsVictoires++;
            }
            domicile.duelsDiff += sd - se;
            exterieur.duelsDiff += se - sd;
        }
        groupe.sort(Comparator
                .comparingInt((Equipe e) -> e.duelsVictoires).reversed()
                .thenComparing(Comparator.comparingInt((Equipe e) -> e.duelsDiff).reversed())
                .thenComparing(e -> e.nom));
    }

    private boolean memeScore(Equipe a, Equipe b) {
        return a.victoires == b.victoires
                && a.diff == b.diff
                && a.duelsVictoires == b.duelsVictoires
                && a.duelsDiff == b.duelsDiff;
    }

    private Equipe equipe(Map<Long, Equipe> equipes, Club club) {
        return equipes.computeIfAbsent(club.getId(), id -> new Equipe(id, club.getNom()));
    }

    private Equipe trouver(List<Equipe> groupe, Long clubId) {
        for (Equipe e : groupe) {
            if (e.clubId.equals(clubId)) {
                return e;
            }
        }
        return null;
    }
}