package com.takima.backskeleton.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

import java.time.LocalDate;

@Entity
@Table(name = "joueurs")
public class Joueur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nom;
    private String prenom;
    private LocalDate anniversaire;
    private String nationalite;
    private Integer taille;
    private String poste;
    @Column(name = "photo_joueur")
    private byte[] photoJoueur;
    @ManyToOne
    @JoinColumn(name = "club_id")
    private Club club;

    public Joueur() {
    }

    public Long getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public LocalDate getAnniversaire() {
        return anniversaire;
    }

    public String getNationalite() {
        return nationalite;
    }

    public Integer getTaille() {
        return taille;
    }

    public String getPoste() {
        return poste;
    }

    public byte[] getPhotoJoueur() {
        return photoJoueur;
    }

    public Club getClub() {
        return club;
    }
}
