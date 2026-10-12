
package com.takima.backskeleton.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import com.takima.backskeleton.DAO.JoueurDao;
import com.takima.backskeleton.DAO.MatchDao;
import com.takima.backskeleton.DAO.StatsJoueurMatchDao;
import com.takima.backskeleton.DTO.JoueurOptionDto;
import com.takima.backskeleton.DTO.PeriodeDto;
import com.takima.backskeleton.DTO.StatsPeriodeJoueurDto;
import com.takima.backskeleton.models.Joueur;

@Service
@Transactional(readOnly = true)
public class StatistiquesService {

    private final JoueurDao joueurDao;
    private final MatchDao matchDao;
    private final StatsJoueurMatchDao statsJoueurMatchDao;

    public StatistiquesService(
            JoueurDao joueurDao,
            MatchDao matchDao,
            StatsJoueurMatchDao statsJoueurMatchDao
    ) {
        this.joueurDao = joueurDao;
        this.matchDao = matchDao;
        this.statsJoueurMatchDao = statsJoueurMatchDao;
    }

    // Retourne les quatre mini-saisons et leurs journées terminées.
    public List<PeriodeDto> getPeriodes() {
        List<PeriodeDto> periodes = new ArrayList<>();

        for (int miniSaison = 1; miniSaison <= 4; miniSaison++) {
            List<Integer> journees =
                    matchDao.findJourneesTerminees(miniSaison);

            periodes.add(new PeriodeDto(miniSaison, journees));
        }

        return periodes;
    }

    // Retourne les joueurs pour la liste déroulante.
    public List<JoueurOptionDto> getJoueurs() {
        return joueurDao.findAllWithClubOrdered()
                .stream()
                .map(joueur -> new JoueurOptionDto(
                        joueur.getId(),
                        joueur.getNom(),
                        joueur.getPrenom(),
                        joueur.getClub() != null
                                ? joueur.getClub().getNom()
                                : null
                ))
                .toList();
    }

    // Calcule les statistiques d'un joueur sur la période choisie.
    public StatsPeriodeJoueurDto getStatistiquesJoueur(
            Long joueurId,
            Integer miniSaison,
            Integer journee
    ) {
        // Vérifie que la mini-saison est valide.
        if (miniSaison != null
                && (miniSaison < 1 || miniSaison > 4)) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "La mini-saison doit être comprise entre 1 et 4."
            );
        }

        // Une journée doit obligatoirement appartenir à une mini-saison.
        if (journee != null && miniSaison == null) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Une journée nécessite une mini-saison."
            );
        }

        // Vérifie que la journée possède au moins un match terminé.
        if (journee != null
                && !matchDao.findJourneesTerminees(miniSaison)
                        .contains(journee)) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Cette journée n'a pas encore de match terminé."
            );
        }

        // Recherche le joueur.
        Joueur joueur = joueurDao.findById(joueurId)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND,
                        "Joueur introuvable."
                ));

        // Calcule séparément chaque statistique.
        Long matchsJoues =
                statsJoueurMatchDao.compterMatchsJoues(
                        joueurId, miniSaison, journee
                );

        Long points =
                statsJoueurMatchDao.totalPoints(
                        joueurId, miniSaison, journee
                );

        Long rebonds =
                statsJoueurMatchDao.totalRebonds(
                        joueurId, miniSaison, journee
                );

        Long passesDecisives =
                statsJoueurMatchDao.totalPassesDecisives(
                        joueurId, miniSaison, journee
                );

        // Compte le nombre de fois où le joueur a été MVP.
        Long nbMvp = matchDao.countMvpByJoueurAndPeriode(
                joueurId,
                miniSaison,
                journee
        );

        // Construit et retourne le DTO des statistiques.
        return new StatsPeriodeJoueurDto(
                joueur.getId(),
                joueur.getNom(),
                joueur.getPrenom(),
                joueur.getClub() != null
                        ? joueur.getClub().getNom()
                        : null,
                joueur.getPoste(),
                valeurOuZero(matchsJoues),
                valeurOuZero(points),
                valeurOuZero(rebonds),
                valeurOuZero(passesDecisives),
                valeurOuZero(nbMvp)
        );
    }

    // Évite de retourner null lorsqu'une requête ne renvoie aucune valeur.
    private Long valeurOuZero(Long valeur) {
        return valeur != null ? valeur : 0L;
    }
}
