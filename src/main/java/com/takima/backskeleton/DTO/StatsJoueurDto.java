package com.takima.backskeleton.DTO;

public record StatsJoueurDto(
        Long joueurId,
        String nom,
        String prenom,
        String poste,
        Integer points,
        Integer lancersFrancs,
        Integer deuxPoints,
        Integer troisPoints,
        Integer rebonds,
        Integer passesDecisives,
        Integer interceptions
) {
}