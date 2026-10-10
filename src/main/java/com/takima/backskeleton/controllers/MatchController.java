package com.takima.backskeleton.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.takima.backskeleton.DTO.MatchStatsDto;
import com.takima.backskeleton.services.MatchService;

@RestController
@CrossOrigin
@RequestMapping("/matchs")
public class MatchController {

    private final MatchService matchService;

    public MatchController(MatchService matchService) {
        this.matchService = matchService;
    }

    // Les 5 derniers matchs joués, avec les statistiques des joueurs et le MVP
    @GetMapping("/derniers")
    public List<MatchStatsDto> findDerniersMatchsJoues() {
        return matchService.findDerniersMatchsJoues();
    }
}