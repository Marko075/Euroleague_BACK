package com.takima.backskeleton.DTO;

public record JoueurOptionDto(
        Long id,
        String nom,
        String prenom,
        String clubNom
) {
}