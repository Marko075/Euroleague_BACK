DO $$

DECLARE
    _PANATHINAIKOS int := NEXTVAL('clubs_id_seq');
    _PARTIZAN int := NEXTVAL('clubs_id_seq');
    _PARIS int := NEXTVAL('clubs_id_seq');
    _FENERBAHCE int := NEXTVAL('clubs_id_seq');
    _BAYERN int := NEXTVAL('clubs_id_seq');

    _SAISON int;

BEGIN

    ----------------------------------------------------------------
    -- CLUBS
    ----------------------------------------------------------------

    INSERT INTO clubs (id, nom, ville, pays, stade, coach)
    VALUES (_PANATHINAIKOS, 'Panathinaikos AKTOR', 'Athènes', 'Grèce', 'OAKA Telekom Center', 'Zeljko Obradovic');

    INSERT INTO clubs (id, nom, ville, pays, stade, coach)
    VALUES (_PARTIZAN, 'Partizan Mozzart Bet', 'Belgrade', 'Serbie', 'Belgrade Arena', 'Joan Peñarroya');

    INSERT INTO clubs (id, nom, ville, pays, stade, coach)
    VALUES (_PARIS, 'Paris Basketball', 'Paris', 'France', 'Adidas Arena', 'Maxime Lefèvre');

    INSERT INTO clubs (id, nom, ville, pays, stade, coach)
    VALUES (_FENERBAHCE, 'Fenerbahçe Beko', 'Istanbul', 'Turquie', 'Ülker Sports Arena', 'Sarunas Jasikevicius');

    INSERT INTO clubs (id, nom, ville, pays, stade, coach)
    VALUES (_BAYERN, 'FC Bayern Munich', 'Munich', 'Allemagne', 'SAP Garden', 'Anton Gavel');


    ----------------------------------------------------------------
    -- JOUEURS - PARIS BASKETBALL
    ----------------------------------------------------------------

    INSERT INTO joueurs (nom, prenom, anniversaire, nationalite, taille, poste, club_id) VALUES
    ('Ntilikina', 'Frank', '1998-07-28', 'France', 194, 'M', _PARIS),
    ('Johnson', 'Alize', '1996-04-22', 'États-Unis', 206, 'AF', _PARIS),
    ('Etienne', 'Tyson', '1999-09-17', 'États-Unis', 185, 'AR', _PARIS),
    ('Warren', 'TJ', '1993-09-05', 'États-Unis', 203, 'AI', _PARIS),
    ('Pereira', 'Mãozinha', '2000-08-28', 'Brésil', 203, 'AI', _PARIS),
    ('Tarpey', 'Terry', '1994-03-02', 'France', 196, 'AI', _PARIS),
    ('Hifi', 'Nadir', '2002-07-16', 'France', 188, 'AR', _PARIS),
    ('Herrera', 'Sebastian', '1997-11-01', 'Chili', 193, 'AR', _PARIS),
    ('Rhoden', 'Jared', '1999-08-27', 'États-Unis', 198, 'AI', _PARIS),
    ('Hommes', 'Daulton', '1996-07-04', 'États-Unis', 203, 'AF', _PARIS),
    ('Morgan', 'Jeremy', '1995-05-08', 'États-Unis', 199, 'AI', _PARIS),
    ('Dokossi', 'Allan', '1999-10-14', 'France', 203, 'AF', _PARIS);


    ----------------------------------------------------------------
    -- JOUEURS - PARTIZAN
    ----------------------------------------------------------------

    INSERT INTO joueurs (nom, prenom, anniversaire, nationalite, taille, poste, club_id) VALUES
    ('Thompson', 'Ethan', '1999-05-04', 'États-Unis', 193, 'AR', _PARTIZAN),
    ('Allman', 'Kyle', '1997-09-02', 'États-Unis', 191, 'AR', _PARTIZAN),
    ('Willis', 'Derek', '1995-06-21', 'États-Unis', 205, 'AF', _PARTIZAN),
    ('Vildoza', 'Luca', '1995-08-11', 'Argentine', 191, 'M', _PARTIZAN),
    ('Tanaskovic', 'Nikola', '1997-10-21', 'Serbie', 205, 'AI', _PARTIZAN),
    ('Pajola', 'Alessandro', '1999-11-09', 'Italie', 194, 'M', _PARTIZAN),
    ('Stevens', 'Lamar', '1997-07-09', 'États-Unis', 201, 'AI', _PARTIZAN),
    ('Hayes', 'Kevarrius', '1997-03-05', 'États-Unis', 206, 'P', _PARTIZAN),
    ('Marinkovic', 'Vanja', '1997-01-09', 'Serbie', 198, 'AR', _PARTIZAN),
    ('Jones', 'Carlik', '1997-12-23', 'États-Unis', 183, 'M', _PARTIZAN),
    ('Lakic', 'Arijan', '2000-01-20', 'Croatie', 199, 'AI', _PARTIZAN),
    ('Nakic', 'Mario', '2001-06-14', 'Croatie', 202, 'AF', _PARTIZAN),
    ('Jekiri', 'Tonye', '1994-07-23', 'Nigeria', 212, 'P', _PARTIZAN),
    ('Lauvergne', 'Joffrey', '1991-09-30', 'France', 211, 'P', _PARTIZAN);


    ----------------------------------------------------------------
    -- JOUEURS - FC BAYERN MUNICH
    ----------------------------------------------------------------

    INSERT INTO joueurs (nom, prenom, anniversaire, nationalite, taille, poste, club_id) VALUES
    ('Beauchamp', 'MarJon', '2000-10-12', 'États-Unis', 201, 'AI', _BAYERN),
    ('Norris', 'Miles', '2000-04-15', 'États-Unis', 200, 'AF', _BAYERN),
    ('Wiley', 'Austin', '1999-01-08', 'États-Unis', 211, 'P', _BAYERN),
    ('Washington Jr.', 'Duane', '2000-03-24', 'États-Unis', 191, 'M', _BAYERN),
    ('Jensen', 'Tobias', '2004-05-08', 'Danemark', 197, 'AR', _BAYERN),
    ('Thiemann', 'Johannes', '1994-02-09', 'Allemagne', 205, 'AF', _BAYERN),
    ('Hollatz', 'Justus', '2001-04-21', 'Allemagne', 195, 'M', _BAYERN),
    ('Jokubaitis', 'Rokas', '2000-11-19', 'Lituanie', 193, 'M', _BAYERN),
    ('Baldwin', 'Kamar', '1997-09-15', 'États-Unis', 185, 'M', _BAYERN),
    ('Obst', 'Andi', '1996-07-13', 'Allemagne', 191, 'AR', _BAYERN),
    ('Jessup', 'Justinian', '1998-05-23', 'États-Unis', 198, 'AR', _BAYERN),
    ('Lucic', 'Vladimir', '1989-06-17', 'Serbie', 204, 'AI', _BAYERN),
    ('Giffey', 'Niels', '1991-06-08', 'Allemagne', 200, 'AI', _BAYERN),
    ('da Silva', 'Oscar', '1998-09-21', 'Allemagne', 205, 'AF', _BAYERN),
    ('Voigtmann', 'Johannes', '1992-09-30', 'Allemagne', 211, 'P', _BAYERN);


    ----------------------------------------------------------------
    -- JOUEURS - FENERBAHÇE BEKO
    ----------------------------------------------------------------

    INSERT INTO joueurs (nom, prenom, anniversaire, nationalite, taille, poste, club_id) VALUES
    ('Juzang', 'Johnny', '2001-03-17', 'États-Unis', 201, 'AI', _FENERBAHCE),
    ('Clyburn', 'Will', '1990-05-17', 'États-Unis', 201, 'AI', _FENERBAHCE),
    ('Bingham Jr.', 'Marcus', '2000-07-14', 'États-Unis', 213, 'P', _FENERBAHCE),
    ('Sargiunas', 'Ignas', '1999-09-11', 'Lituanie', 196, 'AI', _FENERBAHCE),
    ('Sanli', 'Sertac', '1991-02-05', 'Turquie', 212, 'P', _FENERBAHCE),
    ('Larkin', 'Shane', '1992-10-02', 'Turquie', 180, 'M', _FENERBAHCE),
    ('Key', 'Braxton', '1997-02-14', 'États-Unis', 203, 'AF', _FENERBAHCE),
    ('Shields', 'Shavon', '1994-06-05', 'États-Unis', 201, 'AI', _FENERBAHCE),
    ('Forrest', 'Trent', '1998-06-12', 'États-Unis', 193, 'M', _FENERBAHCE),
    ('Baldwin IV', 'Wade', '1996-03-29', 'États-Unis', 193, 'M', _FENERBAHCE),
    ('Horton-Tucker', 'Talen', '2000-11-25', 'États-Unis', 193, 'AR', _FENERBAHCE),
    ('Mahmutoglu', 'Melih', '1990-05-07', 'Turquie', 191, 'AR', _FENERBAHCE),
    ('Bitim', 'Onuralp', '1999-03-31', 'Turquie', 196, 'AI', _FENERBAHCE),
    ('Melli', 'Nicolo', '1991-01-26', 'Italie', 205, 'AF', _FENERBAHCE),
    ('Silva', 'Chris', '1996-09-19', 'Gabon', 206, 'P', _FENERBAHCE);


    ----------------------------------------------------------------
    -- JOUEURS - PANATHINAIKOS AKTOR
    ----------------------------------------------------------------

    INSERT INTO joueurs (nom, prenom, anniversaire, nationalite, taille, poste, club_id) VALUES
    ('Mantzoukas', 'Eleftherios', '2003-08-08', 'Grèce', 207, 'AF', _PANATHINAIKOS),
    ('Francisco', 'Sylvain', '1997-10-10', 'France', 185, 'M', _PANATHINAIKOS),
    ('Bonga', 'Isaac', '1999-11-08', 'Allemagne', 204, 'AI', _PANATHINAIKOS),
    ('Badio', 'Brancou', '1999-02-17', 'Espagne', 191, 'AR', _PANATHINAIKOS),
    ('Yabusele', 'Guerschon', '1995-12-17', 'France', 201, 'AF', _PANATHINAIKOS),
    ('Fall', 'Moustapha', '1992-02-23', 'France', 218, 'P', _PANATHINAIKOS),
    ('Sloukas', 'Kostas', '1990-01-15', 'Grèce', 190, 'M', _PANATHINAIKOS),
    ('Nunn', 'Kendrick', '1995-08-03', 'États-Unis', 195, 'AR', _PANATHINAIKOS),
    ('Grant', 'Jerian', '1992-10-09', 'États-Unis', 196, 'M', _PANATHINAIKOS),
    ('Kalaitzakis', 'Panagiotis', '1999-01-02', 'Grèce', 200, 'AI', _PANATHINAIKOS),
    ('Hayes-Davis', 'Nigel', '1994-09-16', 'États-Unis', 203, 'AF', _PANATHINAIKOS),
    ('Rogkavopoulos', 'Nikos', '2001-06-20', 'Grèce', 201, 'AI', _PANATHINAIKOS),
    ('Hernangomez', 'Juancho', '1995-09-28', 'Espagne', 206, 'AF', _PANATHINAIKOS),
    ('Mitoglou', 'Konstantinos', '1996-06-11', 'Grèce', 210, 'P', _PANATHINAIKOS);


    ----------------------------------------------------------------
    -- SAISON (unique, en cours)
    ----------------------------------------------------------------

    INSERT INTO saisons (nom, date_debut, date_fin, statut)
    VALUES ('Saison 2026-2027', '2026-05-23', NULL, 'EN_COURS')
    RETURNING id INTO _SAISON;


    ----------------------------------------------------------------
    -- MATCHS (mini-saisons 1 et 2 jouées, mini-saison 3 à venir)
    ----------------------------------------------------------------

    INSERT INTO matchs (
        saison_id,
        mini_saison,
        journee,
        club_domicile_id,
        club_exterieur_id,
        date_match,
        statut,
        score_domicile,
        score_exterieur
    ) VALUES
        -- mini-saison 1 (jouée)
        (_SAISON, 1, 1, _PARTIZAN, _BAYERN, '2026-05-23 20:30:00', 'TERMINE', 91, 78),
        (_SAISON, 1, 1, _PARIS, _PANATHINAIKOS, '2026-05-24 18:00:00', 'TERMINE', 82, 93),
        (_SAISON, 1, 2, _FENERBAHCE, _BAYERN, '2026-05-30 20:30:00', 'TERMINE', 91, 88),
        (_SAISON, 1, 2, _PARTIZAN, _PARIS, '2026-05-31 18:00:00', 'TERMINE', 85, 86),
        (_SAISON, 1, 3, _FENERBAHCE, _PANATHINAIKOS, '2026-06-06 20:30:00', 'TERMINE', 93, 88),
        (_SAISON, 1, 3, _BAYERN, _PARIS, '2026-06-07 18:00:00', 'TERMINE', 86, 85),
        (_SAISON, 1, 4, _FENERBAHCE, _PARIS, '2026-06-13 20:30:00', 'TERMINE', 78, 83),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PARTIZAN, '2026-06-14 18:00:00', 'TERMINE', 93, 84),
        (_SAISON, 1, 5, _FENERBAHCE, _PARTIZAN, '2026-06-20 20:30:00', 'TERMINE', 85, 61),
        (_SAISON, 1, 5, _PANATHINAIKOS, _BAYERN, '2026-06-21 18:00:00', 'TERMINE', 100, 77),
        (_SAISON, 1, 6, _BAYERN, _PARTIZAN, '2026-06-27 20:30:00', 'TERMINE', 90, 77),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PARIS, '2026-06-28 18:00:00', 'TERMINE', 99, 79),
        (_SAISON, 1, 7, _BAYERN, _FENERBAHCE, '2026-07-04 20:30:00', 'TERMINE', 79, 86),
        (_SAISON, 1, 7, _PARIS, _PARTIZAN, '2026-07-05 18:00:00', 'TERMINE', 87, 82),
        (_SAISON, 1, 8, _PANATHINAIKOS, _FENERBAHCE, '2026-07-11 20:30:00', 'TERMINE', 93, 78),
        (_SAISON, 1, 8, _PARIS, _BAYERN, '2026-07-12 18:00:00', 'TERMINE', 73, 96),
        (_SAISON, 1, 9, _PARIS, _FENERBAHCE, '2026-07-18 20:30:00', 'TERMINE', 82, 88),
        (_SAISON, 1, 9, _PARTIZAN, _PANATHINAIKOS, '2026-07-19 18:00:00', 'TERMINE', 87, 80),
        (_SAISON, 1, 10, _PARTIZAN, _FENERBAHCE, '2026-07-25 20:30:00', 'TERMINE', 86, 81),
        (_SAISON, 1, 10, _BAYERN, _PANATHINAIKOS, '2026-07-26 18:00:00', 'TERMINE', 72, 92),

        -- mini-saison 2 (jouée)
        (_SAISON, 2, 1, _FENERBAHCE, _PANATHINAIKOS, '2026-08-01 20:30:00', 'TERMINE', 90, 79),
        (_SAISON, 2, 1, _BAYERN, _PARIS, '2026-08-02 18:00:00', 'TERMINE', 79, 76),
        (_SAISON, 2, 2, _FENERBAHCE, _PARTIZAN, '2026-08-08 20:30:00', 'TERMINE', 91, 66),
        (_SAISON, 2, 2, _PARIS, _PANATHINAIKOS, '2026-08-09 18:00:00', 'TERMINE', 90, 83),
        (_SAISON, 2, 3, _BAYERN, _PARTIZAN, '2026-08-15 20:30:00', 'TERMINE', 75, 77),
        (_SAISON, 2, 3, _PARIS, _FENERBAHCE, '2026-08-16 18:00:00', 'TERMINE', 90, 92),
        (_SAISON, 2, 4, _PARIS, _PARTIZAN, '2026-08-22 20:30:00', 'TERMINE', 84, 86),
        (_SAISON, 2, 4, _PANATHINAIKOS, _BAYERN, '2026-08-23 18:00:00', 'TERMINE', 81, 77),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PARTIZAN, '2026-08-29 20:30:00', 'TERMINE', 90, 86),
        (_SAISON, 2, 5, _FENERBAHCE, _BAYERN, '2026-08-30 18:00:00', 'TERMINE', 87, 78),
        (_SAISON, 2, 6, _PANATHINAIKOS, _FENERBAHCE, '2026-09-05 20:30:00', 'TERMINE', 84, 96),
        (_SAISON, 2, 6, _PARIS, _BAYERN, '2026-09-06 18:00:00', 'TERMINE', 78, 72),
        (_SAISON, 2, 7, _PARTIZAN, _FENERBAHCE, '2026-09-12 20:30:00', 'TERMINE', 74, 85),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PARIS, '2026-09-13 18:00:00', 'TERMINE', 85, 84),
        (_SAISON, 2, 8, _PARTIZAN, _BAYERN, '2026-09-19 20:30:00', 'TERMINE', 77, 80),
        (_SAISON, 2, 8, _FENERBAHCE, _PARIS, '2026-09-20 18:00:00', 'TERMINE', 105, 86),
        (_SAISON, 2, 9, _PARTIZAN, _PARIS, '2026-09-26 20:30:00', 'TERMINE', 81, 85),
        (_SAISON, 2, 9, _BAYERN, _PANATHINAIKOS, '2026-09-27 18:00:00', 'TERMINE', 85, 93),
        (_SAISON, 2, 10, _PARTIZAN, _PANATHINAIKOS, '2026-10-03 20:30:00', 'TERMINE', 74, 78),
        (_SAISON, 2, 10, _BAYERN, _FENERBAHCE, '2026-10-04 18:00:00', 'TERMINE', 88, 86),

        -- mini-saison 3 (à venir)
        (_SAISON, 3, 1, _PARTIZAN, _BAYERN, '2026-10-17 20:30:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 1, _FENERBAHCE, _PANATHINAIKOS, '2026-10-18 18:00:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 2, _PARIS, _BAYERN, '2026-10-24 20:30:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 2, _PARTIZAN, _FENERBAHCE, '2026-10-25 18:00:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 3, _PARIS, _PANATHINAIKOS, '2026-10-31 20:30:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 3, _BAYERN, _FENERBAHCE, '2026-11-01 18:00:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 4, _PARIS, _FENERBAHCE, '2026-11-07 20:30:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 4, _PANATHINAIKOS, _PARTIZAN, '2026-11-08 18:00:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 5, _PARIS, _PARTIZAN, '2026-11-14 20:30:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 5, _PANATHINAIKOS, _BAYERN, '2026-11-15 18:00:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 6, _BAYERN, _PARTIZAN, '2026-11-21 20:30:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 6, _PANATHINAIKOS, _FENERBAHCE, '2026-11-22 18:00:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 7, _BAYERN, _PARIS, '2026-11-28 20:30:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 7, _FENERBAHCE, _PARTIZAN, '2026-11-29 18:00:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 8, _PANATHINAIKOS, _PARIS, '2026-12-05 20:30:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 8, _FENERBAHCE, _BAYERN, '2026-12-06 18:00:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 9, _FENERBAHCE, _PARIS, '2026-12-12 20:30:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 9, _PARTIZAN, _PANATHINAIKOS, '2026-12-13 18:00:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 10, _PARTIZAN, _PARIS, '2026-12-19 20:30:00', 'A_VENIR', NULL, NULL),
        (_SAISON, 3, 10, _BAYERN, _PANATHINAIKOS, '2026-12-20 18:00:00', 'A_VENIR', NULL, NULL);

    ----------------------------------------------------------------
    -- STATISTIQUES DES JOUEURS PAR MATCH
    -- Colonnes : saison, mini-saison, journée, club domicile (= le match),
    --            club du joueur, nom, LF, 2 pts, 3 pts, rebonds, passes décisives, interceptions
    -- Les points sont calculés par la base : LF + 2 x (2 pts) + 3 x (3 pts)
    ----------------------------------------------------------------

    INSERT INTO stats_joueurs_match (match_id, joueur_id, lancers_francs, deux_points, trois_points, rebonds, passes_decisives, interceptions)
    SELECT m.id, j.id, v.lf, v.d2, v.t3, v.reb, v.pd, v.itc
    FROM (VALUES
        -- mini-saison 1 · J1 · Partizan 91 - 78 Bayern
        (_SAISON, 1, 1, _PARTIZAN, _PARTIZAN, 'Vildoza', 1, 5, 2, 1, 5, 1),
        (_SAISON, 1, 1, _PARTIZAN, _PARTIZAN, 'Stevens', 2, 3, 1, 4, 0, 0),
        (_SAISON, 1, 1, _PARTIZAN, _PARTIZAN, 'Pajola', 3, 2, 1, 2, 4, 1),
        (_SAISON, 1, 1, _PARTIZAN, _PARTIZAN, 'Lauvergne', 2, 4, 0, 7, 1, 1),
        (_SAISON, 1, 1, _PARTIZAN, _PARTIZAN, 'Jones', 2, 2, 1, 0, 3, 0),
        (_SAISON, 1, 1, _PARTIZAN, _PARTIZAN, 'Marinkovic', 2, 2, 1, 1, 3, 2),
        (_SAISON, 1, 1, _PARTIZAN, _PARTIZAN, 'Jekiri', 1, 4, 0, 9, 0, 0),
        (_SAISON, 1, 1, _PARTIZAN, _PARTIZAN, 'Lakic', 1, 2, 1, 2, 2, 1),
        (_SAISON, 1, 1, _PARTIZAN, _PARTIZAN, 'Willis', 1, 2, 0, 3, 0, 0),
        (_SAISON, 1, 1, _PARTIZAN, _PARTIZAN, 'Nakic', 1, 1, 0, 7, 0, 1),
        (_SAISON, 1, 1, _PARTIZAN, _BAYERN, 'Thiemann', 4, 4, 1, 6, 0, 1),
        (_SAISON, 1, 1, _PARTIZAN, _BAYERN, 'Voigtmann', 2, 4, 0, 4, 0, 0),
        (_SAISON, 1, 1, _PARTIZAN, _BAYERN, 'Jessup', 0, 2, 2, 2, 1, 1),
        (_SAISON, 1, 1, _PARTIZAN, _BAYERN, 'Hollatz', 1, 1, 2, 1, 5, 1),
        (_SAISON, 1, 1, _PARTIZAN, _BAYERN, 'da Silva', 1, 1, 2, 7, 3, 1),
        (_SAISON, 1, 1, _PARTIZAN, _BAYERN, 'Wiley', 0, 4, 0, 8, 2, 1),
        (_SAISON, 1, 1, _PARTIZAN, _BAYERN, 'Washington Jr.', 1, 1, 1, 1, 4, 2),
        (_SAISON, 1, 1, _PARTIZAN, _BAYERN, 'Jensen', 1, 1, 1, 1, 4, 0),
        (_SAISON, 1, 1, _PARTIZAN, _BAYERN, 'Giffey', 2, 0, 1, 2, 0, 2),
        (_SAISON, 1, 1, _PARTIZAN, _BAYERN, 'Jokubaitis', 0, 0, 0, 0, 7, 1),

        -- mini-saison 1 · J1 · Paris 82 - 93 Panathinaikos
        (_SAISON, 1, 1, _PARIS, _PARIS, 'Dokossi', 1, 3, 4, 7, 1, 1),
        (_SAISON, 1, 1, _PARIS, _PARIS, 'Etienne', 4, 2, 1, 0, 0, 0),
        (_SAISON, 1, 1, _PARIS, _PARIS, 'Morgan', 1, 2, 2, 2, 1, 1),
        (_SAISON, 1, 1, _PARIS, _PARIS, 'Tarpey', 1, 3, 1, 4, 0, 1),
        (_SAISON, 1, 1, _PARIS, _PARIS, 'Rhoden', 0, 2, 1, 3, 0, 0),
        (_SAISON, 1, 1, _PARIS, _PARIS, 'Hifi', 2, 2, 0, 2, 3, 2),
        (_SAISON, 1, 1, _PARIS, _PARIS, 'Herrera', 4, 1, 0, 0, 2, 1),
        (_SAISON, 1, 1, _PARIS, _PARIS, 'Ntilikina', 1, 2, 0, 1, 6, 2),
        (_SAISON, 1, 1, _PARIS, _PARIS, 'Warren', 0, 2, 0, 7, 0, 0),
        (_SAISON, 1, 1, _PARIS, _PARIS, 'Pereira', 1, 1, 0, 4, 1, 0),
        (_SAISON, 1, 1, _PARIS, _PANATHINAIKOS, 'Yabusele', 1, 6, 2, 8, 3, 0),
        (_SAISON, 1, 1, _PARIS, _PANATHINAIKOS, 'Grant', 2, 5, 1, 0, 5, 0),
        (_SAISON, 1, 1, _PARIS, _PANATHINAIKOS, 'Badio', 3, 4, 1, 0, 1, 0),
        (_SAISON, 1, 1, _PARIS, _PANATHINAIKOS, 'Sloukas', 1, 1, 3, 1, 3, 0),
        (_SAISON, 1, 1, _PARIS, _PANATHINAIKOS, 'Francisco', 2, 2, 1, 0, 4, 3),
        (_SAISON, 1, 1, _PARIS, _PANATHINAIKOS, 'Nunn', 0, 4, 0, 2, 1, 0),
        (_SAISON, 1, 1, _PARIS, _PANATHINAIKOS, 'Kalaitzakis', 3, 1, 0, 6, 1, 2),
        (_SAISON, 1, 1, _PARIS, _PANATHINAIKOS, 'Mitoglou', 2, 1, 0, 5, 0, 1),
        (_SAISON, 1, 1, _PARIS, _PANATHINAIKOS, 'Hayes-Davis', 2, 1, 0, 4, 0, 0),
        (_SAISON, 1, 1, _PARIS, _PANATHINAIKOS, 'Fall', 1, 1, 0, 8, 0, 0),

        -- mini-saison 1 · J2 · Fenerbahçe 91 - 88 Bayern
        (_SAISON, 1, 2, _FENERBAHCE, _FENERBAHCE, 'Bitim', 1, 3, 3, 4, 2, 2),
        (_SAISON, 1, 2, _FENERBAHCE, _FENERBAHCE, 'Silva', 4, 5, 0, 5, 2, 0),
        (_SAISON, 1, 2, _FENERBAHCE, _FENERBAHCE, 'Melli', 5, 3, 1, 8, 0, 1),
        (_SAISON, 1, 2, _FENERBAHCE, _FENERBAHCE, 'Horton-Tucker', 1, 1, 3, 0, 1, 0),
        (_SAISON, 1, 2, _FENERBAHCE, _FENERBAHCE, 'Shields', 3, 2, 1, 9, 4, 0),
        (_SAISON, 1, 2, _FENERBAHCE, _FENERBAHCE, 'Key', 0, 3, 1, 5, 1, 0),
        (_SAISON, 1, 2, _FENERBAHCE, _FENERBAHCE, 'Clyburn', 0, 2, 1, 2, 0, 0),
        (_SAISON, 1, 2, _FENERBAHCE, _FENERBAHCE, 'Forrest', 1, 2, 0, 1, 6, 1),
        (_SAISON, 1, 2, _FENERBAHCE, _FENERBAHCE, 'Baldwin IV', 2, 1, 0, 0, 1, 3),
        (_SAISON, 1, 2, _FENERBAHCE, _FENERBAHCE, 'Juzang', 0, 0, 0, 0, 0, 0),
        (_SAISON, 1, 2, _FENERBAHCE, _BAYERN, 'Thiemann', 0, 5, 4, 8, 0, 0),
        (_SAISON, 1, 2, _FENERBAHCE, _BAYERN, 'Baldwin', 0, 1, 3, 1, 5, 1),
        (_SAISON, 1, 2, _FENERBAHCE, _BAYERN, 'Jensen', 1, 3, 1, 0, 1, 2),
        (_SAISON, 1, 2, _FENERBAHCE, _BAYERN, 'Jokubaitis', 2, 2, 1, 1, 3, 0),
        (_SAISON, 1, 2, _FENERBAHCE, _BAYERN, 'Voigtmann', 4, 2, 0, 9, 2, 0),
        (_SAISON, 1, 2, _FENERBAHCE, _BAYERN, 'Hollatz', 1, 0, 2, 0, 0, 1),
        (_SAISON, 1, 2, _FENERBAHCE, _BAYERN, 'Obst', 4, 0, 1, 1, 0, 1),
        (_SAISON, 1, 2, _FENERBAHCE, _BAYERN, 'Lucic', 4, 1, 0, 4, 1, 0),
        (_SAISON, 1, 2, _FENERBAHCE, _BAYERN, 'Giffey', 1, 0, 1, 2, 1, 0),
        (_SAISON, 1, 2, _FENERBAHCE, _BAYERN, 'Washington Jr.', 0, 2, 0, 0, 3, 1),

        -- mini-saison 1 · J2 · Partizan 85 - 86 Paris
        (_SAISON, 1, 2, _PARTIZAN, _PARTIZAN, 'Marinkovic', 0, 1, 4, 5, 1, 3),
        (_SAISON, 1, 2, _PARTIZAN, _PARTIZAN, 'Jekiri', 2, 5, 0, 7, 1, 0),
        (_SAISON, 1, 2, _PARTIZAN, _PARTIZAN, 'Stevens', 3, 4, 0, 4, 0, 3),
        (_SAISON, 1, 2, _PARTIZAN, _PARTIZAN, 'Pajola', 4, 2, 1, 0, 4, 2),
        (_SAISON, 1, 2, _PARTIZAN, _PARTIZAN, 'Jones', 2, 1, 2, 1, 4, 1),
        (_SAISON, 1, 2, _PARTIZAN, _PARTIZAN, 'Willis', 2, 3, 0, 3, 2, 0),
        (_SAISON, 1, 2, _PARTIZAN, _PARTIZAN, 'Lakic', 1, 2, 1, 1, 2, 2),
        (_SAISON, 1, 2, _PARTIZAN, _PARTIZAN, 'Lauvergne', 1, 2, 0, 4, 0, 0),
        (_SAISON, 1, 2, _PARTIZAN, _PARTIZAN, 'Vildoza', 1, 0, 1, 1, 7, 1),
        (_SAISON, 1, 2, _PARTIZAN, _PARTIZAN, 'Hayes', 0, 1, 0, 2, 0, 0),
        (_SAISON, 1, 2, _PARTIZAN, _PARIS, 'Etienne', 1, 4, 4, 5, 0, 1),
        (_SAISON, 1, 2, _PARTIZAN, _PARIS, 'Tarpey', 1, 4, 2, 3, 3, 0),
        (_SAISON, 1, 2, _PARTIZAN, _PARIS, 'Rhoden', 1, 2, 2, 4, 1, 2),
        (_SAISON, 1, 2, _PARTIZAN, _PARIS, 'Pereira', 1, 3, 1, 1, 1, 1),
        (_SAISON, 1, 2, _PARTIZAN, _PARIS, 'Hifi', 3, 3, 0, 4, 3, 0),
        (_SAISON, 1, 2, _PARTIZAN, _PARIS, 'Ntilikina', 4, 1, 0, 6, 3, 1),
        (_SAISON, 1, 2, _PARTIZAN, _PARIS, 'Johnson', 0, 3, 0, 3, 0, 0),
        (_SAISON, 1, 2, _PARTIZAN, _PARIS, 'Dokossi', 0, 1, 1, 6, 1, 1),
        (_SAISON, 1, 2, _PARTIZAN, _PARIS, 'Morgan', 0, 1, 0, 0, 0, 1),
        (_SAISON, 1, 2, _PARTIZAN, _PARIS, 'Warren', 1, 0, 0, 1, 2, 1),

        -- mini-saison 1 · J3 · Fenerbahçe 93 - 88 Panathinaikos
        (_SAISON, 1, 3, _FENERBAHCE, _FENERBAHCE, 'Bitim', 5, 3, 3, 6, 4, 1),
        (_SAISON, 1, 3, _FENERBAHCE, _FENERBAHCE, 'Silva', 1, 8, 0, 5, 0, 0),
        (_SAISON, 1, 3, _FENERBAHCE, _FENERBAHCE, 'Sanli', 2, 7, 0, 5, 0, 0),
        (_SAISON, 1, 3, _FENERBAHCE, _FENERBAHCE, 'Melli', 2, 3, 2, 3, 3, 0),
        (_SAISON, 1, 3, _FENERBAHCE, _FENERBAHCE, 'Baldwin IV', 2, 1, 2, 4, 4, 1),
        (_SAISON, 1, 3, _FENERBAHCE, _FENERBAHCE, 'Shields', 3, 1, 0, 1, 0, 1),
        (_SAISON, 1, 3, _FENERBAHCE, _FENERBAHCE, 'Forrest', 1, 2, 0, 1, 3, 3),
        (_SAISON, 1, 3, _FENERBAHCE, _FENERBAHCE, 'Clyburn', 2, 0, 0, 8, 3, 1),
        (_SAISON, 1, 3, _FENERBAHCE, _FENERBAHCE, 'Horton-Tucker', 0, 1, 0, 1, 1, 0),
        (_SAISON, 1, 3, _FENERBAHCE, _FENERBAHCE, 'Key', 0, 1, 0, 0, 3, 0),
        (_SAISON, 1, 3, _FENERBAHCE, _PANATHINAIKOS, 'Nunn', 2, 2, 5, 2, 0, 2),
        (_SAISON, 1, 3, _FENERBAHCE, _PANATHINAIKOS, 'Francisco', 1, 2, 2, 3, 6, 1),
        (_SAISON, 1, 3, _FENERBAHCE, _PANATHINAIKOS, 'Hayes-Davis', 1, 3, 1, 6, 0, 1),
        (_SAISON, 1, 3, _FENERBAHCE, _PANATHINAIKOS, 'Yabusele', 3, 1, 1, 5, 0, 1),
        (_SAISON, 1, 3, _FENERBAHCE, _PANATHINAIKOS, 'Sloukas', 2, 0, 2, 0, 2, 1),
        (_SAISON, 1, 3, _FENERBAHCE, _PANATHINAIKOS, 'Grant', 2, 1, 1, 1, 5, 0),
        (_SAISON, 1, 3, _FENERBAHCE, _PANATHINAIKOS, 'Kalaitzakis', 1, 3, 0, 3, 1, 1),
        (_SAISON, 1, 3, _FENERBAHCE, _PANATHINAIKOS, 'Hernangomez', 1, 3, 0, 6, 1, 0),
        (_SAISON, 1, 3, _FENERBAHCE, _PANATHINAIKOS, 'Fall', 2, 2, 0, 7, 0, 0),
        (_SAISON, 1, 3, _FENERBAHCE, _PANATHINAIKOS, 'Bonga', 1, 1, 0, 1, 1, 0),

        -- mini-saison 1 · J3 · Bayern 86 - 85 Paris
        (_SAISON, 1, 3, _BAYERN, _BAYERN, 'Jokubaitis', 3, 5, 2, 2, 2, 1),
        (_SAISON, 1, 3, _BAYERN, _BAYERN, 'Jessup', 0, 2, 3, 3, 0, 0),
        (_SAISON, 1, 3, _BAYERN, _BAYERN, 'Obst', 3, 3, 0, 1, 1, 0),
        (_SAISON, 1, 3, _BAYERN, _BAYERN, 'Voigtmann', 2, 3, 0, 6, 2, 0),
        (_SAISON, 1, 3, _BAYERN, _BAYERN, 'Wiley', 1, 2, 1, 4, 2, 0),
        (_SAISON, 1, 3, _BAYERN, _BAYERN, 'Washington Jr.', 1, 3, 0, 0, 2, 0),
        (_SAISON, 1, 3, _BAYERN, _BAYERN, 'Giffey', 0, 2, 1, 5, 3, 0),
        (_SAISON, 1, 3, _BAYERN, _BAYERN, 'Thiemann', 0, 3, 0, 4, 1, 0),
        (_SAISON, 1, 3, _BAYERN, _BAYERN, 'Jensen', 1, 2, 0, 4, 1, 1),
        (_SAISON, 1, 3, _BAYERN, _BAYERN, 'Lucic', 0, 2, 0, 1, 0, 3),
        (_SAISON, 1, 3, _BAYERN, _PARIS, 'Ntilikina', 3, 7, 1, 1, 6, 2),
        (_SAISON, 1, 3, _BAYERN, _PARIS, 'Hifi', 3, 3, 2, 3, 5, 2),
        (_SAISON, 1, 3, _BAYERN, _PARIS, 'Pereira', 2, 2, 2, 1, 0, 3),
        (_SAISON, 1, 3, _BAYERN, _PARIS, 'Hommes', 3, 2, 1, 3, 1, 1),
        (_SAISON, 1, 3, _BAYERN, _PARIS, 'Tarpey', 0, 2, 1, 2, 2, 1),
        (_SAISON, 1, 3, _BAYERN, _PARIS, 'Warren', 4, 0, 1, 5, 1, 1),
        (_SAISON, 1, 3, _BAYERN, _PARIS, 'Dokossi', 0, 3, 0, 7, 1, 0),
        (_SAISON, 1, 3, _BAYERN, _PARIS, 'Rhoden', 1, 2, 0, 5, 0, 0),
        (_SAISON, 1, 3, _BAYERN, _PARIS, 'Etienne', 0, 1, 0, 1, 1, 1),
        (_SAISON, 1, 3, _BAYERN, _PARIS, 'Morgan', 1, 0, 0, 5, 1, 0),

        -- mini-saison 1 · J4 · Fenerbahçe 78 - 83 Paris
        (_SAISON, 1, 4, _FENERBAHCE, _FENERBAHCE, 'Melli', 4, 6, 1, 3, 1, 1),
        (_SAISON, 1, 4, _FENERBAHCE, _FENERBAHCE, 'Bitim', 3, 2, 1, 5, 1, 0),
        (_SAISON, 1, 4, _FENERBAHCE, _FENERBAHCE, 'Forrest', 2, 2, 1, 0, 6, 4),
        (_SAISON, 1, 4, _FENERBAHCE, _FENERBAHCE, 'Mahmutoglu', 1, 1, 2, 3, 1, 1),
        (_SAISON, 1, 4, _FENERBAHCE, _FENERBAHCE, 'Silva', 4, 2, 0, 6, 2, 0),
        (_SAISON, 1, 4, _FENERBAHCE, _FENERBAHCE, 'Shields', 3, 1, 1, 3, 2, 1),
        (_SAISON, 1, 4, _FENERBAHCE, _FENERBAHCE, 'Horton-Tucker', 2, 2, 0, 1, 1, 1),
        (_SAISON, 1, 4, _FENERBAHCE, _FENERBAHCE, 'Sanli', 0, 3, 0, 6, 2, 1),
        (_SAISON, 1, 4, _FENERBAHCE, _FENERBAHCE, 'Bingham Jr.', 0, 1, 0, 7, 1, 0),
        (_SAISON, 1, 4, _FENERBAHCE, _FENERBAHCE, 'Larkin', 1, 0, 0, 1, 2, 1),
        (_SAISON, 1, 4, _FENERBAHCE, _PARIS, 'Hifi', 2, 4, 2, 1, 3, 0),
        (_SAISON, 1, 4, _FENERBAHCE, _PARIS, 'Ntilikina', 0, 3, 3, 1, 10, 1),
        (_SAISON, 1, 4, _FENERBAHCE, _PARIS, 'Pereira', 4, 3, 1, 9, 3, 2),
        (_SAISON, 1, 4, _FENERBAHCE, _PARIS, 'Tarpey', 5, 3, 0, 1, 1, 0),
        (_SAISON, 1, 4, _FENERBAHCE, _PARIS, 'Morgan', 6, 1, 1, 3, 3, 0),
        (_SAISON, 1, 4, _FENERBAHCE, _PARIS, 'Dokossi', 3, 2, 0, 4, 0, 1),
        (_SAISON, 1, 4, _FENERBAHCE, _PARIS, 'Warren', 0, 2, 1, 2, 2, 1),
        (_SAISON, 1, 4, _FENERBAHCE, _PARIS, 'Rhoden', 2, 0, 0, 1, 0, 1),
        (_SAISON, 1, 4, _FENERBAHCE, _PARIS, 'Herrera', 1, 0, 0, 2, 1, 1),
        (_SAISON, 1, 4, _FENERBAHCE, _PARIS, 'Etienne', 0, 0, 0, 3, 0, 0),

        -- mini-saison 1 · J4 · Panathinaikos 93 - 84 Partizan
        (_SAISON, 1, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Hernangomez', 2, 7, 0, 2, 0, 0),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Kalaitzakis', 1, 4, 2, 3, 0, 1),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Yabusele', 4, 4, 0, 4, 1, 1),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Nunn', 2, 2, 2, 2, 2, 2),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Badio', 2, 1, 2, 3, 1, 0),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Francisco', 2, 2, 1, 0, 6, 0),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Grant', 2, 0, 2, 2, 2, 1),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Fall', 0, 3, 0, 6, 0, 0),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Mitoglou', 1, 1, 0, 6, 0, 1),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Hayes-Davis', 0, 1, 0, 4, 0, 0),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PARTIZAN, 'Vildoza', 3, 1, 5, 4, 3, 0),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PARTIZAN, 'Marinkovic', 3, 1, 4, 3, 3, 1),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PARTIZAN, 'Willis', 1, 4, 1, 8, 0, 0),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PARTIZAN, 'Stevens', 4, 1, 1, 6, 1, 0),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PARTIZAN, 'Jones', 3, 2, 0, 1, 6, 0),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PARTIZAN, 'Jekiri', 2, 2, 0, 10, 4, 0),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PARTIZAN, 'Pajola', 3, 1, 0, 1, 1, 1),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PARTIZAN, 'Lauvergne', 0, 2, 0, 6, 0, 0),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PARTIZAN, 'Lakic', 2, 1, 0, 0, 1, 1),
        (_SAISON, 1, 4, _PANATHINAIKOS, _PARTIZAN, 'Allman', 0, 0, 0, 0, 0, 0),

        -- mini-saison 1 · J5 · Fenerbahçe 85 - 61 Partizan
        (_SAISON, 1, 5, _FENERBAHCE, _FENERBAHCE, 'Bitim', 2, 4, 4, 3, 5, 3),
        (_SAISON, 1, 5, _FENERBAHCE, _FENERBAHCE, 'Shields', 1, 6, 1, 7, 3, 0),
        (_SAISON, 1, 5, _FENERBAHCE, _FENERBAHCE, 'Silva', 5, 1, 1, 12, 3, 0),
        (_SAISON, 1, 5, _FENERBAHCE, _FENERBAHCE, 'Melli', 0, 2, 1, 7, 1, 1),
        (_SAISON, 1, 5, _FENERBAHCE, _FENERBAHCE, 'Clyburn', 1, 0, 2, 2, 2, 0),
        (_SAISON, 1, 5, _FENERBAHCE, _FENERBAHCE, 'Horton-Tucker', 2, 1, 1, 1, 0, 1),
        (_SAISON, 1, 5, _FENERBAHCE, _FENERBAHCE, 'Juzang', 5, 1, 0, 5, 0, 0),
        (_SAISON, 1, 5, _FENERBAHCE, _FENERBAHCE, 'Forrest', 0, 0, 1, 2, 2, 0),
        (_SAISON, 1, 5, _FENERBAHCE, _FENERBAHCE, 'Key', 1, 1, 0, 5, 1, 0),
        (_SAISON, 1, 5, _FENERBAHCE, _FENERBAHCE, 'Mahmutoglu', 3, 0, 0, 0, 3, 0),
        (_SAISON, 1, 5, _FENERBAHCE, _PARTIZAN, 'Marinkovic', 5, 2, 1, 5, 0, 0),
        (_SAISON, 1, 5, _FENERBAHCE, _PARTIZAN, 'Jekiri', 4, 2, 0, 7, 0, 0),
        (_SAISON, 1, 5, _FENERBAHCE, _PARTIZAN, 'Willis', 5, 1, 0, 3, 1, 2),
        (_SAISON, 1, 5, _FENERBAHCE, _PARTIZAN, 'Allman', 2, 1, 1, 3, 2, 1),
        (_SAISON, 1, 5, _FENERBAHCE, _PARTIZAN, 'Jones', 3, 0, 1, 0, 4, 2),
        (_SAISON, 1, 5, _FENERBAHCE, _PARTIZAN, 'Lakic', 1, 2, 0, 5, 1, 0),
        (_SAISON, 1, 5, _FENERBAHCE, _PARTIZAN, 'Vildoza', 2, 0, 1, 1, 3, 0),
        (_SAISON, 1, 5, _FENERBAHCE, _PARTIZAN, 'Stevens', 2, 1, 0, 2, 2, 0),
        (_SAISON, 1, 5, _FENERBAHCE, _PARTIZAN, 'Pajola', 1, 0, 1, 0, 2, 0),
        (_SAISON, 1, 5, _FENERBAHCE, _PARTIZAN, 'Lauvergne', 1, 1, 0, 4, 1, 0),

        -- mini-saison 1 · J5 · Panathinaikos 100 - 77 Bayern
        (_SAISON, 1, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Francisco', 3, 5, 2, 2, 3, 0),
        (_SAISON, 1, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Kalaitzakis', 3, 3, 2, 4, 1, 2),
        (_SAISON, 1, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Hernangomez', 2, 3, 2, 10, 1, 1),
        (_SAISON, 1, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Grant', 4, 3, 1, 2, 7, 1),
        (_SAISON, 1, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Yabusele', 2, 2, 1, 13, 1, 1),
        (_SAISON, 1, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Sloukas', 1, 4, 0, 2, 2, 1),
        (_SAISON, 1, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Bonga', 2, 1, 1, 1, 1, 0),
        (_SAISON, 1, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Mantzoukas', 2, 2, 0, 2, 0, 0),
        (_SAISON, 1, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Nunn', 1, 0, 1, 1, 1, 0),
        (_SAISON, 1, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Badio', 0, 2, 0, 0, 0, 1),
        (_SAISON, 1, 5, _PANATHINAIKOS, _BAYERN, 'Wiley', 3, 8, 0, 10, 0, 0),
        (_SAISON, 1, 5, _PANATHINAIKOS, _BAYERN, 'Giffey', 3, 1, 3, 6, 1, 0),
        (_SAISON, 1, 5, _PANATHINAIKOS, _BAYERN, 'Jessup', 2, 1, 3, 2, 1, 2),
        (_SAISON, 1, 5, _PANATHINAIKOS, _BAYERN, 'Jokubaitis', 4, 0, 1, 0, 5, 2),
        (_SAISON, 1, 5, _PANATHINAIKOS, _BAYERN, 'Obst', 2, 2, 0, 1, 2, 0),
        (_SAISON, 1, 5, _PANATHINAIKOS, _BAYERN, 'Voigtmann', 0, 3, 0, 7, 0, 0),
        (_SAISON, 1, 5, _PANATHINAIKOS, _BAYERN, 'da Silva', 1, 1, 1, 11, 0, 0),
        (_SAISON, 1, 5, _PANATHINAIKOS, _BAYERN, 'Hollatz', 1, 1, 0, 0, 2, 1),
        (_SAISON, 1, 5, _PANATHINAIKOS, _BAYERN, 'Washington Jr.', 0, 1, 0, 1, 2, 2),
        (_SAISON, 1, 5, _PANATHINAIKOS, _BAYERN, 'Jensen', 1, 0, 0, 0, 3, 0),

        -- mini-saison 1 · J6 · Bayern 90 - 77 Partizan
        (_SAISON, 1, 6, _BAYERN, _BAYERN, 'Voigtmann', 3, 4, 1, 7, 1, 1),
        (_SAISON, 1, 6, _BAYERN, _BAYERN, 'Hollatz', 3, 2, 2, 1, 1, 0),
        (_SAISON, 1, 6, _BAYERN, _BAYERN, 'Lucic', 1, 1, 3, 3, 0, 1),
        (_SAISON, 1, 6, _BAYERN, _BAYERN, 'Thiemann', 1, 3, 1, 3, 1, 0),
        (_SAISON, 1, 6, _BAYERN, _BAYERN, 'Jokubaitis', 4, 0, 2, 0, 5, 1),
        (_SAISON, 1, 6, _BAYERN, _BAYERN, 'Wiley', 0, 5, 0, 8, 0, 1),
        (_SAISON, 1, 6, _BAYERN, _BAYERN, 'Jessup', 0, 3, 0, 3, 0, 1),
        (_SAISON, 1, 6, _BAYERN, _BAYERN, 'Baldwin', 4, 1, 0, 1, 2, 1),
        (_SAISON, 1, 6, _BAYERN, _BAYERN, 'da Silva', 0, 1, 1, 5, 0, 0),
        (_SAISON, 1, 6, _BAYERN, _BAYERN, 'Jensen', 2, 1, 0, 1, 1, 0),
        (_SAISON, 1, 6, _BAYERN, _PARTIZAN, 'Jekiri', 3, 4, 0, 7, 1, 0),
        (_SAISON, 1, 6, _BAYERN, _PARTIZAN, 'Marinkovic', 1, 0, 3, 3, 3, 0),
        (_SAISON, 1, 6, _BAYERN, _PARTIZAN, 'Tanaskovic', 2, 2, 1, 1, 1, 2),
        (_SAISON, 1, 6, _BAYERN, _PARTIZAN, 'Jones', 0, 1, 2, 0, 5, 1),
        (_SAISON, 1, 6, _BAYERN, _PARTIZAN, 'Lakic', 0, 1, 2, 2, 2, 0),
        (_SAISON, 1, 6, _BAYERN, _PARTIZAN, 'Vildoza', 1, 0, 2, 3, 4, 0),
        (_SAISON, 1, 6, _BAYERN, _PARTIZAN, 'Stevens', 3, 2, 0, 3, 2, 0),
        (_SAISON, 1, 6, _BAYERN, _PARTIZAN, 'Willis', 2, 1, 1, 4, 0, 2),
        (_SAISON, 1, 6, _BAYERN, _PARTIZAN, 'Pajola', 2, 0, 1, 0, 5, 0),
        (_SAISON, 1, 6, _BAYERN, _PARTIZAN, 'Lauvergne', 1, 2, 0, 8, 1, 0),

        -- mini-saison 1 · J6 · Panathinaikos 99 - 79 Paris
        (_SAISON, 1, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Francisco', 4, 5, 2, 4, 3, 0),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Sloukas', 0, 4, 2, 1, 3, 3),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Nunn', 1, 3, 2, 1, 0, 0),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Grant', 3, 1, 2, 0, 6, 1),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Fall', 1, 5, 0, 11, 0, 0),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Kalaitzakis', 1, 3, 1, 3, 2, 0),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Yabusele', 0, 4, 0, 8, 1, 3),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Mitoglou', 0, 3, 0, 6, 0, 0),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Hernangomez', 2, 1, 0, 1, 0, 0),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Hayes-Davis', 0, 1, 0, 0, 0, 0),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PARIS, 'Hifi', 2, 6, 2, 1, 7, 0),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PARIS, 'Tarpey', 4, 5, 1, 5, 0, 1),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PARIS, 'Ntilikina', 1, 4, 1, 2, 3, 1),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PARIS, 'Pereira', 1, 2, 1, 11, 1, 0),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PARIS, 'Warren', 0, 4, 0, 3, 0, 1),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PARIS, 'Etienne', 1, 2, 0, 2, 1, 1),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PARIS, 'Dokossi', 2, 1, 0, 6, 0, 0),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PARIS, 'Rhoden', 3, 0, 0, 8, 0, 1),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PARIS, 'Morgan', 0, 1, 0, 0, 1, 0),
        (_SAISON, 1, 6, _PANATHINAIKOS, _PARIS, 'Herrera', 0, 0, 0, 0, 2, 1),

        -- mini-saison 1 · J7 · Bayern 79 - 86 Fenerbahçe
        (_SAISON, 1, 7, _BAYERN, _BAYERN, 'Jokubaitis', 3, 3, 2, 1, 8, 3),
        (_SAISON, 1, 7, _BAYERN, _BAYERN, 'Jensen', 6, 4, 0, 2, 1, 0),
        (_SAISON, 1, 7, _BAYERN, _BAYERN, 'Wiley', 3, 3, 0, 6, 1, 0),
        (_SAISON, 1, 7, _BAYERN, _BAYERN, 'Giffey', 0, 3, 1, 2, 0, 0),
        (_SAISON, 1, 7, _BAYERN, _BAYERN, 'Thiemann', 1, 2, 1, 6, 0, 3),
        (_SAISON, 1, 7, _BAYERN, _BAYERN, 'Washington Jr.', 2, 2, 0, 3, 5, 0),
        (_SAISON, 1, 7, _BAYERN, _BAYERN, 'Jessup', 0, 1, 1, 1, 2, 0),
        (_SAISON, 1, 7, _BAYERN, _BAYERN, 'Hollatz', 3, 1, 0, 1, 5, 1),
        (_SAISON, 1, 7, _BAYERN, _BAYERN, 'da Silva', 1, 0, 1, 3, 0, 1),
        (_SAISON, 1, 7, _BAYERN, _BAYERN, 'Voigtmann', 4, 0, 0, 8, 0, 1),
        (_SAISON, 1, 7, _BAYERN, _FENERBAHCE, 'Bitim', 2, 4, 3, 4, 0, 1),
        (_SAISON, 1, 7, _BAYERN, _FENERBAHCE, 'Melli', 2, 5, 1, 5, 1, 1),
        (_SAISON, 1, 7, _BAYERN, _FENERBAHCE, 'Mahmutoglu', 1, 0, 3, 0, 1, 0),
        (_SAISON, 1, 7, _BAYERN, _FENERBAHCE, 'Forrest', 1, 1, 2, 1, 8, 0),
        (_SAISON, 1, 7, _BAYERN, _FENERBAHCE, 'Horton-Tucker', 2, 0, 2, 2, 2, 0),
        (_SAISON, 1, 7, _BAYERN, _FENERBAHCE, 'Bingham Jr.', 3, 2, 0, 7, 0, 0),
        (_SAISON, 1, 7, _BAYERN, _FENERBAHCE, 'Baldwin IV', 1, 0, 2, 0, 3, 0),
        (_SAISON, 1, 7, _BAYERN, _FENERBAHCE, 'Shields', 3, 1, 0, 3, 2, 2),
        (_SAISON, 1, 7, _BAYERN, _FENERBAHCE, 'Sanli', 0, 2, 0, 4, 0, 0),
        (_SAISON, 1, 7, _BAYERN, _FENERBAHCE, 'Silva', 2, 0, 0, 7, 2, 3),

        -- mini-saison 1 · J7 · Paris 87 - 82 Partizan
        (_SAISON, 1, 7, _PARIS, _PARIS, 'Hifi', 3, 3, 4, 2, 3, 3),
        (_SAISON, 1, 7, _PARIS, _PARIS, 'Rhoden', 1, 6, 0, 5, 1, 1),
        (_SAISON, 1, 7, _PARIS, _PARIS, 'Pereira', 5, 2, 1, 3, 2, 0),
        (_SAISON, 1, 7, _PARIS, _PARIS, 'Warren', 2, 3, 1, 1, 0, 1),
        (_SAISON, 1, 7, _PARIS, _PARIS, 'Ntilikina', 1, 1, 2, 2, 8, 1),
        (_SAISON, 1, 7, _PARIS, _PARIS, 'Dokossi', 2, 3, 0, 11, 0, 2),
        (_SAISON, 1, 7, _PARIS, _PARIS, 'Etienne', 2, 2, 0, 2, 1, 0),
        (_SAISON, 1, 7, _PARIS, _PARIS, 'Morgan', 2, 0, 1, 6, 1, 0),
        (_SAISON, 1, 7, _PARIS, _PARIS, 'Tarpey', 1, 0, 0, 1, 1, 1),
        (_SAISON, 1, 7, _PARIS, _PARIS, 'Hommes', 1, 0, 0, 1, 1, 0),
        (_SAISON, 1, 7, _PARIS, _PARTIZAN, 'Marinkovic', 0, 3, 3, 2, 1, 1),
        (_SAISON, 1, 7, _PARIS, _PARTIZAN, 'Jekiri', 4, 5, 0, 11, 1, 0),
        (_SAISON, 1, 7, _PARIS, _PARTIZAN, 'Stevens', 4, 2, 1, 4, 2, 1),
        (_SAISON, 1, 7, _PARIS, _PARTIZAN, 'Tanaskovic', 1, 2, 2, 4, 0, 0),
        (_SAISON, 1, 7, _PARIS, _PARTIZAN, 'Willis', 2, 2, 0, 3, 1, 0),
        (_SAISON, 1, 7, _PARIS, _PARTIZAN, 'Jones', 0, 3, 0, 0, 2, 2),
        (_SAISON, 1, 7, _PARIS, _PARTIZAN, 'Pajola', 0, 1, 1, 2, 3, 0),
        (_SAISON, 1, 7, _PARIS, _PARTIZAN, 'Vildoza', 2, 0, 1, 2, 2, 2),
        (_SAISON, 1, 7, _PARIS, _PARTIZAN, 'Lakic', 0, 1, 1, 2, 0, 2),
        (_SAISON, 1, 7, _PARIS, _PARTIZAN, 'Allman', 1, 0, 1, 1, 2, 1),

        -- mini-saison 1 · J8 · Panathinaikos 93 - 78 Fenerbahçe
        (_SAISON, 1, 8, _PANATHINAIKOS, _PANATHINAIKOS, 'Nunn', 0, 5, 2, 1, 0, 1),
        (_SAISON, 1, 8, _PANATHINAIKOS, _PANATHINAIKOS, 'Yabusele', 1, 6, 0, 7, 0, 1),
        (_SAISON, 1, 8, _PANATHINAIKOS, _PANATHINAIKOS, 'Kalaitzakis', 0, 4, 1, 0, 2, 0),
        (_SAISON, 1, 8, _PANATHINAIKOS, _PANATHINAIKOS, 'Badio', 1, 2, 2, 2, 2, 0),
        (_SAISON, 1, 8, _PANATHINAIKOS, _PANATHINAIKOS, 'Grant', 1, 1, 2, 3, 3, 2),
        (_SAISON, 1, 8, _PANATHINAIKOS, _PANATHINAIKOS, 'Fall', 1, 4, 0, 7, 2, 1),
        (_SAISON, 1, 8, _PANATHINAIKOS, _PANATHINAIKOS, 'Bonga', 0, 0, 3, 3, 0, 0),
        (_SAISON, 1, 8, _PANATHINAIKOS, _PANATHINAIKOS, 'Francisco', 2, 2, 0, 1, 5, 0),
        (_SAISON, 1, 8, _PANATHINAIKOS, _PANATHINAIKOS, 'Hernangomez', 3, 1, 0, 6, 1, 0),
        (_SAISON, 1, 8, _PANATHINAIKOS, _PANATHINAIKOS, 'Sloukas', 1, 0, 1, 2, 4, 1),
        (_SAISON, 1, 8, _PANATHINAIKOS, _FENERBAHCE, 'Silva', 5, 7, 0, 11, 0, 0),
        (_SAISON, 1, 8, _PANATHINAIKOS, _FENERBAHCE, 'Shields', 2, 3, 2, 1, 2, 1),
        (_SAISON, 1, 8, _PANATHINAIKOS, _FENERBAHCE, 'Bitim', 1, 3, 2, 6, 4, 2),
        (_SAISON, 1, 8, _PANATHINAIKOS, _FENERBAHCE, 'Melli', 1, 3, 1, 5, 1, 2),
        (_SAISON, 1, 8, _PANATHINAIKOS, _FENERBAHCE, 'Horton-Tucker', 2, 1, 1, 0, 1, 1),
        (_SAISON, 1, 8, _PANATHINAIKOS, _FENERBAHCE, 'Forrest', 1, 1, 1, 2, 2, 1),
        (_SAISON, 1, 8, _PANATHINAIKOS, _FENERBAHCE, 'Sargiunas', 1, 2, 0, 0, 0, 0),
        (_SAISON, 1, 8, _PANATHINAIKOS, _FENERBAHCE, 'Baldwin IV', 0, 0, 1, 2, 2, 0),
        (_SAISON, 1, 8, _PANATHINAIKOS, _FENERBAHCE, 'Key', 1, 0, 0, 5, 2, 0),
        (_SAISON, 1, 8, _PANATHINAIKOS, _FENERBAHCE, 'Bingham Jr.', 0, 0, 0, 4, 1, 0),

        -- mini-saison 1 · J8 · Paris 73 - 96 Bayern
        (_SAISON, 1, 8, _PARIS, _PARIS, 'Dokossi', 3, 4, 0, 5, 0, 0),
        (_SAISON, 1, 8, _PARIS, _PARIS, 'Pereira', 1, 3, 1, 4, 2, 1),
        (_SAISON, 1, 8, _PARIS, _PARIS, 'Hifi', 2, 2, 1, 3, 4, 4),
        (_SAISON, 1, 8, _PARIS, _PARIS, 'Tarpey', 2, 2, 1, 3, 3, 0),
        (_SAISON, 1, 8, _PARIS, _PARIS, 'Rhoden', 4, 1, 1, 2, 0, 0),
        (_SAISON, 1, 8, _PARIS, _PARIS, 'Ntilikina', 1, 1, 1, 1, 6, 4),
        (_SAISON, 1, 8, _PARIS, _PARIS, 'Warren', 0, 1, 1, 3, 0, 1),
        (_SAISON, 1, 8, _PARIS, _PARIS, 'Etienne', 2, 0, 1, 2, 0, 0),
        (_SAISON, 1, 8, _PARIS, _PARIS, 'Hommes', 1, 2, 0, 2, 0, 0),
        (_SAISON, 1, 8, _PARIS, _PARIS, 'Morgan', 0, 2, 0, 1, 0, 0),
        (_SAISON, 1, 8, _PARIS, _BAYERN, 'Jensen', 1, 4, 3, 2, 1, 0),
        (_SAISON, 1, 8, _PARIS, _BAYERN, 'Thiemann', 2, 8, 0, 1, 2, 0),
        (_SAISON, 1, 8, _PARIS, _BAYERN, 'Wiley', 1, 8, 0, 10, 1, 0),
        (_SAISON, 1, 8, _PARIS, _BAYERN, 'Jokubaitis', 3, 2, 1, 2, 3, 3),
        (_SAISON, 1, 8, _PARIS, _BAYERN, 'Washington Jr.', 0, 5, 0, 0, 3, 1),
        (_SAISON, 1, 8, _PARIS, _BAYERN, 'Giffey', 1, 2, 0, 5, 2, 0),
        (_SAISON, 1, 8, _PARIS, _BAYERN, 'Lucic', 0, 1, 1, 1, 4, 0),
        (_SAISON, 1, 8, _PARIS, _BAYERN, 'Jessup', 1, 2, 0, 1, 2, 1),
        (_SAISON, 1, 8, _PARIS, _BAYERN, 'da Silva', 1, 2, 0, 6, 1, 0),
        (_SAISON, 1, 8, _PARIS, _BAYERN, 'Obst', 0, 0, 1, 1, 1, 0),

        -- mini-saison 1 · J9 · Paris 82 - 88 Fenerbahçe
        (_SAISON, 1, 9, _PARIS, _PARIS, 'Rhoden', 3, 6, 1, 3, 0, 0),
        (_SAISON, 1, 9, _PARIS, _PARIS, 'Pereira', 2, 5, 1, 6, 2, 0),
        (_SAISON, 1, 9, _PARIS, _PARIS, 'Tarpey', 1, 5, 1, 2, 1, 0),
        (_SAISON, 1, 9, _PARIS, _PARIS, 'Dokossi', 1, 1, 2, 5, 4, 0),
        (_SAISON, 1, 9, _PARIS, _PARIS, 'Hommes', 1, 4, 0, 2, 0, 0),
        (_SAISON, 1, 9, _PARIS, _PARIS, 'Ntilikina', 1, 3, 0, 3, 5, 2),
        (_SAISON, 1, 9, _PARIS, _PARIS, 'Hifi', 1, 0, 1, 5, 3, 0),
        (_SAISON, 1, 9, _PARIS, _PARIS, 'Etienne', 1, 1, 0, 2, 3, 1),
        (_SAISON, 1, 9, _PARIS, _PARIS, 'Morgan', 1, 1, 0, 3, 2, 3),
        (_SAISON, 1, 9, _PARIS, _PARIS, 'Herrera', 0, 0, 0, 2, 1, 1),
        (_SAISON, 1, 9, _PARIS, _FENERBAHCE, 'Larkin', 1, 2, 3, 0, 1, 1),
        (_SAISON, 1, 9, _PARIS, _FENERBAHCE, 'Silva', 1, 6, 0, 3, 1, 0),
        (_SAISON, 1, 9, _PARIS, _FENERBAHCE, 'Shields', 1, 5, 0, 5, 1, 1),
        (_SAISON, 1, 9, _PARIS, _FENERBAHCE, 'Baldwin IV', 1, 3, 1, 3, 5, 1),
        (_SAISON, 1, 9, _PARIS, _FENERBAHCE, 'Bitim', 2, 2, 1, 4, 2, 4),
        (_SAISON, 1, 9, _PARIS, _FENERBAHCE, 'Melli', 1, 4, 0, 3, 1, 0),
        (_SAISON, 1, 9, _PARIS, _FENERBAHCE, 'Sanli', 0, 4, 0, 8, 0, 0),
        (_SAISON, 1, 9, _PARIS, _FENERBAHCE, 'Bingham Jr.', 1, 3, 0, 6, 0, 0),
        (_SAISON, 1, 9, _PARIS, _FENERBAHCE, 'Key', 1, 0, 1, 4, 1, 0),
        (_SAISON, 1, 9, _PARIS, _FENERBAHCE, 'Horton-Tucker', 0, 0, 1, 3, 3, 0),

        -- mini-saison 1 · J9 · Partizan 87 - 80 Panathinaikos
        (_SAISON, 1, 9, _PARTIZAN, _PARTIZAN, 'Jones', 3, 3, 3, 0, 2, 2),
        (_SAISON, 1, 9, _PARTIZAN, _PARTIZAN, 'Stevens', 2, 2, 4, 3, 2, 1),
        (_SAISON, 1, 9, _PARTIZAN, _PARTIZAN, 'Willis', 3, 3, 1, 0, 0, 0),
        (_SAISON, 1, 9, _PARTIZAN, _PARTIZAN, 'Lauvergne', 3, 3, 0, 6, 1, 0),
        (_SAISON, 1, 9, _PARTIZAN, _PARTIZAN, 'Pajola', 3, 2, 0, 1, 2, 3),
        (_SAISON, 1, 9, _PARTIZAN, _PARTIZAN, 'Jekiri', 2, 2, 0, 6, 0, 0),
        (_SAISON, 1, 9, _PARTIZAN, _PARTIZAN, 'Lakic', 0, 3, 0, 3, 2, 0),
        (_SAISON, 1, 9, _PARTIZAN, _PARTIZAN, 'Nakic', 1, 1, 1, 4, 0, 0),
        (_SAISON, 1, 9, _PARTIZAN, _PARTIZAN, 'Vildoza', 1, 1, 0, 2, 2, 0),
        (_SAISON, 1, 9, _PARTIZAN, _PARTIZAN, 'Marinkovic', 0, 1, 0, 2, 2, 0),
        (_SAISON, 1, 9, _PARTIZAN, _PANATHINAIKOS, 'Kalaitzakis', 2, 4, 2, 4, 2, 1),
        (_SAISON, 1, 9, _PARTIZAN, _PANATHINAIKOS, 'Grant', 2, 4, 2, 1, 5, 1),
        (_SAISON, 1, 9, _PARTIZAN, _PANATHINAIKOS, 'Francisco', 0, 2, 2, 2, 3, 2),
        (_SAISON, 1, 9, _PARTIZAN, _PANATHINAIKOS, 'Nunn', 1, 2, 1, 3, 0, 0),
        (_SAISON, 1, 9, _PARTIZAN, _PANATHINAIKOS, 'Fall', 3, 2, 0, 11, 0, 1),
        (_SAISON, 1, 9, _PARTIZAN, _PANATHINAIKOS, 'Yabusele', 3, 2, 0, 7, 1, 0),
        (_SAISON, 1, 9, _PARTIZAN, _PANATHINAIKOS, 'Hernangomez', 0, 3, 0, 6, 1, 2),
        (_SAISON, 1, 9, _PARTIZAN, _PANATHINAIKOS, 'Bonga', 0, 1, 1, 3, 1, 1),
        (_SAISON, 1, 9, _PARTIZAN, _PANATHINAIKOS, 'Mantzoukas', 1, 1, 0, 1, 1, 0),
        (_SAISON, 1, 9, _PARTIZAN, _PANATHINAIKOS, 'Sloukas', 0, 1, 0, 1, 1, 1),

        -- mini-saison 1 · J10 · Partizan 86 - 81 Fenerbahçe
        (_SAISON, 1, 10, _PARTIZAN, _PARTIZAN, 'Jones', 3, 2, 3, 2, 1, 0),
        (_SAISON, 1, 10, _PARTIZAN, _PARTIZAN, 'Stevens', 1, 4, 1, 6, 4, 2),
        (_SAISON, 1, 10, _PARTIZAN, _PARTIZAN, 'Vildoza', 2, 1, 2, 1, 3, 2),
        (_SAISON, 1, 10, _PARTIZAN, _PARTIZAN, 'Marinkovic', 2, 4, 0, 2, 3, 2),
        (_SAISON, 1, 10, _PARTIZAN, _PARTIZAN, 'Lauvergne', 2, 2, 1, 10, 1, 0),
        (_SAISON, 1, 10, _PARTIZAN, _PARTIZAN, 'Jekiri', 1, 3, 0, 7, 3, 1),
        (_SAISON, 1, 10, _PARTIZAN, _PARTIZAN, 'Tanaskovic', 2, 1, 1, 1, 0, 1),
        (_SAISON, 1, 10, _PARTIZAN, _PARTIZAN, 'Lakic', 0, 3, 0, 2, 0, 0),
        (_SAISON, 1, 10, _PARTIZAN, _PARTIZAN, 'Pajola', 1, 1, 1, 0, 2, 2),
        (_SAISON, 1, 10, _PARTIZAN, _PARTIZAN, 'Willis', 1, 1, 0, 6, 0, 1),
        (_SAISON, 1, 10, _PARTIZAN, _FENERBAHCE, 'Shields', 2, 2, 4, 4, 2, 1),
        (_SAISON, 1, 10, _PARTIZAN, _FENERBAHCE, 'Clyburn', 0, 2, 2, 1, 1, 0),
        (_SAISON, 1, 10, _PARTIZAN, _FENERBAHCE, 'Bingham Jr.', 1, 4, 0, 9, 0, 1),
        (_SAISON, 1, 10, _PARTIZAN, _FENERBAHCE, 'Baldwin IV', 1, 2, 1, 1, 9, 1),
        (_SAISON, 1, 10, _PARTIZAN, _FENERBAHCE, 'Melli', 0, 4, 0, 5, 0, 2),
        (_SAISON, 1, 10, _PARTIZAN, _FENERBAHCE, 'Silva', 0, 4, 0, 12, 1, 2),
        (_SAISON, 1, 10, _PARTIZAN, _FENERBAHCE, 'Sargiunas', 1, 2, 1, 3, 1, 0),
        (_SAISON, 1, 10, _PARTIZAN, _FENERBAHCE, 'Bitim', 1, 3, 0, 2, 1, 1),
        (_SAISON, 1, 10, _PARTIZAN, _FENERBAHCE, 'Mahmutoglu', 0, 2, 0, 1, 2, 1),
        (_SAISON, 1, 10, _PARTIZAN, _FENERBAHCE, 'Key', 1, 0, 0, 0, 1, 0),

        -- mini-saison 1 · J10 · Bayern 72 - 92 Panathinaikos
        (_SAISON, 1, 10, _BAYERN, _BAYERN, 'Jessup', 3, 1, 3, 4, 2, 1),
        (_SAISON, 1, 10, _BAYERN, _BAYERN, 'Wiley', 3, 5, 0, 12, 1, 0),
        (_SAISON, 1, 10, _BAYERN, _BAYERN, 'Jokubaitis', 2, 3, 1, 3, 8, 0),
        (_SAISON, 1, 10, _BAYERN, _BAYERN, 'Giffey', 2, 0, 2, 1, 1, 0),
        (_SAISON, 1, 10, _BAYERN, _BAYERN, 'Hollatz', 3, 1, 1, 0, 3, 0),
        (_SAISON, 1, 10, _BAYERN, _BAYERN, 'Obst', 1, 2, 0, 1, 2, 0),
        (_SAISON, 1, 10, _BAYERN, _BAYERN, 'Thiemann', 2, 1, 0, 7, 1, 2),
        (_SAISON, 1, 10, _BAYERN, _BAYERN, 'Jensen', 1, 1, 0, 3, 3, 0),
        (_SAISON, 1, 10, _BAYERN, _BAYERN, 'Washington Jr.', 1, 1, 0, 1, 1, 0),
        (_SAISON, 1, 10, _BAYERN, _BAYERN, 'Lucic', 1, 1, 0, 2, 0, 0),
        (_SAISON, 1, 10, _BAYERN, _PANATHINAIKOS, 'Francisco', 4, 2, 3, 0, 4, 1),
        (_SAISON, 1, 10, _BAYERN, _PANATHINAIKOS, 'Hernangomez', 4, 5, 0, 4, 1, 2),
        (_SAISON, 1, 10, _BAYERN, _PANATHINAIKOS, 'Kalaitzakis', 3, 5, 0, 4, 1, 1),
        (_SAISON, 1, 10, _BAYERN, _PANATHINAIKOS, 'Grant', 3, 1, 2, 2, 9, 2),
        (_SAISON, 1, 10, _BAYERN, _PANATHINAIKOS, 'Nunn', 1, 2, 1, 0, 1, 2),
        (_SAISON, 1, 10, _BAYERN, _PANATHINAIKOS, 'Badio', 0, 2, 1, 1, 0, 0),
        (_SAISON, 1, 10, _BAYERN, _PANATHINAIKOS, 'Mantzoukas', 3, 2, 0, 7, 0, 1),
        (_SAISON, 1, 10, _BAYERN, _PANATHINAIKOS, 'Yabusele', 2, 2, 0, 4, 0, 0),
        (_SAISON, 1, 10, _BAYERN, _PANATHINAIKOS, 'Hayes-Davis', 2, 2, 0, 6, 0, 2),
        (_SAISON, 1, 10, _BAYERN, _PANATHINAIKOS, 'Fall', 1, 1, 0, 3, 1, 0),

        -- mini-saison 2 · J1 · Fenerbahçe 90 - 79 Panathinaikos
        (_SAISON, 2, 1, _FENERBAHCE, _FENERBAHCE, 'Bitim', 2, 3, 3, 5, 3, 1),
        (_SAISON, 2, 1, _FENERBAHCE, _FENERBAHCE, 'Shields', 2, 6, 1, 6, 2, 1),
        (_SAISON, 2, 1, _FENERBAHCE, _FENERBAHCE, 'Silva', 1, 6, 0, 10, 2, 0),
        (_SAISON, 2, 1, _FENERBAHCE, _FENERBAHCE, 'Melli', 1, 2, 2, 3, 0, 0),
        (_SAISON, 2, 1, _FENERBAHCE, _FENERBAHCE, 'Juzang', 1, 2, 1, 2, 0, 0),
        (_SAISON, 2, 1, _FENERBAHCE, _FENERBAHCE, 'Horton-Tucker', 1, 0, 2, 0, 1, 0),
        (_SAISON, 2, 1, _FENERBAHCE, _FENERBAHCE, 'Baldwin IV', 0, 2, 1, 1, 5, 2),
        (_SAISON, 2, 1, _FENERBAHCE, _FENERBAHCE, 'Sargiunas', 1, 2, 0, 2, 1, 0),
        (_SAISON, 2, 1, _FENERBAHCE, _FENERBAHCE, 'Clyburn', 1, 0, 1, 1, 1, 1),
        (_SAISON, 2, 1, _FENERBAHCE, _FENERBAHCE, 'Key', 1, 0, 0, 7, 2, 1),
        (_SAISON, 2, 1, _FENERBAHCE, _PANATHINAIKOS, 'Grant', 7, 6, 0, 1, 6, 0),
        (_SAISON, 2, 1, _FENERBAHCE, _PANATHINAIKOS, 'Yabusele', 4, 2, 1, 12, 1, 2),
        (_SAISON, 2, 1, _FENERBAHCE, _PANATHINAIKOS, 'Hayes-Davis', 0, 3, 1, 1, 0, 0),
        (_SAISON, 2, 1, _FENERBAHCE, _PANATHINAIKOS, 'Nunn', 1, 0, 2, 5, 2, 1),
        (_SAISON, 2, 1, _FENERBAHCE, _PANATHINAIKOS, 'Hernangomez', 1, 3, 0, 3, 1, 2),
        (_SAISON, 2, 1, _FENERBAHCE, _PANATHINAIKOS, 'Sloukas', 0, 2, 1, 1, 2, 0),
        (_SAISON, 2, 1, _FENERBAHCE, _PANATHINAIKOS, 'Mantzoukas', 2, 1, 1, 2, 0, 0),
        (_SAISON, 2, 1, _FENERBAHCE, _PANATHINAIKOS, 'Fall', 1, 2, 0, 7, 0, 0),
        (_SAISON, 2, 1, _FENERBAHCE, _PANATHINAIKOS, 'Francisco', 2, 1, 0, 0, 1, 3),
        (_SAISON, 2, 1, _FENERBAHCE, _PANATHINAIKOS, 'Kalaitzakis', 0, 0, 1, 1, 2, 0),

        -- mini-saison 2 · J1 · Bayern 79 - 76 Paris
        (_SAISON, 2, 1, _BAYERN, _BAYERN, 'Giffey', 0, 2, 5, 3, 2, 1),
        (_SAISON, 2, 1, _BAYERN, _BAYERN, 'Jessup', 3, 0, 5, 1, 0, 1),
        (_SAISON, 2, 1, _BAYERN, _BAYERN, 'Jensen', 3, 4, 1, 3, 0, 0),
        (_SAISON, 2, 1, _BAYERN, _BAYERN, 'Hollatz', 3, 1, 0, 1, 2, 2),
        (_SAISON, 2, 1, _BAYERN, _BAYERN, 'Wiley', 0, 2, 0, 11, 0, 1),
        (_SAISON, 2, 1, _BAYERN, _BAYERN, 'Jokubaitis', 2, 1, 0, 2, 2, 2),
        (_SAISON, 2, 1, _BAYERN, _BAYERN, 'Thiemann', 0, 2, 0, 4, 0, 0),
        (_SAISON, 2, 1, _BAYERN, _BAYERN, 'Lucic', 2, 1, 0, 1, 0, 0),
        (_SAISON, 2, 1, _BAYERN, _BAYERN, 'Baldwin', 1, 0, 1, 0, 3, 2),
        (_SAISON, 2, 1, _BAYERN, _BAYERN, 'Voigtmann', 1, 1, 0, 5, 0, 0),
        (_SAISON, 2, 1, _BAYERN, _PARIS, 'Dokossi', 2, 6, 1, 13, 2, 3),
        (_SAISON, 2, 1, _BAYERN, _PARIS, 'Tarpey', 2, 3, 2, 5, 2, 2),
        (_SAISON, 2, 1, _BAYERN, _PARIS, 'Hifi', 1, 5, 0, 4, 0, 0),
        (_SAISON, 2, 1, _BAYERN, _PARIS, 'Rhoden', 0, 2, 2, 7, 0, 0),
        (_SAISON, 2, 1, _BAYERN, _PARIS, 'Morgan', 0, 3, 1, 1, 1, 0),
        (_SAISON, 2, 1, _BAYERN, _PARIS, 'Ntilikina', 2, 2, 0, 0, 4, 1),
        (_SAISON, 2, 1, _BAYERN, _PARIS, 'Pereira', 3, 0, 0, 4, 1, 2),
        (_SAISON, 2, 1, _BAYERN, _PARIS, 'Etienne', 2, 0, 0, 1, 1, 1),
        (_SAISON, 2, 1, _BAYERN, _PARIS, 'Warren', 0, 1, 0, 2, 1, 0),
        (_SAISON, 2, 1, _BAYERN, _PARIS, 'Herrera', 0, 1, 0, 2, 2, 0),

        -- mini-saison 2 · J2 · Fenerbahçe 91 - 66 Partizan
        (_SAISON, 2, 2, _FENERBAHCE, _FENERBAHCE, 'Bingham Jr.', 2, 6, 0, 8, 0, 1),
        (_SAISON, 2, 2, _FENERBAHCE, _FENERBAHCE, 'Shields', 2, 4, 1, 3, 4, 1),
        (_SAISON, 2, 2, _FENERBAHCE, _FENERBAHCE, 'Baldwin IV', 1, 3, 2, 2, 3, 0),
        (_SAISON, 2, 2, _FENERBAHCE, _FENERBAHCE, 'Melli', 1, 4, 1, 8, 4, 1),
        (_SAISON, 2, 2, _FENERBAHCE, _FENERBAHCE, 'Bitim', 0, 2, 2, 4, 4, 0),
        (_SAISON, 2, 2, _FENERBAHCE, _FENERBAHCE, 'Larkin', 0, 1, 2, 0, 0, 0),
        (_SAISON, 2, 2, _FENERBAHCE, _FENERBAHCE, 'Silva', 1, 3, 0, 6, 2, 0),
        (_SAISON, 2, 2, _FENERBAHCE, _FENERBAHCE, 'Clyburn', 1, 2, 0, 3, 1, 0),
        (_SAISON, 2, 2, _FENERBAHCE, _FENERBAHCE, 'Forrest', 1, 2, 0, 1, 0, 1),
        (_SAISON, 2, 2, _FENERBAHCE, _FENERBAHCE, 'Mahmutoglu', 0, 2, 0, 1, 1, 0),
        (_SAISON, 2, 2, _FENERBAHCE, _PARTIZAN, 'Jones', 2, 2, 3, 2, 3, 0),
        (_SAISON, 2, 2, _FENERBAHCE, _PARTIZAN, 'Stevens', 2, 2, 1, 2, 2, 1),
        (_SAISON, 2, 2, _FENERBAHCE, _PARTIZAN, 'Willis', 2, 1, 1, 4, 2, 0),
        (_SAISON, 2, 2, _FENERBAHCE, _PARTIZAN, 'Pajola', 3, 2, 0, 2, 6, 2),
        (_SAISON, 2, 2, _FENERBAHCE, _PARTIZAN, 'Vildoza', 2, 1, 1, 3, 4, 0),
        (_SAISON, 2, 2, _FENERBAHCE, _PARTIZAN, 'Marinkovic', 1, 0, 2, 3, 0, 2),
        (_SAISON, 2, 2, _FENERBAHCE, _PARTIZAN, 'Lakic', 0, 1, 1, 3, 2, 2),
        (_SAISON, 2, 2, _FENERBAHCE, _PARTIZAN, 'Lauvergne', 1, 2, 0, 3, 0, 0),
        (_SAISON, 2, 2, _FENERBAHCE, _PARTIZAN, 'Tanaskovic', 0, 0, 1, 2, 0, 0),
        (_SAISON, 2, 2, _FENERBAHCE, _PARTIZAN, 'Jekiri', 1, 0, 0, 8, 1, 0),

        -- mini-saison 2 · J2 · Paris 90 - 83 Panathinaikos
        (_SAISON, 2, 2, _PARIS, _PARIS, 'Tarpey', 1, 6, 5, 5, 3, 0),
        (_SAISON, 2, 2, _PARIS, _PARIS, 'Hifi', 2, 5, 1, 4, 2, 0),
        (_SAISON, 2, 2, _PARIS, _PARIS, 'Ntilikina', 2, 2, 2, 2, 3, 0),
        (_SAISON, 2, 2, _PARIS, _PARIS, 'Pereira', 2, 3, 1, 3, 2, 1),
        (_SAISON, 2, 2, _PARIS, _PARIS, 'Rhoden', 5, 1, 0, 4, 2, 0),
        (_SAISON, 2, 2, _PARIS, _PARIS, 'Herrera', 2, 1, 1, 2, 0, 0),
        (_SAISON, 2, 2, _PARIS, _PARIS, 'Morgan', 0, 2, 0, 3, 0, 0),
        (_SAISON, 2, 2, _PARIS, _PARIS, 'Etienne', 0, 0, 1, 2, 0, 2),
        (_SAISON, 2, 2, _PARIS, _PARIS, 'Johnson', 3, 0, 0, 3, 2, 0),
        (_SAISON, 2, 2, _PARIS, _PARIS, 'Dokossi', 0, 0, 0, 10, 3, 3),
        (_SAISON, 2, 2, _PARIS, _PANATHINAIKOS, 'Yabusele', 0, 5, 3, 7, 0, 2),
        (_SAISON, 2, 2, _PARIS, _PANATHINAIKOS, 'Hernangomez', 1, 6, 1, 3, 0, 0),
        (_SAISON, 2, 2, _PARIS, _PANATHINAIKOS, 'Grant', 1, 6, 0, 1, 8, 1),
        (_SAISON, 2, 2, _PARIS, _PANATHINAIKOS, 'Fall', 3, 3, 0, 8, 0, 0),
        (_SAISON, 2, 2, _PARIS, _PANATHINAIKOS, 'Sloukas', 1, 2, 1, 1, 2, 0),
        (_SAISON, 2, 2, _PARIS, _PANATHINAIKOS, 'Francisco', 0, 2, 1, 0, 6, 1),
        (_SAISON, 2, 2, _PARIS, _PANATHINAIKOS, 'Kalaitzakis', 0, 2, 0, 4, 0, 1),
        (_SAISON, 2, 2, _PARIS, _PANATHINAIKOS, 'Hayes-Davis', 0, 2, 0, 4, 0, 2),
        (_SAISON, 2, 2, _PARIS, _PANATHINAIKOS, 'Bonga', 0, 1, 0, 2, 1, 0),
        (_SAISON, 2, 2, _PARIS, _PANATHINAIKOS, 'Nunn', 1, 0, 0, 0, 1, 0),

        -- mini-saison 2 · J3 · Bayern 75 - 77 Partizan
        (_SAISON, 2, 3, _BAYERN, _BAYERN, 'Hollatz', 3, 3, 1, 2, 1, 1),
        (_SAISON, 2, 3, _BAYERN, _BAYERN, 'Jokubaitis', 2, 3, 1, 0, 1, 0),
        (_SAISON, 2, 3, _BAYERN, _BAYERN, 'da Silva', 1, 2, 2, 3, 1, 0),
        (_SAISON, 2, 3, _BAYERN, _BAYERN, 'Giffey', 4, 1, 1, 3, 1, 1),
        (_SAISON, 2, 3, _BAYERN, _BAYERN, 'Jessup', 3, 0, 2, 3, 2, 1),
        (_SAISON, 2, 3, _BAYERN, _BAYERN, 'Washington Jr.', 2, 2, 0, 3, 4, 2),
        (_SAISON, 2, 3, _BAYERN, _BAYERN, 'Wiley', 2, 2, 0, 10, 0, 1),
        (_SAISON, 2, 3, _BAYERN, _BAYERN, 'Jensen', 1, 0, 1, 2, 0, 2),
        (_SAISON, 2, 3, _BAYERN, _BAYERN, 'Obst', 2, 1, 0, 3, 2, 1),
        (_SAISON, 2, 3, _BAYERN, _BAYERN, 'Thiemann', 1, 1, 0, 5, 0, 0),
        (_SAISON, 2, 3, _BAYERN, _PARTIZAN, 'Marinkovic', 2, 4, 3, 1, 3, 0),
        (_SAISON, 2, 3, _BAYERN, _PARTIZAN, 'Willis', 3, 2, 1, 7, 0, 0),
        (_SAISON, 2, 3, _BAYERN, _PARTIZAN, 'Stevens', 0, 2, 2, 3, 4, 1),
        (_SAISON, 2, 3, _BAYERN, _PARTIZAN, 'Jekiri', 1, 3, 1, 8, 1, 1),
        (_SAISON, 2, 3, _BAYERN, _PARTIZAN, 'Tanaskovic', 2, 2, 1, 2, 1, 0),
        (_SAISON, 2, 3, _BAYERN, _PARTIZAN, 'Lauvergne', 3, 2, 0, 5, 0, 0),
        (_SAISON, 2, 3, _BAYERN, _PARTIZAN, 'Lakic', 1, 1, 1, 3, 2, 0),
        (_SAISON, 2, 3, _BAYERN, _PARTIZAN, 'Vildoza', 1, 0, 1, 1, 0, 1),
        (_SAISON, 2, 3, _BAYERN, _PARTIZAN, 'Jones', 2, 0, 0, 2, 3, 0),
        (_SAISON, 2, 3, _BAYERN, _PARTIZAN, 'Pajola', 0, 0, 0, 1, 4, 1),

        -- mini-saison 2 · J3 · Paris 90 - 92 Fenerbahçe
        (_SAISON, 2, 3, _PARIS, _PARIS, 'Rhoden', 1, 4, 4, 6, 1, 0),
        (_SAISON, 2, 3, _PARIS, _PARIS, 'Hifi', 2, 1, 5, 4, 2, 1),
        (_SAISON, 2, 3, _PARIS, _PARIS, 'Dokossi', 4, 3, 1, 8, 2, 1),
        (_SAISON, 2, 3, _PARIS, _PARIS, 'Pereira', 0, 4, 1, 2, 0, 1),
        (_SAISON, 2, 3, _PARIS, _PARIS, 'Etienne', 1, 2, 1, 3, 1, 0),
        (_SAISON, 2, 3, _PARIS, _PARIS, 'Warren', 0, 0, 2, 2, 0, 2),
        (_SAISON, 2, 3, _PARIS, _PARIS, 'Herrera', 1, 2, 0, 4, 0, 0),
        (_SAISON, 2, 3, _PARIS, _PARIS, 'Tarpey', 1, 1, 0, 5, 1, 1),
        (_SAISON, 2, 3, _PARIS, _PARIS, 'Hommes', 1, 1, 0, 4, 2, 1),
        (_SAISON, 2, 3, _PARIS, _PARIS, 'Ntilikina', 1, 0, 0, 1, 2, 0),
        (_SAISON, 2, 3, _PARIS, _FENERBAHCE, 'Bitim', 2, 6, 2, 7, 2, 0),
        (_SAISON, 2, 3, _PARIS, _FENERBAHCE, 'Silva', 7, 5, 0, 10, 1, 0),
        (_SAISON, 2, 3, _PARIS, _FENERBAHCE, 'Forrest', 1, 5, 0, 0, 3, 1),
        (_SAISON, 2, 3, _PARIS, _FENERBAHCE, 'Melli', 1, 3, 1, 7, 0, 0),
        (_SAISON, 2, 3, _PARIS, _FENERBAHCE, 'Shields', 3, 2, 1, 1, 1, 2),
        (_SAISON, 2, 3, _PARIS, _FENERBAHCE, 'Mahmutoglu', 1, 1, 2, 0, 0, 1),
        (_SAISON, 2, 3, _PARIS, _FENERBAHCE, 'Horton-Tucker', 1, 1, 1, 1, 0, 0),
        (_SAISON, 2, 3, _PARIS, _FENERBAHCE, 'Bingham Jr.', 0, 2, 0, 11, 1, 0),
        (_SAISON, 2, 3, _PARIS, _FENERBAHCE, 'Clyburn', 1, 1, 0, 2, 0, 1),
        (_SAISON, 2, 3, _PARIS, _FENERBAHCE, 'Baldwin IV', 2, 0, 0, 0, 3, 0),

        -- mini-saison 2 · J4 · Paris 84 - 86 Partizan
        (_SAISON, 2, 4, _PARIS, _PARIS, 'Tarpey', 1, 6, 1, 5, 3, 0),
        (_SAISON, 2, 4, _PARIS, _PARIS, 'Hifi', 3, 2, 3, 4, 3, 1),
        (_SAISON, 2, 4, _PARIS, _PARIS, 'Rhoden', 2, 3, 1, 3, 4, 1),
        (_SAISON, 2, 4, _PARIS, _PARIS, 'Ntilikina', 1, 3, 1, 2, 4, 0),
        (_SAISON, 2, 4, _PARIS, _PARIS, 'Warren', 0, 1, 2, 1, 0, 0),
        (_SAISON, 2, 4, _PARIS, _PARIS, 'Morgan', 0, 2, 1, 6, 1, 1),
        (_SAISON, 2, 4, _PARIS, _PARIS, 'Pereira', 1, 1, 1, 4, 1, 0),
        (_SAISON, 2, 4, _PARIS, _PARIS, 'Dokossi', 3, 0, 1, 7, 0, 0),
        (_SAISON, 2, 4, _PARIS, _PARIS, 'Etienne', 1, 1, 0, 1, 1, 1),
        (_SAISON, 2, 4, _PARIS, _PARIS, 'Johnson', 1, 0, 0, 4, 1, 0),
        (_SAISON, 2, 4, _PARIS, _PARTIZAN, 'Marinkovic', 2, 4, 3, 2, 0, 4),
        (_SAISON, 2, 4, _PARIS, _PARTIZAN, 'Jones', 2, 4, 3, 3, 7, 2),
        (_SAISON, 2, 4, _PARIS, _PARTIZAN, 'Willis', 3, 4, 0, 4, 1, 1),
        (_SAISON, 2, 4, _PARIS, _PARTIZAN, 'Jekiri', 4, 3, 0, 14, 1, 0),
        (_SAISON, 2, 4, _PARIS, _PARTIZAN, 'Vildoza', 1, 3, 1, 0, 4, 1),
        (_SAISON, 2, 4, _PARIS, _PARTIZAN, 'Stevens', 2, 1, 1, 6, 1, 0),
        (_SAISON, 2, 4, _PARIS, _PARTIZAN, 'Pajola', 0, 0, 1, 0, 5, 0),
        (_SAISON, 2, 4, _PARIS, _PARTIZAN, 'Lakic', 0, 0, 1, 2, 2, 0),
        (_SAISON, 2, 4, _PARIS, _PARTIZAN, 'Allman', 0, 1, 0, 1, 0, 1),
        (_SAISON, 2, 4, _PARIS, _PARTIZAN, 'Lauvergne', 0, 1, 0, 5, 2, 1),

        -- mini-saison 2 · J4 · Panathinaikos 81 - 77 Bayern
        (_SAISON, 2, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Francisco', 2, 3, 3, 0, 3, 0),
        (_SAISON, 2, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Fall', 1, 4, 0, 9, 1, 1),
        (_SAISON, 2, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Sloukas', 1, 4, 0, 2, 2, 0),
        (_SAISON, 2, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Mantzoukas', 5, 2, 0, 2, 0, 0),
        (_SAISON, 2, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Yabusele', 2, 3, 0, 3, 1, 1),
        (_SAISON, 2, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Kalaitzakis', 0, 1, 2, 2, 0, 0),
        (_SAISON, 2, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Badio', 1, 0, 2, 3, 2, 0),
        (_SAISON, 2, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Nunn', 1, 1, 1, 4, 1, 1),
        (_SAISON, 2, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Grant', 2, 0, 1, 0, 5, 2),
        (_SAISON, 2, 4, _PANATHINAIKOS, _PANATHINAIKOS, 'Hayes-Davis', 1, 1, 0, 1, 0, 0),
        (_SAISON, 2, 4, _PANATHINAIKOS, _BAYERN, 'Jokubaitis', 1, 2, 5, 7, 2, 1),
        (_SAISON, 2, 4, _PANATHINAIKOS, _BAYERN, 'Giffey', 5, 3, 1, 2, 0, 0),
        (_SAISON, 2, 4, _PANATHINAIKOS, _BAYERN, 'Jensen', 2, 2, 1, 2, 1, 0),
        (_SAISON, 2, 4, _PANATHINAIKOS, _BAYERN, 'Baldwin', 1, 0, 2, 2, 1, 0),
        (_SAISON, 2, 4, _PANATHINAIKOS, _BAYERN, 'Thiemann', 2, 1, 1, 6, 0, 1),
        (_SAISON, 2, 4, _PANATHINAIKOS, _BAYERN, 'Jessup', 1, 1, 1, 4, 1, 2),
        (_SAISON, 2, 4, _PANATHINAIKOS, _BAYERN, 'Washington Jr.', 1, 1, 1, 0, 3, 0),
        (_SAISON, 2, 4, _PANATHINAIKOS, _BAYERN, 'da Silva', 2, 1, 0, 3, 3, 1),
        (_SAISON, 2, 4, _PANATHINAIKOS, _BAYERN, 'Voigtmann', 1, 1, 0, 6, 0, 0),
        (_SAISON, 2, 4, _PANATHINAIKOS, _BAYERN, 'Wiley', 1, 0, 0, 5, 0, 0),

        -- mini-saison 2 · J5 · Panathinaikos 90 - 86 Partizan
        (_SAISON, 2, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Hayes-Davis', 3, 4, 2, 4, 0, 1),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Badio', 0, 3, 3, 2, 1, 2),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Yabusele', 6, 4, 0, 7, 0, 2),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Francisco', 3, 2, 1, 1, 2, 0),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Kalaitzakis', 3, 1, 1, 1, 3, 0),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Bonga', 2, 3, 0, 2, 0, 0),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Grant', 1, 1, 1, 0, 6, 1),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Fall', 0, 2, 0, 6, 2, 0),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Mitoglou', 0, 2, 0, 7, 0, 1),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PANATHINAIKOS, 'Hernangomez', 0, 2, 0, 3, 0, 0),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PARTIZAN, 'Jones', 2, 5, 2, 1, 5, 0),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PARTIZAN, 'Willis', 2, 3, 2, 2, 2, 1),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PARTIZAN, 'Jekiri', 4, 3, 0, 12, 1, 1),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PARTIZAN, 'Marinkovic', 1, 1, 2, 2, 1, 0),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PARTIZAN, 'Nakic', 2, 2, 1, 0, 0, 0),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PARTIZAN, 'Pajola', 0, 3, 0, 1, 4, 0),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PARTIZAN, 'Lauvergne', 0, 3, 0, 5, 1, 0),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PARTIZAN, 'Tanaskovic', 2, 2, 0, 2, 0, 1),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PARTIZAN, 'Vildoza', 1, 2, 0, 0, 3, 1),
        (_SAISON, 2, 5, _PANATHINAIKOS, _PARTIZAN, 'Stevens', 1, 1, 0, 1, 0, 2),

        -- mini-saison 2 · J5 · Fenerbahçe 87 - 78 Bayern
        (_SAISON, 2, 5, _FENERBAHCE, _FENERBAHCE, 'Shields', 1, 4, 2, 5, 1, 1),
        (_SAISON, 2, 5, _FENERBAHCE, _FENERBAHCE, 'Bitim', 2, 3, 2, 4, 0, 2),
        (_SAISON, 2, 5, _FENERBAHCE, _FENERBAHCE, 'Bingham Jr.', 0, 7, 0, 6, 1, 1),
        (_SAISON, 2, 5, _FENERBAHCE, _FENERBAHCE, 'Sanli', 3, 3, 0, 10, 0, 2),
        (_SAISON, 2, 5, _FENERBAHCE, _FENERBAHCE, 'Mahmutoglu', 2, 2, 1, 3, 0, 0),
        (_SAISON, 2, 5, _FENERBAHCE, _FENERBAHCE, 'Baldwin IV', 2, 2, 0, 1, 1, 0),
        (_SAISON, 2, 5, _FENERBAHCE, _FENERBAHCE, 'Melli', 1, 1, 1, 7, 0, 0),
        (_SAISON, 2, 5, _FENERBAHCE, _FENERBAHCE, 'Forrest', 1, 1, 1, 3, 3, 0),
        (_SAISON, 2, 5, _FENERBAHCE, _FENERBAHCE, 'Sargiunas', 0, 1, 1, 1, 2, 0),
        (_SAISON, 2, 5, _FENERBAHCE, _FENERBAHCE, 'Larkin', 3, 0, 0, 1, 3, 0),
        (_SAISON, 2, 5, _FENERBAHCE, _BAYERN, 'Jessup', 2, 3, 2, 4, 1, 2),
        (_SAISON, 2, 5, _FENERBAHCE, _BAYERN, 'Thiemann', 1, 1, 3, 4, 2, 0),
        (_SAISON, 2, 5, _FENERBAHCE, _BAYERN, 'Wiley', 3, 4, 0, 6, 1, 0),
        (_SAISON, 2, 5, _FENERBAHCE, _BAYERN, 'Voigtmann', 1, 5, 0, 6, 1, 1),
        (_SAISON, 2, 5, _FENERBAHCE, _BAYERN, 'Obst', 2, 1, 2, 1, 0, 0),
        (_SAISON, 2, 5, _FENERBAHCE, _BAYERN, 'Jensen', 1, 2, 0, 4, 1, 1),
        (_SAISON, 2, 5, _FENERBAHCE, _BAYERN, 'Hollatz', 1, 0, 1, 1, 2, 0),
        (_SAISON, 2, 5, _FENERBAHCE, _BAYERN, 'Lucic', 2, 1, 0, 2, 4, 0),
        (_SAISON, 2, 5, _FENERBAHCE, _BAYERN, 'da Silva', 2, 1, 0, 7, 0, 0),
        (_SAISON, 2, 5, _FENERBAHCE, _BAYERN, 'Jokubaitis', 3, 0, 0, 2, 8, 0),

        -- mini-saison 2 · J6 · Panathinaikos 84 - 96 Fenerbahçe
        (_SAISON, 2, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Yabusele', 3, 7, 1, 9, 0, 1),
        (_SAISON, 2, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Francisco', 1, 3, 2, 0, 5, 0),
        (_SAISON, 2, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Kalaitzakis', 2, 3, 1, 5, 1, 0),
        (_SAISON, 2, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Hernangomez', 1, 2, 1, 3, 1, 0),
        (_SAISON, 2, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Nunn', 0, 2, 1, 2, 0, 0),
        (_SAISON, 2, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Fall', 2, 2, 0, 5, 0, 1),
        (_SAISON, 2, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Grant', 1, 1, 1, 1, 5, 1),
        (_SAISON, 2, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Sloukas', 0, 0, 2, 1, 2, 0),
        (_SAISON, 2, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Badio', 2, 1, 0, 1, 1, 2),
        (_SAISON, 2, 6, _PANATHINAIKOS, _PANATHINAIKOS, 'Mantzoukas', 0, 0, 1, 4, 0, 0),
        (_SAISON, 2, 6, _PANATHINAIKOS, _FENERBAHCE, 'Bitim', 4, 8, 2, 3, 3, 4),
        (_SAISON, 2, 6, _PANATHINAIKOS, _FENERBAHCE, 'Key', 0, 4, 2, 1, 3, 2),
        (_SAISON, 2, 6, _PANATHINAIKOS, _FENERBAHCE, 'Melli', 1, 5, 1, 0, 0, 0),
        (_SAISON, 2, 6, _PANATHINAIKOS, _FENERBAHCE, 'Shields', 1, 3, 1, 2, 1, 1),
        (_SAISON, 2, 6, _PANATHINAIKOS, _FENERBAHCE, 'Silva', 1, 4, 0, 7, 0, 0),
        (_SAISON, 2, 6, _PANATHINAIKOS, _FENERBAHCE, 'Clyburn', 0, 3, 0, 1, 2, 2),
        (_SAISON, 2, 6, _PANATHINAIKOS, _FENERBAHCE, 'Horton-Tucker', 1, 1, 1, 0, 3, 1),
        (_SAISON, 2, 6, _PANATHINAIKOS, _FENERBAHCE, 'Baldwin IV', 0, 1, 1, 0, 2, 0),
        (_SAISON, 2, 6, _PANATHINAIKOS, _FENERBAHCE, 'Bingham Jr.', 1, 1, 0, 8, 0, 0),
        (_SAISON, 2, 6, _PANATHINAIKOS, _FENERBAHCE, 'Sanli', 1, 1, 0, 4, 1, 0),

        -- mini-saison 2 · J6 · Paris 78 - 72 Bayern
        (_SAISON, 2, 6, _PARIS, _PARIS, 'Morgan', 0, 3, 2, 1, 2, 0),
        (_SAISON, 2, 6, _PARIS, _PARIS, 'Etienne', 4, 2, 1, 3, 2, 0),
        (_SAISON, 2, 6, _PARIS, _PARIS, 'Hifi', 1, 1, 2, 7, 2, 1),
        (_SAISON, 2, 6, _PARIS, _PARIS, 'Tarpey', 3, 3, 0, 5, 1, 1),
        (_SAISON, 2, 6, _PARIS, _PARIS, 'Pereira', 3, 1, 1, 2, 0, 0),
        (_SAISON, 2, 6, _PARIS, _PARIS, 'Hommes', 2, 1, 1, 0, 0, 0),
        (_SAISON, 2, 6, _PARIS, _PARIS, 'Rhoden', 1, 1, 1, 6, 2, 2),
        (_SAISON, 2, 6, _PARIS, _PARIS, 'Warren', 1, 1, 1, 2, 1, 0),
        (_SAISON, 2, 6, _PARIS, _PARIS, 'Ntilikina', 0, 1, 1, 4, 9, 0),
        (_SAISON, 2, 6, _PARIS, _PARIS, 'Dokossi', 1, 2, 0, 2, 3, 0),
        (_SAISON, 2, 6, _PARIS, _BAYERN, 'Jessup', 2, 4, 2, 2, 3, 1),
        (_SAISON, 2, 6, _PARIS, _BAYERN, 'Jensen', 0, 3, 3, 3, 1, 1),
        (_SAISON, 2, 6, _PARIS, _BAYERN, 'da Silva', 5, 1, 1, 4, 0, 0),
        (_SAISON, 2, 6, _PARIS, _BAYERN, 'Washington Jr.', 2, 0, 2, 0, 6, 0),
        (_SAISON, 2, 6, _PARIS, _BAYERN, 'Jokubaitis', 3, 0, 1, 4, 2, 0),
        (_SAISON, 2, 6, _PARIS, _BAYERN, 'Lucic', 1, 2, 0, 0, 0, 0),
        (_SAISON, 2, 6, _PARIS, _BAYERN, 'Giffey', 1, 2, 0, 4, 1, 2),
        (_SAISON, 2, 6, _PARIS, _BAYERN, 'Voigtmann', 0, 0, 1, 4, 0, 1),
        (_SAISON, 2, 6, _PARIS, _BAYERN, 'Wiley', 1, 1, 0, 7, 0, 1),
        (_SAISON, 2, 6, _PARIS, _BAYERN, 'Hollatz', 1, 0, 0, 0, 3, 2),

        -- mini-saison 2 · J7 · Partizan 74 - 85 Fenerbahçe
        (_SAISON, 2, 7, _PARTIZAN, _PARTIZAN, 'Stevens', 0, 5, 1, 4, 2, 2),
        (_SAISON, 2, 7, _PARTIZAN, _PARTIZAN, 'Pajola', 1, 4, 1, 3, 1, 1),
        (_SAISON, 2, 7, _PARTIZAN, _PARTIZAN, 'Vildoza', 3, 1, 2, 2, 1, 1),
        (_SAISON, 2, 7, _PARTIZAN, _PARTIZAN, 'Marinkovic', 1, 5, 0, 1, 4, 2),
        (_SAISON, 2, 7, _PARTIZAN, _PARTIZAN, 'Nakic', 1, 2, 1, 1, 0, 0),
        (_SAISON, 2, 7, _PARTIZAN, _PARTIZAN, 'Jones', 2, 2, 0, 2, 2, 0),
        (_SAISON, 2, 7, _PARTIZAN, _PARTIZAN, 'Lauvergne', 1, 2, 0, 6, 1, 0),
        (_SAISON, 2, 7, _PARTIZAN, _PARTIZAN, 'Jekiri', 2, 1, 0, 9, 0, 1),
        (_SAISON, 2, 7, _PARTIZAN, _PARTIZAN, 'Willis', 0, 1, 0, 6, 1, 1),
        (_SAISON, 2, 7, _PARTIZAN, _PARTIZAN, 'Allman', 0, 1, 0, 1, 1, 0),
        (_SAISON, 2, 7, _PARTIZAN, _FENERBAHCE, 'Silva', 4, 4, 1, 12, 2, 1),
        (_SAISON, 2, 7, _PARTIZAN, _FENERBAHCE, 'Bitim', 0, 4, 1, 3, 2, 2),
        (_SAISON, 2, 7, _PARTIZAN, _FENERBAHCE, 'Forrest', 1, 2, 2, 2, 5, 1),
        (_SAISON, 2, 7, _PARTIZAN, _FENERBAHCE, 'Horton-Tucker', 1, 2, 2, 2, 0, 0),
        (_SAISON, 2, 7, _PARTIZAN, _FENERBAHCE, 'Melli', 3, 2, 1, 7, 2, 0),
        (_SAISON, 2, 7, _PARTIZAN, _FENERBAHCE, 'Shields', 4, 0, 1, 2, 2, 1),
        (_SAISON, 2, 7, _PARTIZAN, _FENERBAHCE, 'Larkin', 1, 1, 1, 1, 0, 0),
        (_SAISON, 2, 7, _PARTIZAN, _FENERBAHCE, 'Mahmutoglu', 2, 0, 1, 0, 1, 0),
        (_SAISON, 2, 7, _PARTIZAN, _FENERBAHCE, 'Bingham Jr.', 1, 2, 0, 4, 1, 0),
        (_SAISON, 2, 7, _PARTIZAN, _FENERBAHCE, 'Baldwin IV', 2, 1, 0, 0, 3, 2),

        -- mini-saison 2 · J7 · Panathinaikos 85 - 84 Paris
        (_SAISON, 2, 7, _PANATHINAIKOS, _PANATHINAIKOS, 'Grant', 3, 4, 1, 1, 5, 3),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PANATHINAIKOS, 'Fall', 1, 4, 1, 11, 0, 0),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PANATHINAIKOS, 'Kalaitzakis', 4, 2, 1, 0, 2, 1),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PANATHINAIKOS, 'Nunn', 0, 3, 1, 3, 1, 1),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PANATHINAIKOS, 'Francisco', 0, 3, 1, 0, 3, 1),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PANATHINAIKOS, 'Yabusele', 3, 1, 1, 4, 2, 0),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PANATHINAIKOS, 'Hernangomez', 2, 1, 1, 2, 1, 1),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PANATHINAIKOS, 'Badio', 1, 1, 1, 3, 1, 1),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PANATHINAIKOS, 'Sloukas', 1, 2, 0, 3, 5, 0),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PANATHINAIKOS, 'Mitoglou', 0, 2, 0, 2, 1, 0),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PARIS, 'Tarpey', 2, 2, 3, 4, 1, 0),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PARIS, 'Pereira', 2, 2, 2, 4, 2, 1),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PARIS, 'Hifi', 2, 1, 2, 6, 2, 1),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PARIS, 'Morgan', 4, 3, 0, 4, 0, 1),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PARIS, 'Dokossi', 1, 4, 0, 7, 0, 0),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PARIS, 'Herrera', 1, 2, 1, 0, 1, 1),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PARIS, 'Ntilikina', 1, 3, 0, 0, 6, 0),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PARIS, 'Rhoden', 3, 1, 0, 2, 1, 0),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PARIS, 'Warren', 1, 0, 1, 1, 0, 1),
        (_SAISON, 2, 7, _PANATHINAIKOS, _PARIS, 'Johnson', 2, 1, 0, 3, 1, 1),

        -- mini-saison 2 · J8 · Partizan 77 - 80 Bayern
        (_SAISON, 2, 8, _PARTIZAN, _PARTIZAN, 'Marinkovic', 4, 1, 2, 6, 1, 1),
        (_SAISON, 2, 8, _PARTIZAN, _PARTIZAN, 'Pajola', 2, 3, 1, 1, 8, 1),
        (_SAISON, 2, 8, _PARTIZAN, _PARTIZAN, 'Stevens', 2, 3, 1, 1, 1, 1),
        (_SAISON, 2, 8, _PARTIZAN, _PARTIZAN, 'Vildoza', 2, 2, 1, 0, 5, 1),
        (_SAISON, 2, 8, _PARTIZAN, _PARTIZAN, 'Jekiri', 2, 3, 0, 9, 0, 1),
        (_SAISON, 2, 8, _PARTIZAN, _PARTIZAN, 'Lakic', 1, 1, 1, 0, 1, 0),
        (_SAISON, 2, 8, _PARTIZAN, _PARTIZAN, 'Willis', 2, 2, 0, 8, 0, 1),
        (_SAISON, 2, 8, _PARTIZAN, _PARTIZAN, 'Jones', 0, 1, 1, 5, 8, 0),
        (_SAISON, 2, 8, _PARTIZAN, _PARTIZAN, 'Allman', 1, 2, 0, 1, 0, 1),
        (_SAISON, 2, 8, _PARTIZAN, _PARTIZAN, 'Tanaskovic', 0, 2, 0, 2, 0, 3),
        (_SAISON, 2, 8, _PARTIZAN, _BAYERN, 'Giffey', 3, 1, 3, 10, 2, 0),
        (_SAISON, 2, 8, _PARTIZAN, _BAYERN, 'Obst', 2, 3, 1, 1, 2, 1),
        (_SAISON, 2, 8, _PARTIZAN, _BAYERN, 'Wiley', 0, 5, 0, 6, 1, 0),
        (_SAISON, 2, 8, _PARTIZAN, _BAYERN, 'Washington Jr.', 1, 3, 1, 3, 3, 1),
        (_SAISON, 2, 8, _PARTIZAN, _BAYERN, 'da Silva', 2, 3, 0, 4, 0, 2),
        (_SAISON, 2, 8, _PARTIZAN, _BAYERN, 'Baldwin', 2, 0, 2, 3, 0, 1),
        (_SAISON, 2, 8, _PARTIZAN, _BAYERN, 'Jensen', 0, 2, 1, 1, 2, 0),
        (_SAISON, 2, 8, _PARTIZAN, _BAYERN, 'Jokubaitis', 2, 2, 0, 1, 6, 0),
        (_SAISON, 2, 8, _PARTIZAN, _BAYERN, 'Jessup', 3, 1, 0, 1, 3, 0),
        (_SAISON, 2, 8, _PARTIZAN, _BAYERN, 'Hollatz', 1, 0, 0, 1, 2, 2),

        -- mini-saison 2 · J8 · Fenerbahçe 105 - 86 Paris
        (_SAISON, 2, 8, _FENERBAHCE, _FENERBAHCE, 'Melli', 7, 4, 1, 7, 1, 0),
        (_SAISON, 2, 8, _FENERBAHCE, _FENERBAHCE, 'Larkin', 1, 4, 2, 2, 2, 1),
        (_SAISON, 2, 8, _FENERBAHCE, _FENERBAHCE, 'Mahmutoglu', 1, 2, 3, 2, 1, 0),
        (_SAISON, 2, 8, _FENERBAHCE, _FENERBAHCE, 'Shields', 1, 3, 2, 2, 3, 0),
        (_SAISON, 2, 8, _FENERBAHCE, _FENERBAHCE, 'Forrest', 3, 2, 1, 0, 7, 4),
        (_SAISON, 2, 8, _FENERBAHCE, _FENERBAHCE, 'Bitim', 0, 3, 1, 3, 3, 0),
        (_SAISON, 2, 8, _FENERBAHCE, _FENERBAHCE, 'Clyburn', 3, 1, 1, 3, 2, 1),
        (_SAISON, 2, 8, _FENERBAHCE, _FENERBAHCE, 'Silva', 3, 2, 0, 7, 1, 0),
        (_SAISON, 2, 8, _FENERBAHCE, _FENERBAHCE, 'Bingham Jr.', 0, 3, 0, 5, 1, 0),
        (_SAISON, 2, 8, _FENERBAHCE, _FENERBAHCE, 'Juzang', 0, 1, 1, 0, 0, 0),
        (_SAISON, 2, 8, _FENERBAHCE, _PARIS, 'Hifi', 2, 3, 3, 4, 1, 2),
        (_SAISON, 2, 8, _FENERBAHCE, _PARIS, 'Ntilikina', 3, 0, 4, 1, 4, 1),
        (_SAISON, 2, 8, _FENERBAHCE, _PARIS, 'Warren', 0, 5, 0, 2, 0, 0),
        (_SAISON, 2, 8, _FENERBAHCE, _PARIS, 'Etienne', 4, 3, 0, 1, 2, 1),
        (_SAISON, 2, 8, _FENERBAHCE, _PARIS, 'Dokossi', 4, 2, 0, 8, 0, 1),
        (_SAISON, 2, 8, _FENERBAHCE, _PARIS, 'Herrera', 1, 2, 1, 1, 1, 0),
        (_SAISON, 2, 8, _FENERBAHCE, _PARIS, 'Pereira', 3, 2, 0, 8, 3, 2),
        (_SAISON, 2, 8, _FENERBAHCE, _PARIS, 'Rhoden', 1, 3, 0, 4, 0, 0),
        (_SAISON, 2, 8, _FENERBAHCE, _PARIS, 'Tarpey', 4, 0, 0, 4, 1, 0),
        (_SAISON, 2, 8, _FENERBAHCE, _PARIS, 'Morgan', 0, 0, 0, 2, 1, 0),

        -- mini-saison 2 · J9 · Partizan 81 - 85 Paris
        (_SAISON, 2, 9, _PARTIZAN, _PARTIZAN, 'Lakic', 1, 3, 2, 2, 4, 1),
        (_SAISON, 2, 9, _PARTIZAN, _PARTIZAN, 'Marinkovic', 2, 3, 1, 3, 3, 0),
        (_SAISON, 2, 9, _PARTIZAN, _PARTIZAN, 'Pajola', 0, 2, 2, 2, 2, 1),
        (_SAISON, 2, 9, _PARTIZAN, _PARTIZAN, 'Allman', 2, 1, 2, 1, 1, 0),
        (_SAISON, 2, 9, _PARTIZAN, _PARTIZAN, 'Stevens', 2, 3, 0, 6, 2, 1),
        (_SAISON, 2, 9, _PARTIZAN, _PARTIZAN, 'Willis', 2, 1, 1, 2, 1, 0),
        (_SAISON, 2, 9, _PARTIZAN, _PARTIZAN, 'Jekiri', 0, 3, 0, 9, 2, 0),
        (_SAISON, 2, 9, _PARTIZAN, _PARTIZAN, 'Jones', 4, 1, 0, 2, 0, 0),
        (_SAISON, 2, 9, _PARTIZAN, _PARTIZAN, 'Lauvergne', 0, 3, 0, 3, 0, 0),
        (_SAISON, 2, 9, _PARTIZAN, _PARTIZAN, 'Vildoza', 1, 0, 1, 1, 5, 1),
        (_SAISON, 2, 9, _PARTIZAN, _PARIS, 'Warren', 1, 5, 1, 2, 2, 0),
        (_SAISON, 2, 9, _PARTIZAN, _PARIS, 'Etienne', 3, 3, 1, 2, 0, 0),
        (_SAISON, 2, 9, _PARTIZAN, _PARIS, 'Pereira', 4, 2, 1, 4, 1, 2),
        (_SAISON, 2, 9, _PARTIZAN, _PARIS, 'Tarpey', 1, 5, 0, 7, 2, 0),
        (_SAISON, 2, 9, _PARTIZAN, _PARIS, 'Rhoden', 1, 3, 1, 3, 1, 0),
        (_SAISON, 2, 9, _PARTIZAN, _PARIS, 'Dokossi', 2, 2, 1, 4, 1, 1),
        (_SAISON, 2, 9, _PARTIZAN, _PARIS, 'Morgan', 4, 2, 0, 1, 1, 1),
        (_SAISON, 2, 9, _PARTIZAN, _PARIS, 'Hifi', 2, 1, 1, 2, 1, 2),
        (_SAISON, 2, 9, _PARTIZAN, _PARIS, 'Ntilikina', 0, 1, 0, 3, 7, 1),
        (_SAISON, 2, 9, _PARTIZAN, _PARIS, 'Herrera', 1, 0, 0, 2, 1, 1),

        -- mini-saison 2 · J9 · Bayern 85 - 93 Panathinaikos
        (_SAISON, 2, 9, _BAYERN, _BAYERN, 'Wiley', 2, 7, 0, 9, 0, 1),
        (_SAISON, 2, 9, _BAYERN, _BAYERN, 'Jensen', 1, 4, 1, 0, 2, 0),
        (_SAISON, 2, 9, _BAYERN, _BAYERN, 'Thiemann', 0, 5, 0, 2, 1, 0),
        (_SAISON, 2, 9, _BAYERN, _BAYERN, 'Giffey', 2, 2, 1, 5, 3, 0),
        (_SAISON, 2, 9, _BAYERN, _BAYERN, 'Jokubaitis', 1, 1, 2, 0, 3, 0),
        (_SAISON, 2, 9, _BAYERN, _BAYERN, 'Jessup', 2, 1, 1, 1, 1, 0),
        (_SAISON, 2, 9, _BAYERN, _BAYERN, 'Washington Jr.', 1, 3, 0, 2, 4, 2),
        (_SAISON, 2, 9, _BAYERN, _BAYERN, 'Obst', 1, 1, 1, 0, 0, 1),
        (_SAISON, 2, 9, _BAYERN, _BAYERN, 'da Silva', 2, 0, 1, 4, 2, 0),
        (_SAISON, 2, 9, _BAYERN, _BAYERN, 'Voigtmann', 2, 1, 0, 9, 0, 0),
        (_SAISON, 2, 9, _BAYERN, _PANATHINAIKOS, 'Yabusele', 4, 8, 0, 9, 0, 0),
        (_SAISON, 2, 9, _BAYERN, _PANATHINAIKOS, 'Kalaitzakis', 3, 2, 2, 3, 0, 0),
        (_SAISON, 2, 9, _BAYERN, _PANATHINAIKOS, 'Hayes-Davis', 2, 4, 1, 2, 1, 0),
        (_SAISON, 2, 9, _BAYERN, _PANATHINAIKOS, 'Francisco', 1, 3, 1, 2, 5, 1),
        (_SAISON, 2, 9, _BAYERN, _PANATHINAIKOS, 'Sloukas', 1, 1, 2, 1, 1, 1),
        (_SAISON, 2, 9, _BAYERN, _PANATHINAIKOS, 'Grant', 5, 2, 0, 3, 6, 3),
        (_SAISON, 2, 9, _BAYERN, _PANATHINAIKOS, 'Mantzoukas', 0, 4, 0, 2, 0, 0),
        (_SAISON, 2, 9, _BAYERN, _PANATHINAIKOS, 'Badio', 0, 1, 1, 1, 1, 0),
        (_SAISON, 2, 9, _BAYERN, _PANATHINAIKOS, 'Fall', 0, 2, 0, 8, 1, 0),
        (_SAISON, 2, 9, _BAYERN, _PANATHINAIKOS, 'Nunn', 0, 1, 0, 1, 2, 1),

        -- mini-saison 2 · J10 · Partizan 74 - 78 Panathinaikos
        (_SAISON, 2, 10, _PARTIZAN, _PARTIZAN, 'Marinkovic', 1, 2, 3, 5, 0, 2),
        (_SAISON, 2, 10, _PARTIZAN, _PARTIZAN, 'Jones', 5, 2, 1, 1, 2, 0),
        (_SAISON, 2, 10, _PARTIZAN, _PARTIZAN, 'Willis', 3, 0, 3, 1, 1, 1),
        (_SAISON, 2, 10, _PARTIZAN, _PARTIZAN, 'Jekiri', 2, 3, 0, 10, 1, 0),
        (_SAISON, 2, 10, _PARTIZAN, _PARTIZAN, 'Stevens', 2, 1, 1, 1, 0, 0),
        (_SAISON, 2, 10, _PARTIZAN, _PARTIZAN, 'Tanaskovic', 3, 0, 1, 2, 1, 0),
        (_SAISON, 2, 10, _PARTIZAN, _PARTIZAN, 'Lakic', 2, 0, 1, 5, 0, 0),
        (_SAISON, 2, 10, _PARTIZAN, _PARTIZAN, 'Lauvergne', 1, 2, 0, 4, 0, 0),
        (_SAISON, 2, 10, _PARTIZAN, _PARTIZAN, 'Vildoza', 4, 0, 0, 4, 7, 1),
        (_SAISON, 2, 10, _PARTIZAN, _PARTIZAN, 'Pajola', 1, 0, 0, 1, 5, 1),
        (_SAISON, 2, 10, _PARTIZAN, _PANATHINAIKOS, 'Grant', 2, 0, 4, 2, 2, 2),
        (_SAISON, 2, 10, _PARTIZAN, _PANATHINAIKOS, 'Nunn', 2, 5, 0, 2, 1, 0),
        (_SAISON, 2, 10, _PARTIZAN, _PANATHINAIKOS, 'Kalaitzakis', 1, 1, 2, 3, 0, 0),
        (_SAISON, 2, 10, _PARTIZAN, _PANATHINAIKOS, 'Hayes-Davis', 1, 4, 0, 2, 0, 1),
        (_SAISON, 2, 10, _PARTIZAN, _PANATHINAIKOS, 'Fall', 2, 3, 0, 4, 0, 1),
        (_SAISON, 2, 10, _PARTIZAN, _PANATHINAIKOS, 'Sloukas', 3, 0, 1, 2, 2, 1),
        (_SAISON, 2, 10, _PARTIZAN, _PANATHINAIKOS, 'Yabusele', 2, 2, 0, 8, 1, 1),
        (_SAISON, 2, 10, _PARTIZAN, _PANATHINAIKOS, 'Badio', 1, 2, 0, 2, 2, 1),
        (_SAISON, 2, 10, _PARTIZAN, _PANATHINAIKOS, 'Hernangomez', 1, 2, 0, 2, 0, 0),
        (_SAISON, 2, 10, _PARTIZAN, _PANATHINAIKOS, 'Francisco', 0, 2, 0, 1, 4, 0),

        -- mini-saison 2 · J10 · Bayern 88 - 86 Fenerbahçe
        (_SAISON, 2, 10, _BAYERN, _BAYERN, 'da Silva', 2, 4, 2, 4, 3, 1),
        (_SAISON, 2, 10, _BAYERN, _BAYERN, 'Jensen', 3, 4, 1, 3, 2, 1),
        (_SAISON, 2, 10, _BAYERN, _BAYERN, 'Giffey', 3, 2, 2, 4, 1, 2),
        (_SAISON, 2, 10, _BAYERN, _BAYERN, 'Hollatz', 2, 2, 2, 1, 4, 1),
        (_SAISON, 2, 10, _BAYERN, _BAYERN, 'Voigtmann', 1, 4, 0, 8, 1, 0),
        (_SAISON, 2, 10, _BAYERN, _BAYERN, 'Jessup', 0, 0, 3, 1, 2, 1),
        (_SAISON, 2, 10, _BAYERN, _BAYERN, 'Washington Jr.', 0, 1, 1, 2, 5, 1),
        (_SAISON, 2, 10, _BAYERN, _BAYERN, 'Thiemann', 3, 1, 0, 4, 2, 0),
        (_SAISON, 2, 10, _BAYERN, _BAYERN, 'Wiley', 1, 1, 0, 4, 1, 0),
        (_SAISON, 2, 10, _BAYERN, _BAYERN, 'Jokubaitis', 2, 0, 0, 1, 2, 0),
        (_SAISON, 2, 10, _BAYERN, _FENERBAHCE, 'Shields', 3, 2, 3, 3, 2, 0),
        (_SAISON, 2, 10, _BAYERN, _FENERBAHCE, 'Bitim', 1, 4, 2, 4, 3, 0),
        (_SAISON, 2, 10, _BAYERN, _FENERBAHCE, 'Key', 2, 4, 0, 2, 2, 0),
        (_SAISON, 2, 10, _BAYERN, _FENERBAHCE, 'Mahmutoglu', 1, 1, 2, 2, 0, 0),
        (_SAISON, 2, 10, _BAYERN, _FENERBAHCE, 'Horton-Tucker', 0, 3, 1, 0, 3, 0),
        (_SAISON, 2, 10, _BAYERN, _FENERBAHCE, 'Baldwin IV', 0, 1, 2, 2, 5, 0),
        (_SAISON, 2, 10, _BAYERN, _FENERBAHCE, 'Silva', 1, 2, 0, 4, 0, 1),
        (_SAISON, 2, 10, _BAYERN, _FENERBAHCE, 'Melli', 3, 1, 0, 5, 0, 3),
        (_SAISON, 2, 10, _BAYERN, _FENERBAHCE, 'Forrest', 1, 2, 0, 0, 5, 0),
        (_SAISON, 2, 10, _BAYERN, _FENERBAHCE, 'Bingham Jr.', 1, 0, 1, 7, 1, 1)
    ) AS v(saison_id, mini, journee, dom_id, club_id, nom, lf, d2, t3, reb, pd, itc)
    JOIN matchs m ON m.saison_id = v.saison_id
                 AND m.mini_saison = v.mini
                 AND m.journee = v.journee
                 AND m.club_domicile_id = v.dom_id
    JOIN joueurs j ON j.club_id = v.club_id
                  AND j.nom = v.nom;


    ----------------------------------------------------------------
    -- MVP : meilleur joueur de l'équipe gagnante
    -- (évaluation = points + rebonds + passes décisives + interceptions)
    ----------------------------------------------------------------

    UPDATE matchs m
    SET mvp_id = (
        SELECT s.joueur_id
        FROM stats_joueurs_match s
        JOIN joueurs j ON j.id = s.joueur_id
        WHERE s.match_id = m.id
          AND j.club_id = CASE WHEN m.score_domicile > m.score_exterieur
                               THEN m.club_domicile_id
                               ELSE m.club_exterieur_id END
        ORDER BY (s.points + s.rebonds + s.passes_decisives + s.interceptions) DESC,
                 s.points DESC,
                 j.nom
        LIMIT 1
    )
    WHERE m.statut = 'TERMINE';


    ----------------------------------------------------------------
    -- CONTRÔLE : la somme des points des joueurs doit être égale au score
    -- de leur équipe, sinon tout le script est annulé
    ----------------------------------------------------------------

    IF EXISTS (
        SELECT 1
        FROM matchs m
        JOIN stats_joueurs_match s ON s.match_id = m.id
        JOIN joueurs j ON j.id = s.joueur_id
        WHERE m.statut = 'TERMINE'
        GROUP BY m.id, j.club_id, m.club_domicile_id, m.score_domicile, m.score_exterieur
        HAVING SUM(s.points) <> CASE WHEN j.club_id = m.club_domicile_id
                                     THEN m.score_domicile
                                     ELSE m.score_exterieur END
    ) THEN
        RAISE EXCEPTION 'Incohérence : la somme des points des joueurs ne correspond pas au score';
    END IF;

END $$;