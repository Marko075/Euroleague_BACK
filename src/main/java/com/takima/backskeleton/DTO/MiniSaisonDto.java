package com.takima.backskeleton.DTO;

import java.util.List;

public record MiniSaisonDto(
        Integer numero,
        List<MatchDto> matchs
) {
}
