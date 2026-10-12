
package com.takima.backskeleton.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.takima.backskeleton.models.StatsJoueurMatch;

@Repository
public interface StatsJoueurMatchDao
        extends JpaRepository<StatsJoueurMatch, Long> {

    // Récupère les statistiques des joueurs pour une liste de matchs,
    // triées par points décroissants puis par identifiant.
    @Query("""
            SELECT st FROM StatsJoueurMatch st
            JOIN FETCH st.joueur j
            JOIN FETCH j.club
            WHERE st.match.id IN :matchIds
            ORDER BY st.points DESC, st.id
            """)
    List<StatsJoueurMatch> findByMatchIds(
            @Param("matchIds") List<Long> matchIds
    );

    // Compte les matchs terminés auxquels le joueur a participé.
    @Query("""
            SELECT COUNT(DISTINCT st.match.id)
            FROM StatsJoueurMatch st
            WHERE st.joueur.id = :joueurId
              AND st.match.statut = 'TERMINE'
              AND st.match.saison.statut = 'EN_COURS'
              AND (:miniSaison IS NULL
                   OR st.match.miniSaison = :miniSaison)
              AND (:journee IS NULL
                   OR st.match.journee = :journee)
            """)
    Long compterMatchsJoues(
            @Param("joueurId") Long joueurId,
            @Param("miniSaison") Integer miniSaison,
            @Param("journee") Integer journee
    );

    // Calcule le total de points du joueur.
    @Query("""
            SELECT COALESCE(SUM(st.points), 0)
            FROM StatsJoueurMatch st
            WHERE st.joueur.id = :joueurId
              AND st.match.statut = 'TERMINE'
              AND st.match.saison.statut = 'EN_COURS'
              AND (:miniSaison IS NULL
                   OR st.match.miniSaison = :miniSaison)
              AND (:journee IS NULL
                   OR st.match.journee = :journee)
            """)
    Long totalPoints(
            @Param("joueurId") Long joueurId,
            @Param("miniSaison") Integer miniSaison,
            @Param("journee") Integer journee
    );

    // Calcule le total de rebonds du joueur.
    @Query("""
            SELECT COALESCE(SUM(st.rebonds), 0)
            FROM StatsJoueurMatch st
            WHERE st.joueur.id = :joueurId
              AND st.match.statut = 'TERMINE'
              AND st.match.saison.statut = 'EN_COURS'
              AND (:miniSaison IS NULL
                   OR st.match.miniSaison = :miniSaison)
              AND (:journee IS NULL
                   OR st.match.journee = :journee)
            """)
    Long totalRebonds(
            @Param("joueurId") Long joueurId,
            @Param("miniSaison") Integer miniSaison,
            @Param("journee") Integer journee
    );

    // Calcule le total de passes décisives du joueur.
    @Query("""
            SELECT COALESCE(SUM(st.passesDecisives), 0)
            FROM StatsJoueurMatch st
            WHERE st.joueur.id = :joueurId
              AND st.match.statut = 'TERMINE'
              AND st.match.saison.statut = 'EN_COURS'
              AND (:miniSaison IS NULL
                   OR st.match.miniSaison = :miniSaison)
              AND (:journee IS NULL
                   OR st.match.journee = :journee)
            """)
    Long totalPassesDecisives(
            @Param("joueurId") Long joueurId,
            @Param("miniSaison") Integer miniSaison,
            @Param("journee") Integer journee
    );
}
