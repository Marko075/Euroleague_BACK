package com.takima.backskeleton.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.takima.backskeleton.models.Joueur;

@Repository
public interface JoueurDao extends JpaRepository<Joueur, Long> {

    // Tous les joueurs avec leur club, triés par nom puis prénom (page Statistiques)
    @Query("""
            SELECT j FROM Joueur j
            LEFT JOIN FETCH j.club
            ORDER BY j.nom, j.prenom
            """)
    List<Joueur> findAllWithClubOrdered();

    // Effectif d'un club, trié par nom
    List<Joueur> findByClubIdOrderByNomAsc(Long clubId);
}
