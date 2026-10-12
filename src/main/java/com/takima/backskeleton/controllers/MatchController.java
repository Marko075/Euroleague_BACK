package com.takima.backskeleton.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    // Matchs joués, avec les statistiques des joueurs et le MVP.
    // Filtres optionnels et cumulables, par exemple :
    //   GET /matchs
    //   GET /matchs?miniSaison=1
    //   GET /matchs?miniSaison=2&journee=10&clubId=3
    @GetMapping("")
    public List<MatchStatsDto> findMatchsJoues(
            @RequestParam(required = false) Integer miniSaison,
            @RequestParam(required = false) Integer journee,
            @RequestParam(required = false) Long clubId) {
        return matchService.findMatchsJoues(miniSaison, journee, clubId);
    }
}