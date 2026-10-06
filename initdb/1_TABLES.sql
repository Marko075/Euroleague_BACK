create table students
(
    id SERIAL PRIMARY KEY,
    first_name TEXT not null,
    last_name TEXT not null,
    birthdate date null,
    major_id int null,
    image bytea null
);

create table majors
(
    id SERIAL PRIMARY KEY,
    name TEXT not null,
    description TEXT not null
);

create table courses
(
    id SERIAL PRIMARY KEY,
    name TEXT not null,
    hours int not null
);

create table student_course
(
    id SERIAL PRIMARY KEY,
    student_id int not null,
    course_id int not null
);



//// notre BDD

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
