package com.takima.backskeleton.models;

import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "matchs")
public class Match {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "saison_id", nullable = false)
    private Saison saison;

    @Column(name = "mini_saison")
    private Integer miniSaison;

    private Integer journee;

    @ManyToOne
    @JoinColumn(name = "club_domicile_id", nullable = false)
    private Club clubDomicile;

    @ManyToOne
    @JoinColumn(name = "club_exterieur_id", nullable = false)
    private Club clubExterieur;

    @Column(name = "date_match")
    private LocalDateTime dateMatch;

    private String statut; // A_VENIR, EN_COURS, TERMINE

    @Column(name = "score_domicile")
    private Integer scoreDomicile;

    @Column(name = "score_exterieur")
    private Integer scoreExterieur;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mvp_id")
    private Joueur mvp;

    @OneToMany(mappedBy = "match")
    @JsonIgnore
    private List<StatsJoueurMatch> stats;

    public Match() {
    }

    public Long getId() {
        return id;
    }

    public Saison getSaison() {
        return saison;
    }

    public Integer getMiniSaison() {
        return miniSaison;
    }

    public Integer getJournee() {
        return journee;
    }

    public Club getClubDomicile() {
        return clubDomicile;
    }

    public Club getClubExterieur() {
        return clubExterieur;
    }

    public LocalDateTime getDateMatch() {
        return dateMatch;
    }

    public String getStatut() {
        return statut;
    }

    public Integer getScoreDomicile() {
        return scoreDomicile;
    }

    public Integer getScoreExterieur() {
        return scoreExterieur;
    }

    public Joueur getMvp() {
        return mvp;
    }

    public List<StatsJoueurMatch> getStats() {
        return stats;
    }
}