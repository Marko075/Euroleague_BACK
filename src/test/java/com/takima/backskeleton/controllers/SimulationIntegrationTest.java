package com.takima.backskeleton.controllers;

import com.jayway.jsonpath.JsonPath;
import com.takima.backskeleton.DAO.MatchDao;
import com.takima.backskeleton.DAO.SaisonDao;
import com.takima.backskeleton.models.Match;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

import static org.hamcrest.Matchers.everyItem;
import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.lessThan;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * Test d'intégration de la simulation : contexte Spring complet, requêtes HTTP (MockMvc)
 * et vraie base PostgreSQL (docker compose up). Chaque test tourne dans une transaction
 * annulée à la fin : la base de démo n'est pas modifiée.
 */
@SpringBootTest
@AutoConfigureMockMvc
@Transactional
class SimulationIntegrationTest {

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private SaisonDao saisonDao;
    @Autowired
    private MatchDao matchDao;

    private Long saisonId;
    private String miniSaison3;

    @BeforeEach
    void partirDUneMiniSaison3AVenir() throws Exception {
        saisonId = saisonDao.findByStatut("EN_COURS").get(0).getId();
        miniSaison3 = "/saisons/" + saisonId + "/mini-saisons/3";
        // point de départ connu, même si la mini-saison 3 a déjà été simulée depuis le front
        mockMvc.perform(delete(miniSaison3 + "/simulation")).andExpect(status().isNoContent());
    }

    private List<Match> matchsDeLaMiniSaison3() {
        return matchDao.findBySaisonIdOrdered(saisonId).stream()
                .filter(m -> m.getMiniSaison() == 3)
                .toList();
    }

    @Test
    void simulerUneJournee_enregistreLesResultatsEtMetAJourLeClassement() throws Exception {
        mockMvc.perform(post(miniSaison3 + "/journees/1/simulation"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(2))
                .andExpect(jsonPath("$[*].journee", everyItem(is(1))))
                .andExpect(jsonPath("$[0].statsDomicile.length()").value(10))
                .andExpect(jsonPath("$[0].statsExterieur.length()").value(10))
                .andExpect(jsonPath("$[0].mvpId").isNumber());

        List<Match> journee1 = matchsDeLaMiniSaison3().stream().filter(m -> m.getJournee() == 1).toList();
        assertTrue(journee1.stream().allMatch(Match::estJoue));

        // le classement est calculé à partir des matchs : la mini-saison 3 y apparaît
        mockMvc.perform(get("/classements"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[*].miniSaison", hasItem(3)));

        // une journée déjà jouée ne peut pas être rejouée
        mockMvc.perform(post(miniSaison3 + "/journees/1/simulation")).andExpect(status().isConflict());
    }

    @Test
    void simulerLaMiniSaison_scoresEgauxALaSommeDesPointsDesJoueurs() throws Exception {
        String json = mockMvc.perform(post(miniSaison3 + "/simulation"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(20))
                .andReturn().getResponse().getContentAsString();

        List<Map<String, Object>> matchs = JsonPath.read(json, "$");
        for (Map<String, Object> match : matchs) {
            List<Integer> pointsDomicile = JsonPath.read(match, "$.statsDomicile[*].points");
            List<Integer> pointsExterieur = JsonPath.read(match, "$.statsExterieur[*].points");
            assertEquals(match.get("scoreDomicile"), pointsDomicile.stream().mapToInt(Integer::intValue).sum());
            assertEquals(match.get("scoreExterieur"), pointsExterieur.stream().mapToInt(Integer::intValue).sum());
            assertNotEquals(match.get("scoreDomicile"), match.get("scoreExterieur"));
        }
        assertTrue(matchsDeLaMiniSaison3().stream().allMatch(Match::estJoue));
    }

    @Test
    void reinitialiser_remetToutLaMiniSaisonAVenir() throws Exception {
        mockMvc.perform(post(miniSaison3 + "/simulation")).andExpect(status().isOk());

        mockMvc.perform(delete(miniSaison3 + "/simulation")).andExpect(status().isNoContent());

        assertTrue(matchsDeLaMiniSaison3().stream().noneMatch(Match::estJoue));
        mockMvc.perform(get("/classements"))
                .andExpect(jsonPath("$[*].miniSaison", everyItem(lessThan(3))));
    }

    @Test
    void simuler_saisonOuMiniSaisonInconnue_renvoie404() throws Exception {
        mockMvc.perform(post("/saisons/999999/mini-saisons/3/simulation")).andExpect(status().isNotFound());
        mockMvc.perform(post("/saisons/" + saisonId + "/mini-saisons/4/simulation")).andExpect(status().isNotFound());
        mockMvc.perform(post(miniSaison3 + "/journees/11/simulation")).andExpect(status().isNotFound());
    }
}
