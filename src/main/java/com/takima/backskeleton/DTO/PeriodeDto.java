package com.takima.backskeleton.DTO;

import java.util.List;

public record PeriodeDto(
        Integer miniSaison,
        List<Integer> journees
) {
}