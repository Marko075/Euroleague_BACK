package com.takima.backskeleton.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import java.util.List;

@Entity
@Table(name = "clubs")
public class Club {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nom;
    private String ville;
    private String pays;
    private String stade;
    private String coach;
    @Column(name = "image_coach")
    private byte[] imageCoach;
    @Column(name = "logo_club")
    private byte[] logoClub;
    private String code;
    private String surnom;
    @Column(name = "annee_creation")
    private Integer anneeCreation;
    @Column(name = "couleur_primaire")
    private String couleurPrimaire;
    @Column(name = "couleur_secondaire")
    private String couleurSecondaire;
    @Column(name = "capacite_stade")
    private Integer capaciteStade;
    @Column(name = "titres_euroleague")
    private Integer titresEuroleague;
    @Column(name = "titres_nationaux")
    private Integer titresNationaux;
    private String description;
    private Double latitude;
    private Double longitude;
    @OneToMany(mappedBy = "club")
    @JsonIgnore
    List<Joueur> joueurs;

    public Club() {
    }

    public Club(Long id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public Long getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public String getVille() {
        return ville;
    }

    public String getPays() {
        return pays;
    }

    public String getStade() {
        return stade;
    }

    public String getCoach() {
        return coach;
    }

    public byte[] getImageCoach() {
        return imageCoach;
    }

    public byte[] getLogoClub() {
        return logoClub;
    }

    public String getCode() {
        return code;
    }

    public String getSurnom() {
        return surnom;
    }

    public Integer getAnneeCreation() {
        return anneeCreation;
    }

    public String getCouleurPrimaire() {
        return couleurPrimaire;
    }

    public String getCouleurSecondaire() {
        return couleurSecondaire;
    }

    public Integer getCapaciteStade() {
        return capaciteStade;
    }

    public Integer getTitresEuroleague() {
        return titresEuroleague;
    }

    public Integer getTitresNationaux() {
        return titresNationaux;
    }

    public String getDescription() {
        return description;
    }

    public Double getLatitude() {
        return latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public List<Joueur> getJoueurs() {
        return joueurs;
    }
}
