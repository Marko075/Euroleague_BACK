package com.takima.backskeleton.DAO;

import com.takima.backskeleton.models.Joueur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JoueurDao extends JpaRepository<Joueur, Long> {

    // Effectif d'un club, trié par nom
    List<Joueur> findByClubIdOrderByNomAsc(Long clubId);
}
