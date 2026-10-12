package com.takima.backskeleton.services;

import com.takima.backskeleton.DAO.ClubDao;
import com.takima.backskeleton.DAO.JoueurDao;
import com.takima.backskeleton.DAO.MatchDao;
import com.takima.backskeleton.DTO.BilanClubDto;
import com.takima.backskeleton.DTO.ClassementLigneDto;
import com.takima.backskeleton.DTO.ClassementMiniSaisonDto;
import com.takima.backskeleton.DTO.MatchDto;
import com.takima.backskeleton.models.Club;
import com.takima.backskeleton.models.Joueur;
import com.takima.backskeleton.models.Match;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;

@Component
public class ClubService {
    private static final int TAILLE_FORME = 5;

    private final ClubDao clubDao;
    private final JoueurDao joueurDao;
    private final MatchDao matchDao;
    private final ClassementService classementService;

    public ClubService(ClubDao clubDao, JoueurDao joueurDao, MatchDao matchDao,
                       ClassementService classementService) {
        this.clubDao = clubDao;
        this.joueurDao = joueurDao;
        this.matchDao = matchDao;
        this.classementService = classementService;
    }

    public List<Club> findAll() {
        return clubDao.findAll();
    }

    public Club findById(Long id) {
        return clubDao.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Club " + id + " introuvable"));
    }

    public List<Joueur> findJoueurs(Long clubId) {
        findById(clubId);
        return joueurDao.findByClubIdOrderByNomAsc(clubId);
    }

    @Transactional(readOnly = true)
    public List<MatchDto> findMatchs(Long clubId) {
        findById(clubId);
        List<MatchDto> resultat = new ArrayList<>();
        for (Match match : matchDao.findByClubIdOrdered(clubId)) {
            resultat.add(toMatchDto(match));
        }
        return resultat;
    }

    @Transactional(readOnly = true)
    public BilanClubDto getBilan(Long clubId) {
        findById(clubId);

        int victoires = 0;
        int defaites = 0;
        int pointsMarques = 0;
        int pointsEncaisses = 0;
        List<String> forme = new ArrayList<>();

        // les matchs arrivent du plus récent au plus ancien
        for (Match match : matchDao.findTermines()) {
            boolean aDomicile = clubId.equals(match.getClubDomicile().getId());
            boolean aExterieur = clubId.equals(match.getClubExterieur().getId());
            if (!aDomicile && !aExterieur) {
                continue;
            }
            int pour = aDomicile ? match.getScoreDomicile() : match.getScoreExterieur();
            int contre = aDomicile ? match.getScoreExterieur() : match.getScoreDomicile();
            pointsMarques += pour;
            pointsEncaisses += contre;
            if (pour > contre) {
                victoires++;
            } else {
                defaites++;
            }
            if (forme.size() < TAILLE_FORME) {
                forme.add(pour > contre ? "V" : "D");
            }
        }

        // rang repris du classement officiel (page /classements) : dernière mini-saison jouée
        Integer rang = null;
        Integer miniSaison = null;
        int nombreClubs = 0;
        List<ClassementMiniSaisonDto> classements = classementService.findClassementsSaisonEnCours();
        if (!classements.isEmpty()) {
            ClassementMiniSaisonDto enCours = classements.get(classements.size() - 1);
            miniSaison = enCours.miniSaison();
            nombreClubs = enCours.lignes().size();
            rang = rangDansClassement(enCours.lignes(), clubId);
        }

        return new BilanClubDto(
                clubId,
                victoires + defaites,
                victoires,
                defaites,
                pointsMarques,
                pointsEncaisses,
                rang,
                miniSaison,
                nombreClubs,
                forme
        );
    }

    // "equal" = même place que l'équipe précédente
    private Integer rangDansClassement(List<ClassementLigneDto> lignes, Long clubId) {
        Integer dernierRang = null;
        for (ClassementLigneDto ligne : lignes) {
            if (!"equal".equals(ligne.rang())) {
                dernierRang = Integer.valueOf(ligne.rang());
            }
            if (clubId.equals(ligne.clubId())) {
                return dernierRang;
            }
        }
        return null;
    }

    private MatchDto toMatchDto(Match match) {
        return new MatchDto(
                match.getId(),
                match.getJournee(),
                match.getDateMatch(),
                match.getStatut(),
                match.getClubDomicile().getId(),
                match.getClubDomicile().getNom(),
                match.getScoreDomicile(),
                match.getClubExterieur().getId(),
                match.getClubExterieur().getNom(),
                match.getScoreExterieur()
        );
    }
}
