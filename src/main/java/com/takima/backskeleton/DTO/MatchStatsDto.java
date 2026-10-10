package com.takima.backskeleton.DTO;

import java.time.LocalDateTime;
import java.util.List;

public record MatchStatsDto(
        Long id,
        Integer miniSaison,
        Integer journee,
        LocalDateTime dateMatch,

        Long clubDomicileId,
        String clubDomicileNom,
        Integer scoreDomicile,

        Long clubExterieurId,
        String clubExterieurNom,
        Integer scoreExterieur,

        Long mvpId,
        String mvpNom,
        String mvpPrenom,

        List<StatsJoueurDto> statsDomicile,
        List<StatsJoueurDto> statsExterieur
) {
}