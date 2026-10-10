
create table clubs
(
    id SERIAL PRIMARY KEY,
    nom TEXT not null,
    ville TEXT not null,
    pays TEXT not null,
    stade TEXT not null,
    coach TEXT not null,
    image_coach bytea null,
    logo_club bytea null
);

create table joueurs
(
    id SERIAL PRIMARY KEY,
    nom TEXT not null,
    prenom TEXT not null,
    anniversaire date null,
    nationalite TEXT not null,
    taille int null,
    poste TEXT not null check (poste in ('M', 'AR', 'AI', 'AF', 'P')),
    photo_joueur bytea null,
    club_id int not null references clubs (id)
);

CREATE TABLE saisons
(
    id SERIAL PRIMARY KEY,
    nom TEXT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE,
    statut TEXT NOT NULL CHECK (statut IN ('A_VENIR', 'EN_COURS', 'TERMINEE'))
);

CREATE TABLE matchs
(
    id SERIAL PRIMARY KEY,

    saison_id INT NOT NULL REFERENCES saisons(id),
    mvp_id INT REFERENCES joueurs(id),

    mini_saison INT NOT NULL DEFAULT 1
        CHECK (mini_saison BETWEEN 1 AND 4),

    journee INT NOT NULL,

    club_domicile_id INT NOT NULL REFERENCES clubs(id),
    club_exterieur_id INT NOT NULL REFERENCES clubs(id),

    date_match TIMESTAMP NOT NULL,

    statut TEXT NOT NULL CHECK (
        statut IN ('A_VENIR', 'EN_COURS', 'TERMINE')
    ),

    score_domicile INT,
    score_exterieur INT
);

CREATE TABLE stats_joueurs_match
(
    id SERIAL PRIMARY KEY,
    match_id INT NOT NULL REFERENCES matchs(id) ON DELETE CASCADE,
    joueur_id INT NOT NULL REFERENCES joueurs(id),
    lancers_francs INT NOT NULL DEFAULT 0 CHECK (lancers_francs >= 0),
    deux_points INT NOT NULL DEFAULT 0 CHECK (deux_points >= 0),
    trois_points INT NOT NULL DEFAULT 0 CHECK (trois_points >= 0),
    rebonds INT NOT NULL DEFAULT 0 CHECK (rebonds >= 0),
    passes_decisives INT NOT NULL DEFAULT 0 CHECK (passes_decisives >= 0),
    interceptions INT NOT NULL DEFAULT 0 CHECK (interceptions >= 0),
    points INT GENERATED ALWAYS AS (lancers_francs + 2 * deux_points + 3 * trois_points) STORED,
    UNIQUE (match_id, joueur_id)
);

