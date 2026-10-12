package com.takima.backskeleton.DTO;

import java.util.List;

// Bilan d'un club calculé à partir des matchs terminés
public record BilanClubDto(
        Long clubId,
        int matchsJoues,
        int victoires,
        int defaites,
        int pointsMarques,
        int pointsEncaisses,
        // rang dans le classement de la mini-saison en cours (celui de /classements), null si aucun match joué
        Integer rang,
        Integer miniSaison,
        int nombreClubs,
        // résultats des 5 derniers matchs, du plus récent au plus ancien ("V" ou "D")
        List<String> forme
) {
}
