CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    cognoms VARCHAR(50),
    adresa VARCHAR(50),
    codi_postal VARCHAR(10),
    localitat VARCHAR(50),
    provincia VARCHAR(50),
    telefon VARCHAR(20)
);

CREATE TABLE categories (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE productes (
    producte_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    descripcio TEXT,
    imatge VARCHAR(50),
    preu FLOAT,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categories(categoria_id)
);

CREATE TABLE botigues (
    botiga_id INT AUTO_INCREMENT PRIMARY KEY,
    adresa VARCHAR(50),
    codi_postal VARCHAR(10),
    localitat VARCHAR(50),
    provincia VARCHAR(50)
);

CREATE TABLE comandes (
    comanda_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    data_hora DATETIME,
    tipus_entrega VARCHAR(50),
    preu_total FLOAT,
    botiga_id INT,
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (botiga_id) REFERENCES botigues(botiga_id)
);

CREATE TABLE empleats (
    empleat_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    cognoms VARCHAR(50),
    NIF VARCHAR(20),
    telefon VARCHAR(20),
    rol VARCHAR(50),
    botiga_id INT,
    FOREIGN KEY (botiga_id) REFERENCES botigues(botiga_id)
);

CREATE TABLE repartiment_detalls (
    comanda_id INT,
    empleat_id INT,
    data_hora_lliurament DATETIME,
    FOREIGN KEY (comanda_id) REFERENCES comandes(comanda_id),
    FOREIGN KEY (empleat_id) REFERENCES empleats(empleat_id),
    PRIMARY KEY (comanda_id, empleat_id)
);

CREATE TABLE comanda_detalls (
    comanda_id INT,
    producte_id INT,
    quantitat INT,
    FOREIGN KEY (comanda_id) REFERENCES comandes(comanda_id),
    FOREIGN KEY (producte_id) REFERENCES productes(producte_id),
    PRIMARY KEY (comanda_id, producte_id)
);