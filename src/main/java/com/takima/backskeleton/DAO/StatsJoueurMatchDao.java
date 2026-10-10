package com.takima.backskeleton.DAO;

import com.takima.backskeleton.models.StatsJoueurMatch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StatsJoueurMatchDao extends JpaRepository<StatsJoueurMatch, Long> {

    // Toutes les stats d'une liste de matchs, en une seule requête,
    // triées par points décroissants dans chaque match
    @Query("""
            SELECT st FROM StatsJoueurMatch st
            JOIN FETCH st.joueur j
            JOIN FETCH j.club
            WHERE st.match.id IN :matchIds
            ORDER BY st.points DESC, st.id
            """)
    List<StatsJoueurMatch> findByMatchIds(@Param("matchIds") List<Long> matchIds);
}