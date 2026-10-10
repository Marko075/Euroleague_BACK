package com.takima.backskeleton.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "stats_joueurs_match")
public class StatsJoueurMatch {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "match_id", nullable = false)
    private Match match;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "joueur_id", nullable = false)
    private Joueur joueur;

    @Column(name = "lancers_francs")
    private Integer lancersFrancs;

    @Column(name = "deux_points")
    private Integer deuxPoints;

    @Column(name = "trois_points")
    private Integer troisPoints;

    private Integer rebonds;

    @Column(name = "passes_decisives")
    private Integer passesDecisives;

    private Integer interceptions;

    // Colonne calculée par PostgreSQL : lecture seule
    @Column(name = "points", insertable = false, updatable = false)
    private Integer points;

    public StatsJoueurMatch() {
    }

    public Long getId() {
        return id;
    }

    public Match getMatch() {
        return match;
    }

    public Joueur getJoueur() {
        return joueur;
    }

    public Integer getLancersFrancs() {
        return lancersFrancs;
    }

    public Integer getDeuxPoints() {
        return deuxPoints;
    }

    public Integer getTroisPoints() {
        return troisPoints;
    }

    public Integer getRebonds() {
        return rebonds;
    }

    public Integer getPassesDecisives() {
        return passesDecisives;
    }

    public Integer getInterceptions() {
        return interceptions;
    }

    public Integer getPoints() {
        return points;
    }
}