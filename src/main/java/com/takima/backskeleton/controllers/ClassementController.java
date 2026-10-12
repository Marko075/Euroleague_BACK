package com.takima.backskeleton.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.takima.backskeleton.DTO.ClassementMiniSaisonDto;
import com.takima.backskeleton.services.ClassementService;

@RestController
@RequestMapping("/classements")
public class ClassementController {

    private final ClassementService classementService;

    public ClassementController(ClassementService classementService) {
        this.classementService = classementService;
    }

    // Classement de chaque mini-saison de la saison en cours
    @GetMapping
    public List<ClassementMiniSaisonDto> findClassements() {
        return classementService.findClassementsSaisonEnCours();
    }
}