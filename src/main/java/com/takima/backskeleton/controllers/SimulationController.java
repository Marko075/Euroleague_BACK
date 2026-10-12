package com.takima.backskeleton.controllers;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.takima.backskeleton.DTO.MatchStatsDto;
import com.takima.backskeleton.services.SimulationService;

/**
 * Simulation des matchs d'une mini-saison. Les matchs simulés sont enregistrés en base :
 * ils apparaissent ensuite dans /matchs/derniers, /classements, /saisons, les bilans des clubs...
 * Codes de retour : 404 si la saison, la mini-saison ou la journée n'existe pas,
 * 409 si les matchs visés ont déjà tous été joués.
 */
@RestController
@CrossOrigin
@RequestMapping("/saisons/{saisonId}/mini-saisons/{miniSaison}")
public class SimulationController {

    private final SimulationService simulationService;

    public SimulationController(SimulationService simulationService) {
        this.simulationService = simulationService;
    }

    // Joue tous les matchs encore « à venir » de la mini-saison ; renvoie les matchs simulés avec leurs stats
    @PostMapping("/simulation")
    public List<MatchStatsDto> simulerMiniSaison(@PathVariable Long saisonId, @PathVariable int miniSaison) {
        return simulationService.simulerMiniSaison(saisonId, miniSaison);
    }

    // Même chose pour une seule journée
    @PostMapping("/journees/{journee}/simulation")
    public List<MatchStatsDto> simulerJournee(@PathVariable Long saisonId, @PathVariable int miniSaison,
                                              @PathVariable int journee) {
        return simulationService.simulerJournee(saisonId, miniSaison, journee);
    }

    // Annule les résultats : les matchs de la mini-saison redeviennent « à venir » (204, sans contenu)
    @DeleteMapping("/simulation")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void reinitialiserMiniSaison(@PathVariable Long saisonId, @PathVariable int miniSaison) {
        simulationService.reinitialiserMiniSaison(saisonId, miniSaison);
    }
}
