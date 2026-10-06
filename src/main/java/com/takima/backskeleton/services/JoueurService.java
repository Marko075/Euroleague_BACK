package com.takima.backskeleton.services;

import com.takima.backskeleton.DAO.JoueurDao;
import com.takima.backskeleton.models.Joueur;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class JoueurService {
    private final JoueurDao joueurDao;

    public JoueurService(JoueurDao joueurDao) {
        this.joueurDao = joueurDao;
    }

    public List<Joueur> findAll() {
        return joueurDao.findAll();
    }

    public Optional<Joueur> findById(Long id) {
        return joueurDao.findById(id);
    }
}