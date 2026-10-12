package com.takima.backskeleton.DTO;

public record StatsPeriodeJoueurDto(
        Long joueurId,
        String nom,
        String prenom,
        String clubNom,
        String poste,
        Long matchsJoues,
        Long points,
        Long rebonds,
        Long passesDecisives,
        Long nbMvp
) {
}