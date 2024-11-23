CREATE TABLE livres (
    id UUID PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    auteur VARCHAR(255) NOT NULL,
    categorie VARCHAR(100),
    date_publication DATE,
    pages INT,
    isbn VARCHAR(20) UNIQUE NOT NULL
);

