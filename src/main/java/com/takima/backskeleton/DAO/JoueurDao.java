package com.takima.backskeleton.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

<<<<<<< HEAD
import com.takima.backskeleton.models.Joueur;

=======
import java.util.List;
>>>>>>> 2104399e9c51de94f53d3eb9414d9acd395f9704

@Repository
public interface JoueurDao extends JpaRepository<Joueur, Long> {

<<<<<<< HEAD
    @Query("""
    SELECT j FROM Joueur j
    LEFT JOIN FETCH j.club
    ORDER BY j.nom, j.prenom
    """)
List<Joueur> findAllWithClubOrdered();

}

=======
    // Effectif d'un club, trié par nom
    List<Joueur> findByClubIdOrderByNomAsc(Long clubId);
}
>>>>>>> 2104399e9c51de94f53d3eb9414d9acd395f9704
