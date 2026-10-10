package com.takima.backskeleton.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.takima.backskeleton.DTO.SaisonDto;
import com.takima.backskeleton.services.SaisonService;


@RestController
@RequestMapping("/saisons")
@CrossOrigin
public class SaisonController {

    private final SaisonService saisonService;

    public SaisonController(SaisonService saisonService) {
        this.saisonService = saisonService;
    }

    @GetMapping
    public List<SaisonDto> findAll() {
        return saisonService.findAll();
    }
}