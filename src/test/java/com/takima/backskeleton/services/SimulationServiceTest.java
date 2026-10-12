package com.takima.backskeleton.services;

import com.takima.backskeleton.DAO.JoueurDao;
import com.takima.backskeleton.DAO.MatchDao;
import com.takima.backskeleton.DAO.SaisonDao;
import com.takima.backskeleton.DAO.StatsJoueurMatchDao;
import com.takima.backskeleton.DTO.MatchStatsDto;
import com.takima.backskeleton.DTO.StatsJoueurDto;
import com.takima.backskeleton.models.Club;
import com.takima.backskeleton.models.Joueur;
import com.takima.backskeleton.models.Match;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;
import java.util.stream.LongStream;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class SimulationServiceTest {

    @Mock
    private SaisonDao saisonDao;
    @Mock
    private MatchDao matchDao;
    @Mock
    private JoueurDao joueurDao;
    @Mock
    private StatsJoueurMatchDao statsJoueurMatchDao;

    private SimulationService simulationService;

    private final Club paris = new Club(1L, "Paris Basketball");
    private final Club bayern = new Club(2L, "FC Bayern Munich");

    @BeforeEach
    void creerLeService() {
        // vrai moteur de simulation, avec une graine fixe
        simulationService = new SimulationService(saisonDao, matchDao, joueurDao, statsJoueurMatchDao,
                new SimulateurMatch(new Random(1)));
    }

    private Match match(long id, int miniSaison, int journee, String statut) {
        boolean joue = "TERMINE".equals(statut);
        return new Match(id, miniSaison, journee, paris, bayern, LocalDateTime.of(2026, 10, (int) id, 20, 30),
                statut, joue ? 80 : null, joue ? 75 : null);
    }

    private List<Joueur> effectif(Club club, long premierId, int taille) {
        return LongStream.range(0, taille)
                .mapToObj(i -> new Joueur(premierId + i, "Nom" + i, "Prenom", "AI", club))
                .toList();
    }

    private void saisonAvecLesMatchs(Match... matchs) {
        when(saisonDao.existsById(1L)).thenReturn(true);
        when(matchDao.findBySaisonIdOrdered(1L)).thenReturn(List.of(matchs));
    }

    private void effectifsComplets() {
        when(statsJoueurMatchDao.findMoyennesParJoueur()).thenReturn(List.of()); // aucun historique : moyennes du poste
        when(joueurDao.findByClubIdOrderByNomAsc(1L)).thenReturn(effectif(paris, 100, 12));
        when(joueurDao.findByClubIdOrderByNomAsc(2L)).thenReturn(effectif(bayern, 200, 12));
    }

    @Test
    void simulerMiniSaison_saisonInconnue_renvoie404() {
        when(saisonDao.existsById(9L)).thenReturn(false);

        ResponseStatusException e = assertThrows(ResponseStatusException.class,
                () -> simulationService.simulerMiniSaison(9L, 3));

        assertEquals(HttpStatus.NOT_FOUND, e.getStatusCode());
        verify(matchDao, never()).findBySaisonIdOrdered(any());
    }

    @Test
    void simulerMiniSaison_miniSaisonSansMatch_renvoie404() {
        saisonAvecLesMatchs(match(1, 1, 1, "TERMINE"));

        ResponseStatusException e = assertThrows(ResponseStatusException.class,
                () -> simulationService.simulerMiniSaison(1L, 4));

        assertEquals(HttpStatus.NOT_FOUND, e.getStatusCode());
    }

    @Test
    void simulerMiniSaison_dejaJouee_renvoie409() {
        saisonAvecLesMatchs(match(1, 3, 1, "TERMINE"), match(2, 3, 2, "TERMINE"));

        ResponseStatusException e = assertThrows(ResponseStatusException.class,
                () -> simulationService.simulerMiniSaison(1L, 3));

        assertEquals(HttpStatus.CONFLICT, e.getStatusCode());
        verify(statsJoueurMatchDao, never()).saveAll(anyList());
    }

    @Test
    void simulerMiniSaison_joueLesMatchsAVenirEtEnregistreLesStats() {
        Match dejaJoue = match(1, 3, 1, "TERMINE");
        Match aVenir = match(2, 3, 1, "A_VENIR");
        Match aVenirAussi = match(3, 3, 2, "A_VENIR");
        saisonAvecLesMatchs(match(4, 2, 1, "TERMINE"), dejaJoue, aVenir, aVenirAussi);
        effectifsComplets();

        List<MatchStatsDto> simules = simulationService.simulerMiniSaison(1L, 3);

        // seuls les deux matchs à venir sont joués, dans l'ordre du calendrier
        assertEquals(List.of(2L, 3L), simules.stream().map(MatchStatsDto::id).toList());
        assertTrue(aVenir.estJoue());
        assertTrue(aVenirAussi.estJoue());
        assertNotEquals(aVenir.getScoreDomicile(), aVenir.getScoreExterieur());
        assertEquals(80, dejaJoue.getScoreDomicile());
        verify(statsJoueurMatchDao, times(2)).saveAll(anyList());

        // le score renvoyé est la somme des points des dix joueurs alignés
        MatchStatsDto premier = simules.get(0);
        assertEquals(10, premier.statsDomicile().size());
        assertEquals(premier.scoreDomicile(), premier.statsDomicile().stream().mapToInt(StatsJoueurDto::points).sum());
        assertEquals(aVenir.getMvp().getId(), premier.mvpId());
    }

    @Test
    void simulerJournee_neJoueQueLaJourneeDemandee() {
        Match journee1 = match(1, 3, 1, "A_VENIR");
        Match journee2 = match(2, 3, 2, "A_VENIR");
        saisonAvecLesMatchs(journee1, journee2);
        effectifsComplets();

        List<MatchStatsDto> simules = simulationService.simulerJournee(1L, 3, 2);

        assertEquals(1, simules.size());
        assertTrue(journee2.estJoue());
        assertFalse(journee1.estJoue());
    }

    @Test
    void simulerJournee_journeeInconnue_renvoie404() {
        saisonAvecLesMatchs(match(1, 3, 1, "A_VENIR"));

        ResponseStatusException e = assertThrows(ResponseStatusException.class,
                () -> simulationService.simulerJournee(1L, 3, 11));

        assertEquals(HttpStatus.NOT_FOUND, e.getStatusCode());
    }

    @Test
    void simulerMiniSaison_effectifInsuffisant_renvoie409() {
        saisonAvecLesMatchs(match(1, 3, 1, "A_VENIR"));
        when(statsJoueurMatchDao.findMoyennesParJoueur()).thenReturn(List.of());
        when(joueurDao.findByClubIdOrderByNomAsc(1L)).thenReturn(effectif(paris, 100, 3));

        ResponseStatusException e = assertThrows(ResponseStatusException.class,
                () -> simulationService.simulerMiniSaison(1L, 3));

        assertEquals(HttpStatus.CONFLICT, e.getStatusCode());
        verify(statsJoueurMatchDao, never()).saveAll(anyList());
    }

    @Test
    void reinitialiserMiniSaison_remetLesMatchsAVenirEtSupprimeLeursStats() {
        Match miniSaison2 = match(1, 2, 10, "TERMINE");
        Match miniSaison3 = match(2, 3, 1, "TERMINE");
        saisonAvecLesMatchs(miniSaison2, miniSaison3);

        simulationService.reinitialiserMiniSaison(1L, 3);

        assertEquals("A_VENIR", miniSaison3.getStatut());
        assertNull(miniSaison3.getScoreDomicile());
        assertNull(miniSaison3.getMvp());
        assertTrue(miniSaison2.estJoue()); // les autres mini-saisons ne bougent pas
        verify(statsJoueurMatchDao).deleteByMatchIds(List.of(2L));
    }
}
