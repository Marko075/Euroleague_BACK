package com.takima.backskeleton.DAO;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.takima.backskeleton.models.Match;

@Repository
public interface MatchDao extends JpaRepository<Match, Long> {

    // Tous les matchs d'une saison, triés par mini-saison, journée puis date
    @Query("""
            SELECT m FROM Match m
            JOIN FETCH m.clubDomicile
            JOIN FETCH m.clubExterieur
            WHERE m.saison.id = :saisonId
            ORDER BY m.miniSaison, m.journee, m.dateMatch
            """)
    List<Match> findBySaisonIdOrdered(@Param("saisonId") Long saisonId);

    @Query("""
            SELECT m FROM Match m
            JOIN FETCH m.clubDomicile
            JOIN FETCH m.clubExterieur
            LEFT JOIN FETCH m.mvp
            WHERE m.statut = 'TERMINE'
              AND EXISTS (SELECT 1 FROM StatsJoueurMatch st WHERE st.match = m)
            ORDER BY m.dateMatch DESC
            """)
    List<Match> findDerniersMatchsJoues(Pageable pageable);
}