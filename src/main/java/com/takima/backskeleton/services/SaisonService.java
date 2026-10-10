
package com.takima.backskeleton.services;

import com.takima.backskeleton.DAO.MatchDao;
import com.takima.backskeleton.DAO.SaisonDao;
import com.takima.backskeleton.DTO.MatchDto;
import com.takima.backskeleton.DTO.MiniSaisonDto;
import com.takima.backskeleton.DTO.SaisonDto;
import com.takima.backskeleton.models.Match;
import com.takima.backskeleton.models.Saison;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.ArrayList;

 
@Service
public class SaisonService {
 
    private final SaisonDao saisonDao;
    private final MatchDao matchDao;
 
    public SaisonService(SaisonDao saisonDao, MatchDao matchDao) {
        this.saisonDao = saisonDao;
        this.matchDao = matchDao;
    }
 
    @Transactional(readOnly = true)
    public List<SaisonDto> findAll() {
        return saisonDao.findAllByOrderByDateDebutDesc().stream()
                .map(this::toSaisonDto)
                .toList();
    }
 
    private SaisonDto toSaisonDto(Saison saison) {
    List<Match> matchs = matchDao.findBySaisonIdOrdered(saison.getId());

    // Regroupe les matchs par mini-saison (TreeMap = trié par numéro)
    Map<Integer, List<MatchDto>> parMiniSaison = new TreeMap<>();
    for (Match match : matchs) {
        parMiniSaison
                .computeIfAbsent(match.getMiniSaison(), k -> new ArrayList<>())
                .add(toMatchDto(match));
    }

    List<MiniSaisonDto> miniSaisons = new ArrayList<>();
    for (Map.Entry<Integer, List<MatchDto>> entry : parMiniSaison.entrySet()) {
        miniSaisons.add(new MiniSaisonDto(entry.getKey(), entry.getValue()));
    }

    return new SaisonDto(
            saison.getId(),
            saison.getNom(),
            saison.getDateDebut(),
            saison.getDateFin(),
            saison.getStatut(),
            miniSaisons
    );
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
