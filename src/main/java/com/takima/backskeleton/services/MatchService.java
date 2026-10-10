package com.takima.backskeleton.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.takima.backskeleton.DAO.MatchDao;
import com.takima.backskeleton.DAO.StatsJoueurMatchDao;
import com.takima.backskeleton.DTO.MatchStatsDto;
import com.takima.backskeleton.DTO.StatsJoueurDto;
import com.takima.backskeleton.models.Joueur;
import com.takima.backskeleton.models.Match;
import com.takima.backskeleton.models.StatsJoueurMatch;

@Service
public class MatchService {

    private static final int NB_DERNIERS_MATCHS = 5;

    private final MatchDao matchDao;
    private final StatsJoueurMatchDao statsJoueurMatchDao;

    public MatchService(MatchDao matchDao, StatsJoueurMatchDao statsJoueurMatchDao) {
        this.matchDao = matchDao;
        this.statsJoueurMatchDao = statsJoueurMatchDao;
    }

    @Transactional(readOnly = true)
    public List<MatchStatsDto> findDerniersMatchsJoues() {
        // 1) les 5 derniers matchs joués
        List<Match> matchs = matchDao.findDerniersMatchsJoues(PageRequest.of(0, NB_DERNIERS_MATCHS));
        if (matchs.isEmpty()) {
            return new ArrayList<>();
        }

        // 2) toutes leurs statistiques, en une seule requête
        List<Long> matchIds = new ArrayList<>();
        for (Match match : matchs) {
            matchIds.add(match.getId());
        }

        Map<Long, List<StatsJoueurMatch>> statsParMatch = new HashMap<>();
        for (StatsJoueurMatch stats : statsJoueurMatchDao.findByMatchIds(matchIds)) {
            statsParMatch
                    .computeIfAbsent(stats.getMatch().getId(), k -> new ArrayList<>())
                    .add(stats);
        }

        // 3) un DTO par match, dans le même ordre (le plus récent d'abord)
        List<MatchStatsDto> resultat = new ArrayList<>();
        for (Match match : matchs) {
            List<StatsJoueurMatch> statsDuMatch =
                    statsParMatch.getOrDefault(match.getId(), new ArrayList<>());
            resultat.add(toMatchStatsDto(match, statsDuMatch));
        }
        return resultat;
    }

    private MatchStatsDto toMatchStatsDto(Match match, List<StatsJoueurMatch> statsDuMatch) {
        Long clubDomicileId = match.getClubDomicile().getId();

        // répartition des joueurs entre l'équipe à domicile et l'équipe extérieure
        List<StatsJoueurDto> statsDomicile = new ArrayList<>();
        List<StatsJoueurDto> statsExterieur = new ArrayList<>();
        for (StatsJoueurMatch stats : statsDuMatch) {
            StatsJoueurDto dto = toStatsJoueurDto(stats);
            if (stats.getJoueur().getClub().getId().equals(clubDomicileId)) {
                statsDomicile.add(dto);
            } else {
                statsExterieur.add(dto);
            }
        }

        // le MVP peut être absent
        Joueur mvp = match.getMvp();
        Long mvpId = mvp != null ? mvp.getId() : null;
        String mvpNom = mvp != null ? mvp.getNom() : null;
        String mvpPrenom = mvp != null ? mvp.getPrenom() : null;

        return new MatchStatsDto(
                match.getId(),
                match.getMiniSaison(),
                match.getJournee(),
                match.getDateMatch(),
                clubDomicileId,
                match.getClubDomicile().getNom(),
                match.getScoreDomicile(),
                match.getClubExterieur().getId(),
                match.getClubExterieur().getNom(),
                match.getScoreExterieur(),
                mvpId,
                mvpNom,
                mvpPrenom,
                statsDomicile,
                statsExterieur
        );
    }

    private StatsJoueurDto toStatsJoueurDto(StatsJoueurMatch stats) {
        Joueur joueur = stats.getJoueur();
        return new StatsJoueurDto(
                joueur.getId(),
                joueur.getNom(),
                joueur.getPrenom(),
                joueur.getPoste(),
                stats.getPoints(),
                stats.getLancersFrancs(),
                stats.getDeuxPoints(),
                stats.getTroisPoints(),
                stats.getRebonds(),
                stats.getPassesDecisives(),
                stats.getInterceptions()
        );
    }
}