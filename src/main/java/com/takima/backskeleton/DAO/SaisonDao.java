package com.takima.backskeleton.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.takima.backskeleton.models.Saison;

@Repository
public interface SaisonDao extends JpaRepository<Saison, Long> {

    // Toutes les saisons, la plus récente en premier
    List<Saison> findAllByOrderByDateDebutDesc();

    // Par statut : EN_COURS, TERMINEE, A_VENIR
    List<Saison> findByStatut(String statut);
}