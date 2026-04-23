//https://www.geeksforgeeks.org/postgresql/postgresql-foreign-key/
drop table if exists public.bibliotheque;
CREATE TABLE public.bibliotheque (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    courriel VARCHAR(255),
    cle_api VARCHAR(30),
    password VARCHAR(100)
);

drop table if exists public.livres;

CREATE TABLE public.livres (
    id SERIAL PRIMARY KEY,
    bibliotheque_id INTEGER,
    titre VARCHAR(100),
    auteur VARCHAR(100),
    isbn VARCHAR(20),
    date_ajout DATE,
    disponible BOOL,
    FOREIGN KEY (bibliotheque_id)
    REFERENCES bibliotheque(id)
);

drop table if exists public.prets;

CREATE TABLE public.prets (
    id SERIAL PRIMARY KEY,
    livre_id INTEGER,
    emprunteur VARCHAR(100),
    date_retour DATE,
    FOREIGN KEY (livre_id)
    REFERENCES livres(id)
);

