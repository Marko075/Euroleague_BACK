package com.takima.backskeleton.controllers;

import com.takima.backskeleton.models.Joueur;
import com.takima.backskeleton.services.JoueurService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RequestMapping("joueurs")
@RestController
public class JoueurController {
    private final JoueurService joueurService;

    public JoueurController(JoueurService joueurService) {
        this.joueurService = joueurService;
    }

    @GetMapping("")
    public List<Joueur> getAllJoueurs() {
        return joueurService.findAll();
    }
}