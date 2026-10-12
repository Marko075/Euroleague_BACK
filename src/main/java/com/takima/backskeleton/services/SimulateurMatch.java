package com.takima.backskeleton.services;

import com.takima.backskeleton.models.Joueur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Random;

/**
 * Moteur de simulation d'un match, sans accès à la base.
 * Il tire au sort les joueurs alignés et leurs statistiques autour de leurs moyennes, en suivant
 * les mêmes règles que le jeu de données de démo : 10 joueurs par équipe, score = somme des points
 * des joueurs, pas de match nul, MVP = meilleure évaluation de l'équipe gagnante.
 */
@Component
public class SimulateurMatch {

    static final int JOUEURS_PAR_EQUIPE = 10;
    private static final double AVANTAGE_DOMICILE = 0.03;
    // Réglés pour des écarts proches du jeu de données (écart-type ≈ 11 points, déroutes rares)
    private static final double ECART_FORME = 0.04;
    private static final double DISPERSION = 0.55;

    private final Random random;

    @Autowired
    public SimulateurMatch() {
        this(new Random());
    }

    // Dans les tests, une graine fixe rend la simulation reproductible
    SimulateurMatch(Random random) {
        this.random = random;
    }

    /** Ce que l'on sait d'un joueur avant le match : ses moyennes par match et sa fréquence de jeu. */
    public record Profil(Joueur joueur, double presence, double lancersFrancs, double deuxPoints,
                         double troisPoints, double rebonds, double passes, double interceptions) {
    }

    /** La feuille de statistiques d'un joueur à la fin du match. */
    public record Ligne(Joueur joueur, int lancersFrancs, int deuxPoints, int troisPoints,
                        int rebonds, int passes, int interceptions) {

        public int points() {
            return lancersFrancs + 2 * deuxPoints + 3 * troisPoints;
        }

        // Même évaluation que le script SQL de démo
        public int evaluation() {
            return points() + rebonds + passes + interceptions;
        }

        Ligne avecTirsEnPlus(int lf, int d2, int t3) {
            return new Ligne(joueur, lancersFrancs + lf, deuxPoints + d2, troisPoints + t3,
                    rebonds, passes, interceptions);
        }
    }

    public record Resultat(List<Ligne> domicile, List<Ligne> exterieur, Joueur mvp) {

        public int scoreDomicile() {
            return total(domicile);
        }

        public int scoreExterieur() {
            return total(exterieur);
        }
    }

    public Resultat simuler(List<Profil> effectifDomicile, List<Profil> effectifExterieur) {
        if (effectifDomicile.isEmpty() || effectifExterieur.isEmpty()) {
            throw new IllegalArgumentException("Chaque équipe doit avoir au moins un joueur");
        }
        List<Ligne> domicile = jouer(aligner(effectifDomicile), forme(true));
        List<Ligne> exterieur = jouer(aligner(effectifExterieur), forme(false));

        // Pas de match nul au basket : prolongations jusqu'à ce qu'une équipe passe devant
        while (total(domicile) == total(exterieur)) {
            domicile = prolongation(domicile);
            exterieur = prolongation(exterieur);
        }

        List<Ligne> gagnants = total(domicile) > total(exterieur) ? domicile : exterieur;
        return new Resultat(domicile, exterieur, mvp(gagnants));
    }

    // Tirage sans remise des joueurs alignés : plus un joueur joue d'habitude, plus il a de chances d'être là
    private List<Profil> aligner(List<Profil> effectif) {
        List<Profil> restants = new ArrayList<>(effectif);
        List<Profil> alignes = new ArrayList<>();
        while (alignes.size() < JOUEURS_PAR_EQUIPE && !restants.isEmpty()) {
            double tirage = random.nextDouble() * restants.stream().mapToDouble(Profil::presence).sum();
            int i = 0;
            double cumul = restants.get(0).presence();
            while (cumul < tirage && i < restants.size() - 1) {
                i++;
                cumul += restants.get(i).presence();
            }
            alignes.add(restants.remove(i));
        }
        return alignes;
    }

    // Forme du jour de l'équipe (multiplie ses tirs réussis), avec un léger avantage à domicile
    private double forme(boolean aDomicile) {
        double forme = 1 + random.nextGaussian() * ECART_FORME + (aDomicile ? AVANTAGE_DOMICILE : 0);
        return Math.max(0.8, Math.min(1.25, forme));
    }

    private List<Ligne> jouer(List<Profil> alignes, double forme) {
        List<Ligne> lignes = new ArrayList<>();
        for (Profil p : alignes) {
            lignes.add(new Ligne(
                    p.joueur(),
                    tirage(p.lancersFrancs() * forme),
                    tirage(p.deuxPoints() * forme),
                    tirage(p.troisPoints() * forme),
                    tirage(p.rebonds()),
                    tirage(p.passes()),
                    tirage(p.interceptions())));
        }
        return lignes;
    }

    // Prolongation : trois tirages de tirs réussis répartis au hasard dans l'équipe
    private List<Ligne> prolongation(List<Ligne> lignes) {
        List<Ligne> apres = new ArrayList<>(lignes);
        for (int n = 0; n < 3; n++) {
            int i = random.nextInt(apres.size());
            apres.set(i, apres.get(i).avecTirsEnPlus(tirage(0.8), tirage(1.0), tirage(0.35)));
        }
        return apres;
    }

    // Valeur entière autour de la moyenne, jamais négative (loi normale un peu resserrée)
    private int tirage(double moyenne) {
        if (moyenne <= 0) {
            return 0;
        }
        double valeur = moyenne + random.nextGaussian() * Math.sqrt(moyenne) * DISPERSION;
        return (int) Math.max(0, Math.round(valeur));
    }

    // Meilleure évaluation, puis le plus de points, puis l'ordre alphabétique (comme le script SQL)
    private Joueur mvp(List<Ligne> gagnants) {
        return gagnants.stream()
                .max(Comparator.comparingInt(Ligne::evaluation)
                        .thenComparingInt(Ligne::points)
                        .thenComparing(l -> l.joueur().getNom(), Comparator.reverseOrder()))
                .map(Ligne::joueur)
                .orElseThrow();
    }

    private static int total(List<Ligne> lignes) {
        return lignes.stream().mapToInt(Ligne::points).sum();
    }
}
