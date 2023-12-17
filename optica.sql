CREATE DATABASE optica;
USE optica;

CREATE TABLE proveidors (
    proveidor_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    adreca_carrer VARCHAR(50),
    adreca_numero VARCHAR(50),
    adreca_pis VARCHAR(50),
    adreca_porta VARCHAR(50),
    ciutat VARCHAR(50),
    codi_postal VARCHAR(50),
    pais VARCHAR(50),
    telefon VARCHAR(20),
    fax VARCHAR(50),
    NIF VARCHAR(50)
);

CREATE TABLE ulleres (
    ulleres_id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50),
    graduacio_vidre_dreta FLOAT,
    graduacio_vidre_esquerra FLOAT,
    tipus_montura VARCHAR(50),
    color_montura VARCHAR(50),
    color_vidre_esquerra VARCHAR(50),
    color_vidre_dreta VARCHAR(50),
    preu FLOAT,
    proveidor_id INT,
    FOREIGN KEY (proveidor_id) REFERENCES proveidors(proveidor_id)
);

CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    adreca_postal VARCHAR(50),
    telefon VARCHAR(20),
    correu_electronic VARCHAR(50),
    data_registre DATE,
    client_recomanador_id INT,
    FOREIGN KEY (client_recomanador_id) REFERENCES clients(client_id)
);

CREATE TABLE empleats (
    empleat_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE vendes (
    venda_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    empleat_id INT,
    ulleres_id INT,
    data_venda DATE,
    periode_vendes VARCHAR(50),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (empleat_id) REFERENCES empleats(empleat_id),
    FOREIGN KEY (ulleres_id) REFERENCES ulleres(ulleres_id)
);
