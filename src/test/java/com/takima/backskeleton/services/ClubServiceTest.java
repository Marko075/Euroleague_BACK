package com.takima.backskeleton.services;

import com.takima.backskeleton.DAO.ClubDao;
import com.takima.backskeleton.DAO.JoueurDao;
import com.takima.backskeleton.DAO.MatchDao;
import com.takima.backskeleton.DTO.BilanClubDto;
import com.takima.backskeleton.DTO.ClassementLigneDto;
import com.takima.backskeleton.DTO.ClassementMiniSaisonDto;
import com.takima.backskeleton.models.Club;
import com.takima.backskeleton.models.Match;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class ClubServiceTest {

    @Mock
    private ClubDao clubDao;
    @Mock
    private JoueurDao joueurDao;
    @Mock
    private MatchDao matchDao;
    @Mock
    private ClassementService classementService;

    @InjectMocks
    private ClubService clubService;

    private final Club paris = new Club(1L, "Paris Basketball");
    private final Club bayern = new Club(2L, "FC Bayern Munich");
    private final Club partizan = new Club(3L, "Partizan Mozzart Bet");

    private Match termine(long id, Club domicile, Club exterieur, int scoreDomicile, int scoreExterieur, int jour) {
        return new Match(id, domicile, exterieur, LocalDateTime.of(2026, 10, jour, 20, 0),
                "TERMINE", scoreDomicile, scoreExterieur);
    }

    private ClassementLigneDto ligne(String rang, Club club) {
        return new ClassementLigneDto(rang, club.getId(), club.getNom(), 0, 0, 0);
    }

    @Test
    void getBilan_calculeVictoiresDefaitesPointsEtForme() {
        when(clubDao.findById(1L)).thenReturn(Optional.of(paris));
        when(classementService.findClassementsSaisonEnCours()).thenReturn(List.of());
        // du plus récent au plus ancien, comme la requête du DAO
        when(matchDao.findTermines()).thenReturn(List.of(
                termine(3, bayern, paris, 80, 75, 3),     // défaite de Paris à l'extérieur
                termine(2, partizan, bayern, 70, 90, 2),  // match sans Paris
                termine(1, paris, partizan, 88, 80, 1)    // victoire de Paris à domicile
        ));

        BilanClubDto bilan = clubService.getBilan(1L);

        assertEquals(2, bilan.matchsJoues());
        assertEquals(1, bilan.victoires());
        assertEquals(1, bilan.defaites());
        assertEquals(88 + 75, bilan.pointsMarques());
        assertEquals(80 + 80, bilan.pointsEncaisses());
        assertEquals(List.of("D", "V"), bilan.forme());
    }

    @Test
    void getBilan_reprendLeRangDeLaDerniereMiniSaison() {
        when(clubDao.findById(1L)).thenReturn(Optional.of(paris));
        when(matchDao.findTermines()).thenReturn(List.of());
        when(classementService.findClassementsSaisonEnCours()).thenReturn(List.of(
                new ClassementMiniSaisonDto(1, 10, List.of(ligne("1", paris), ligne("2", bayern), ligne("3", partizan))),
                new ClassementMiniSaisonDto(2, 4, List.of(ligne("1", bayern), ligne("2", partizan), ligne("3", paris)))
        ));

        BilanClubDto bilan = clubService.getBilan(1L);

        assertEquals(2, bilan.miniSaison());
        assertEquals(3, bilan.rang());
        assertEquals(3, bilan.nombreClubs());
    }

    @Test
    void getBilan_egaliteParfaite_prendLeRangDeLEquipePrecedente() {
        when(clubDao.findById(1L)).thenReturn(Optional.of(paris));
        when(matchDao.findTermines()).thenReturn(List.of());
        when(classementService.findClassementsSaisonEnCours()).thenReturn(List.of(
                new ClassementMiniSaisonDto(1, 3, List.of(ligne("1", bayern), ligne("2", partizan), ligne("equal", paris)))
        ));

        assertEquals(2, clubService.getBilan(1L).rang());
    }

    @Test
    void getBilan_sansMatchJoue_renvoieUnBilanVideSansRang() {
        when(clubDao.findById(1L)).thenReturn(Optional.of(paris));
        when(matchDao.findTermines()).thenReturn(List.of());
        when(classementService.findClassementsSaisonEnCours()).thenReturn(List.of());

        BilanClubDto bilan = clubService.getBilan(1L);

        assertEquals(0, bilan.matchsJoues());
        assertEquals(List.of(), bilan.forme());
        assertNull(bilan.rang());
    }

    @Test
    void findById_clubInexistant_renvoie404() {
        when(clubDao.findById(99L)).thenReturn(Optional.empty());

        ResponseStatusException erreur = assertThrows(ResponseStatusException.class,
                () -> clubService.findById(99L));

        assertEquals(HttpStatus.NOT_FOUND, erreur.getStatusCode());
    }

    @Test
    void findJoueurs_clubInexistant_neRequetePasLesJoueurs() {
        when(clubDao.findById(99L)).thenReturn(Optional.empty());

        assertThrows(ResponseStatusException.class, () -> clubService.findJoueurs(99L));
        verify(joueurDao, never()).findByClubIdOrderByNomAsc(99L);
    }
}
