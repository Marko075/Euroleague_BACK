Do $$

    DECLARE _STUDENT_1 int := NEXTVAL('students_id_seq');
    DECLARE _MAJOR_1 int := NEXTVAL('majors_id_seq');
    DECLARE _COURSE_1 int := NEXTVAL('courses_id_seq');



    DECLARE _PANATHINAIKOS int := NEXTVAL('clubs_id_seq');
    DECLARE _PARTIZAN int := NEXTVAL('clubs_id_seq');
    DECLARE _PARIS int := NEXTVAL('clubs_id_seq');
    DECLARE _FENERBAHCE int := NEXTVAL('clubs_id_seq');
    DECLARE _BAYERN int := NEXTVAL('clubs_id_seq');

    BEGIN

    INSERT INTO majors (id, name, description) VALUES (_MAJOR_1, 'Informatique', 'Ouaiiis du code partout');
    INSERT INTO majors (name, description) VALUES ('Construction', 'Beaucoup de béton et des poutres');
    INSERT INTO majors (name, description) VALUES ('Aéronautique', 'Vive le vent');
    INSERT INTO majors (name, description) VALUES ('Data', 'Trop cool plein de données à ordonner');
    INSERT INTO majors (name, description) VALUES ('Energie & Environnement', 'On est full green');
    INSERT INTO majors (name, description) VALUES ('Management', 'Des managers de qualité');
    INSERT INTO majors (name, description) VALUES ('Santé', 'On connait tous les os et tous les muscles du corps humain');
    INSERT INTO majors (name, description) VALUES ('Architecture durable', 'Objectif 0 carbone');
    INSERT INTO majors (name, description) VALUES ('Design Industriel Durable', 'On resistera à la fin du pétrole');

    INSERT INTO students (id, first_name, last_name, birthdate, major_id) VALUES (_STUDENT_1, 'Paul', 'Harrohide', '2002-06-15', _MAJOR_1);
    INSERT INTO students (first_name, last_name, birthdate, major_id) VALUES ('Jean', 'Bonbeur', '2001-08-21',_MAJOR_1);
    INSERT INTO students (first_name, last_name, birthdate, major_id) VALUES ('Alain', 'Térieur', '2000-01-11', _MAJOR_1);

    INSERT INTO courses (id, name, hours) VALUES (_COURSE_1, 'Java', 30);
    INSERT INTO courses (name, hours) VALUES ('German', 30);
    INSERT INTO courses (name, hours) VALUES ('Internet of Things', 30);
    INSERT INTO courses (name, hours) VALUES ('Thermodynamic', 30);
    INSERT INTO courses (name, hours) VALUES ('Anatomy', 30);
    INSERT INTO courses (name, hours) VALUES ('Maths', 30);
    INSERT INTO courses (name, hours) VALUES ('Spanish', 30);
    INSERT INTO courses (name, hours) VALUES ('Lean Management', 30);
    INSERT INTO student_course (student_id, course_id) VALUES (_STUDENT_1, _COURSE_1);

    INSERT INTO clubs (id, nom, ville, pays, stade, coach) VALUES (_PANATHINAIKOS, 'Panathinaikos AKTOR', 'Athènes', 'Grèce', 'OAKA Telekom Center', 'Zeljko Obradovic');
    INSERT INTO clubs (id, nom, ville, pays, stade, coach) VALUES (_PARTIZAN, 'Partizan Mozzart Bet', 'Belgrade', 'Serbie', 'Belgrade Arena', 'Joan Peñarroya');
    INSERT INTO clubs (id, nom, ville, pays, stade, coach) VALUES (_PARIS, 'Paris Basketball', 'Paris', 'France', 'Adidas Arena', 'Maxime Lefèvre');
    INSERT INTO clubs (id, nom, ville, pays, stade, coach) VALUES (_FENERBAHCE, 'Fenerbahçe Beko', 'Istanbul', 'Turquie', 'Ülker Sports Arena', 'Sarunas Jasikevicius');
    INSERT INTO clubs (id, nom, ville, pays, stade, coach) VALUES (_BAYERN, 'FC Bayern Munich', 'Munich', 'Allemagne', 'SAP Garden', 'Anton Gavel');

       -- PARIS BASKETBALL
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

    -- PARTIZAN
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

    -- FC BAYERN MUNICH
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
    ('Fischer', 'Killian', '2007-02-08', 'Allemagne', 205, 'AF', _BAYERN),
    ('Voigtmann', 'Johannes', '1992-09-30', 'Allemagne', 211, 'P', _BAYERN);

    -- FENERBAHÇE BEKO
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

    -- PANATHINAIKOS AKTOR
    INSERT INTO joueurs (nom, prenom, anniversaire, nationalite, taille, poste, club_id) VALUES
    ('Mantzoukas', 'Eleftherios', '2003-08-08', 'Grèce', 207, 'AF', _PANATHINAIKOS),
    ('Francisco', 'Sylvain', '1997-10-10', 'France', 185, 'M', _PANATHINAIKOS),
    ('Bonga', 'Isaac', '1999-11-08', 'Allemagne', 204, 'AI', _PANATHINAIKOS),
    ('Badio', 'Brancou', '1999-02-17', 'Espagne', 191, 'AR', _PANATHINAIKOS),
    ('Yabusele', 'Guerschon', '1995-12-17', 'France', 201, 'AF', _PANATHINAIKOS),
    ('Fall', 'Moustapha', '1992-02-23', 'France', 218, 'P', _PANATHINAIKOS),
    ('Moraitis', 'Dimitris', '1999-02-03', 'Grèce', 190, 'M', _PANATHINAIKOS),
    ('Sloukas', 'Kostas', '1990-01-15', 'Grèce', 190, 'M', _PANATHINAIKOS),
    ('Nunn', 'Kendrick', '1995-08-03', 'États-Unis', 195, 'AR', _PANATHINAIKOS),
    ('Grant', 'Jerian', '1992-10-09', 'États-Unis', 196, 'M', _PANATHINAIKOS),
    ('Kalaitzakis', 'Panagiotis', '1999-01-02', 'Grèce', 200, 'AI', _PANATHINAIKOS),
    ('Hayes-Davis', 'Nigel', '1994-09-16', 'États-Unis', 203, 'AF', _PANATHINAIKOS),
    ('Rogkavopoulos', 'Nikos', '2001-06-20', 'Grèce', 201, 'AI', _PANATHINAIKOS),
    ('Hernangomez', 'Juancho', '1995-09-28', 'Espagne', 206, 'AF', _PANATHINAIKOS),
    ('Mitoglou', 'Konstantinos', '1996-06-11', 'Grèce', 210, 'P', _PANATHINAIKOS);

    


    END $$;

