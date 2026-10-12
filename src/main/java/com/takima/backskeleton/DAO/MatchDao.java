package com.takima.backskeleton.DAO;

import java.util.List;

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

    // Matchs joués (terminés et avec des statistiques), du plus récent au plus ancien.
    // Chaque filtre est optionnel : s'il vaut null, il est ignoré.
    @Query("""
            SELECT m FROM Match m
            JOIN FETCH m.clubDomicile
            JOIN FETCH m.clubExterieur
            LEFT JOIN FETCH m.mvp
            WHERE m.statut = 'TERMINE'
              AND EXISTS (SELECT 1 FROM StatsJoueurMatch st WHERE st.match = m)
              AND (:miniSaison IS NULL OR m.miniSaison = :miniSaison)
              AND (:journee IS NULL OR m.journee = :journee)
              AND (:clubId IS NULL
                   OR m.clubDomicile.id = :clubId
                   OR m.clubExterieur.id = :clubId)
            ORDER BY m.dateMatch DESC
            """)
<<<<<<< HEAD
    List<Match> findDerniersMatchsJoues(Pageable pageable);

    // Nombre de fois où un joueur a été MVP
        @Query("""
        SELECT COUNT(m)
        FROM Match m
        WHERE m.saison.statut = 'EN_COURS'
        AND m.statut = 'TERMINE'
        AND m.mvp.id = :joueurId
        AND (:miniSaison IS NULL OR m.miniSaison = :miniSaison)
        AND (:journee IS NULL OR m.journee = :journee)
        """)
        Long countMvpByJoueurAndPeriode(
        @Param("joueurId") Long joueurId,
        @Param("miniSaison") Integer miniSaison,
        @Param("journee") Integer journee
        );


        @Query("""
        SELECT DISTINCT m.journee
        FROM Match m
        WHERE m.saison.statut = 'EN_COURS'
        AND m.miniSaison = :miniSaison
        AND m.statut = 'TERMINE'
        ORDER BY m.journee
        """)
        List<Integer> findJourneesTerminees(
        @Param("miniSaison") Integer miniSaison
        );
=======
    List<Match> findMatchsJoues(@Param("miniSaison") Integer miniSaison,
                                @Param("journee") Integer journee,
                                @Param("clubId") Long clubId);

    // Tous les matchs d'un club (domicile ou extérieur), triés par date
    @Query("""
            SELECT m FROM Match m
            JOIN FETCH m.clubDomicile
            JOIN FETCH m.clubExterieur
            WHERE m.clubDomicile.id = :clubId OR m.clubExterieur.id = :clubId
            ORDER BY m.dateMatch
            """)
    List<Match> findByClubIdOrdered(@Param("clubId") Long clubId);

    // Tous les matchs terminés, du plus récent au plus ancien
    @Query("""
            SELECT m FROM Match m
            JOIN FETCH m.clubDomicile
            JOIN FETCH m.clubExterieur
            WHERE m.statut = 'TERMINE'
              AND m.scoreDomicile IS NOT NULL
              AND m.scoreExterieur IS NOT NULL
            ORDER BY m.dateMatch DESC
            """)
    List<Match> findTermines();
>>>>>>> 2104399e9c51de94f53d3eb9414d9acd395f9704
}