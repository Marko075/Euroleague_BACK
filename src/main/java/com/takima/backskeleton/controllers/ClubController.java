package com.takima.backskeleton.controllers;

import com.takima.backskeleton.DTO.BilanClubDto;
import com.takima.backskeleton.DTO.MatchDto;
import com.takima.backskeleton.models.Club;
import com.takima.backskeleton.models.Joueur;
import com.takima.backskeleton.services.ClubService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RequestMapping("clubs")
@RestController
public class ClubController {
    private final ClubService clubService;

    public ClubController(ClubService clubService) {
        this.clubService = clubService;
    }

    @GetMapping("")
    public List<Club> getAllClubs() {
        return clubService.findAll();
    }

    // 404 si le club n'existe pas
    @GetMapping("/{id}")
    public Club getClub(@PathVariable Long id) {
        return clubService.findById(id);
    }

    @GetMapping("/{id}/joueurs")
    public List<Joueur> getJoueursDuClub(@PathVariable Long id) {
        return clubService.findJoueurs(id);
    }

    // Tous les matchs du club (joués et à venir), triés par date
    @GetMapping("/{id}/matchs")
    public List<MatchDto> getMatchsDuClub(@PathVariable Long id) {
        return clubService.findMatchs(id);
    }

    // Victoires, défaites, points, rang et forme récente
    @GetMapping("/{id}/bilan")
    public BilanClubDto getBilanDuClub(@PathVariable Long id) {
        return clubService.getBilan(id);
    }
}
