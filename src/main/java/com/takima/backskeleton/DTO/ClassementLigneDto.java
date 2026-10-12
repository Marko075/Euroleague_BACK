package com.takima.backskeleton.DTO;

public record ClassementLigneDto(
        String rang,
        Long clubId,
        String clubNom,
        Integer victoires,
        Integer defaites,
        Integer diff
) {
}