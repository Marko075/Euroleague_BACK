package com.takima.backskeleton.DTO;

import java.util.List;

public record ClassementMiniSaisonDto(
        Integer miniSaison,
        Integer journee,
        List<ClassementLigneDto> lignes
) {
}