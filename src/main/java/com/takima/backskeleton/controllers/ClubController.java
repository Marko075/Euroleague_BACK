package com.takima.backskeleton.controllers;

import com.takima.backskeleton.models.Club;
import com.takima.backskeleton.services.ClubService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
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
    public List<Club> getAllJoueurs() {
        return clubService.findAll();
    }
}