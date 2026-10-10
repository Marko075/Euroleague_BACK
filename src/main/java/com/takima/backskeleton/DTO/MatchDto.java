package com.takima.backskeleton.DTO;

import java.time.LocalDateTime;

public record MatchDto(
        Long id,
        Integer journee,
        LocalDateTime dateMatch,
        String statut,
        Long clubDomicileId,
        String clubDomicileNom,
        Integer scoreDomicile,
        Long clubExterieurId,
        String clubExterieurNom,
        Integer scoreExterieur
) {
}