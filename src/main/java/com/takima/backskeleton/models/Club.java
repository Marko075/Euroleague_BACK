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
    @OneToMany(mappedBy = "club")
    @JsonIgnore
    List<Joueur> joueurs;

    public Club() {
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

    public List<Joueur> getJoueurs() {
        return joueurs;
    }
}

