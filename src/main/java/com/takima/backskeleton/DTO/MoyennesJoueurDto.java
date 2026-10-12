package com.takima.backskeleton.DTO;

// Moyennes par match d'un joueur sur tous ses matchs joués : base de la simulation
public record MoyennesJoueurDto(
        Long joueurId,
        Long matchs,
        Double lancersFrancs,
        Double deuxPoints,
        Double troisPoints,
        Double rebonds,
        Double passesDecisives,
        Double interceptions
) {
}
