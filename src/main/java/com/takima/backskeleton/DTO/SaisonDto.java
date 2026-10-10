package com.takima.backskeleton.DTO;

import java.time.LocalDate;
import java.util.List;

public record SaisonDto(
        Long id,
        String nom,
        LocalDate dateDebut,
        LocalDate dateFin,
        String statut,
        List<MiniSaisonDto> miniSaisons
) {
}