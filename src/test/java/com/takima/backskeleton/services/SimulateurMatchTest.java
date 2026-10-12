package com.takima.backskeleton.services;

import com.takima.backskeleton.models.Club;
import com.takima.backskeleton.models.Joueur;
import com.takima.backskeleton.services.SimulateurMatch.Ligne;
import com.takima.backskeleton.services.SimulateurMatch.Profil;
import com.takima.backskeleton.services.SimulateurMatch.Resultat;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertSame;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

class SimulateurMatchTest {

    private final Club paris = new Club(1L, "Paris Basketball");
    private final Club bayern = new Club(2L, "FC Bayern Munich");
    private final List<Profil> effectifParis = effectif(paris, 100);
    private final List<Profil> effectifBayern = effectif(bayern, 200);

    // 12 joueurs aux moyennes réalistes (8,6 points chacun), du plus au moins utilisé
    private List<Profil> effectif(Club club, long premierId) {
        List<Profil> profils = new ArrayList<>();
        for (int i = 0; i < 12; i++) {
            Joueur joueur = new Joueur(premierId + i, "Nom" + i, "Prenom", "AI", club);
            profils.add(new Profil(joueur, 16 - i, 1.5, 2.2, 0.9, 3.0, 1.8, 0.7));
        }
        return profils;
    }

    private SimulateurMatch simulateur(long graine) {
        return new SimulateurMatch(new Random(graine));
    }

    @Test
    void simuler_jamaisDeMatchNul() {
        for (long graine = 0; graine < 300; graine++) {
            Resultat r = simulateur(graine).simuler(effectifParis, effectifBayern);
            assertNotEquals(r.scoreDomicile(), r.scoreExterieur(), "graine " + graine);
        }
    }

    @Test
    void simuler_aligneDixJoueursDifferentsDeChaqueClub() {
        for (long graine = 0; graine < 50; graine++) {
            Resultat r = simulateur(graine).simuler(effectifParis, effectifBayern);

            assertEquals(10, r.domicile().size());
            assertEquals(10, r.exterieur().size());
            assertEquals(10, new HashSet<>(r.domicile().stream().map(Ligne::joueur).toList()).size());
            assertTrue(r.domicile().stream().allMatch(l -> l.joueur().getClub() == paris));
            assertTrue(r.exterieur().stream().allMatch(l -> l.joueur().getClub() == bayern));
        }
    }

    @Test
    void simuler_mvpEstLeMeilleurJoueurDeLEquipeGagnante() {
        for (long graine = 0; graine < 100; graine++) {
            Resultat r = simulateur(graine).simuler(effectifParis, effectifBayern);
            List<Ligne> gagnants = r.scoreDomicile() > r.scoreExterieur() ? r.domicile() : r.exterieur();

            Ligne ligneDuMvp = gagnants.stream()
                    .filter(l -> l.joueur() == r.mvp())
                    .findFirst()
                    .orElseThrow(() -> new AssertionError("le MVP doit jouer dans l'équipe gagnante"));
            int meilleureEvaluation = gagnants.stream().mapToInt(Ligne::evaluation).max().orElseThrow();
            assertEquals(meilleureEvaluation, ligneDuMvp.evaluation());
        }
    }

    @Test
    void simuler_pointsCalculesCommeEnBase() {
        Resultat r = simulateur(5).simuler(effectifParis, effectifBayern);
        for (Ligne l : r.domicile()) {
            assertEquals(l.lancersFrancs() + 2 * l.deuxPoints() + 3 * l.troisPoints(), l.points());
        }
        assertEquals(r.domicile().stream().mapToInt(Ligne::points).sum(), r.scoreDomicile());
    }

    @Test
    void simuler_memeGraine_memeMatch() {
        Resultat premier = simulateur(42).simuler(effectifParis, effectifBayern);
        Resultat second = simulateur(42).simuler(effectifParis, effectifBayern);

        assertEquals(premier, second);
        assertSame(premier.mvp(), second.mvp());
    }

    @Test
    void simuler_scoresRealistesAvecAvantageDuTerrain() {
        SimulateurMatch simulateur = simulateur(7);
        double domicile = 0;
        double exterieur = 0;
        int matchs = 1000;
        for (int i = 0; i < matchs; i++) {
            Resultat r = simulateur.simuler(effectifParis, effectifBayern);
            domicile += r.scoreDomicile();
            exterieur += r.scoreExterieur();
        }
        domicile /= matchs;
        exterieur /= matchs;

        // deux effectifs identiques : environ 86 points chacun, un peu plus à domicile
        assertTrue(domicile > 78 && domicile < 98, "moyenne à domicile : " + domicile);
        assertTrue(exterieur > 75 && exterieur < 95, "moyenne à l'extérieur : " + exterieur);
        assertTrue(domicile > exterieur, "l'équipe qui reçoit doit être avantagée");
    }

    @Test
    void simuler_petitEffectif_tousLesJoueursSontAlignes() {
        Resultat r = simulateur(3).simuler(effectifParis.subList(0, 6), effectifBayern);

        assertEquals(6, r.domicile().size());
    }

    @Test
    void simuler_equipeSansJoueur_estRefusee() {
        assertThrows(IllegalArgumentException.class, () -> simulateur(1).simuler(List.of(), effectifBayern));
    }
}
