
package com.takima.backskeleton.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.takima.backskeleton.DTO.JoueurOptionDto;
import com.takima.backskeleton.DTO.PeriodeDto;
import com.takima.backskeleton.DTO.StatsPeriodeJoueurDto;
import com.takima.backskeleton.services.StatistiquesService;

@RestController
@CrossOrigin 
@RequestMapping("/statistiques")
public class StatistiquesController {

    private final StatistiquesService statistiquesService;

    public StatistiquesController(
            StatistiquesService statistiquesService
    ) {
        this.statistiquesService = statistiquesService;
    }

    // Liste des mini-saisons et des journées terminées
    @GetMapping("/periodes")
    public List<PeriodeDto> getPeriodes() {
        return statistiquesService.getPeriodes();
    }

    // Liste de tous les joueurs
    @GetMapping("/joueurs")
    public List<JoueurOptionDto> getJoueurs() {
        return statistiquesService.getJoueurs();
    }

    // Statistiques d'un joueur sur la période choisie
    @GetMapping("/joueurs/{joueurId}")
    public StatsPeriodeJoueurDto getStatistiquesJoueur(
            @PathVariable Long joueurId,
            @RequestParam(required = false) Integer miniSaison,
            @RequestParam(required = false) Integer journee
    ) {
        return statistiquesService.getStatistiquesJoueur(
                joueurId,
                miniSaison,
                journee
        );
    }
}
