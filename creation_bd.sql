//https://www.geeksforgeeks.org/postgresql/postgresql-foreign-key/

//cle api pas assez long a 30 caractere, ma cle api fait 36 caractere

//champ ajouté -> description, en_cours, date_debut


drop table if exists public.prets;
drop table if exists public.livres;
drop table if exists public.bibliotheque;
CREATE TABLE public.bibliotheque (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    courriel VARCHAR(255),
    cle_api VARCHAR(36),
    password VARCHAR(100)
);


CREATE TABLE public.livres (
    id SERIAL PRIMARY KEY,
    bibliotheque_id INTEGER,
    titre VARCHAR(100),
    description VARCHAR(255),
    auteur VARCHAR(100),
    isbn VARCHAR(20),
    date_ajout DATE,
    disponible BOOL,
    FOREIGN KEY (bibliotheque_id)
    REFERENCES bibliotheque(id)
);


CREATE TABLE public.prets (
    id SERIAL PRIMARY KEY,
    livre_id INTEGER,
    emprunteur VARCHAR(100),
    date_debut DATE,
    date_retour DATE,
    en_cours Bool,
    FOREIGN KEY (livre_id)
    REFERENCES livres(id)
);

insert into bibliotheque (nom, courriel, cle_api, password) values('biblioBob','bob@bob.bob','c3f84368-5059-46c5-b299-bea331d29ba9','$2b$10$cofsqnlWph36ggebhDjr3uwB7JS4tcIis675P5UA1xR2KIn05qK1O');
insert into bibliotheque (nom, courriel, cle_api, password) values('BiblioFelix','gagne.felix07@gmail.com','2c9a3043-374f-4e47-8c3c-03db447c0649','$2b$10$cofsqnlWph36ggebhDjr3uwB7JS4tcIis675P5UA1xR2KIn05qK1O');
insert into livres(bibliotheque_id,titre,description,auteur,isbn,disponible) values(1,'livreBob','bob a la plage','bob','dfgsdv',true);
insert into livres (bibliotheque_id,titre,description,auteur,isbn,disponible) values(1,'livreKevin','Kevin a la plage','Kevin','dfgsdv',false);
insert into livres(bibliotheque_id,titre,description,auteur,isbn,disponible) values(2,'livrefelix','Felix a la plage','Felix','dfgsdv',true);

insert into prets(livre_id,emprunteur,date_debut,date_retour,en_cours) values(1,'Felix','2026-03-28','2026-04-27',false);
insert into prets(livre_id,emprunteur,date_debut,date_retour,en_cours) values(1,'Felix','2026-04-28','2026-06-28',true);