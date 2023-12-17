CREATE DATABASE optica;
USE optica;

CREATE TABLE proveidors (
    proveidor_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255),
    adreca_carrer VARCHAR(255),
    adreca_numero VARCHAR(255),
    adreca_pis VARCHAR(255),
    adreca_porta VARCHAR(255),
    ciutat VARCHAR(255),
    codi_postal VARCHAR(255),
    pais VARCHAR(255),
    telefon VARCHAR(255),
    fax VARCHAR(255),
    NIF VARCHAR(255)
);

CREATE TABLE ulleres (
    ulleres_id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(255),
    graduacio_vidre_dreta FLOAT,
    graduacio_vidre_esquerra FLOAT,
    tipus_montura VARCHAR(255),
    color_montura VARCHAR(255),
    color_vidre_esquerra VARCHAR(255),
    color_vidre_dreta VARCHAR(255),
    preu FLOAT,
    proveidor_id INT,
    FOREIGN KEY (proveidor_id) REFERENCES proveidors(proveidor_id)
);

CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255),
    adreca_postal VARCHAR(255),
    telefon VARCHAR(255),
    correu_electronic VARCHAR(255),
    data_registre DATE,
    client_recomanador_id INT,
    FOREIGN KEY (client_recomanador_id) REFERENCES clients(client_id)
);

CREATE TABLE empleats (
    empleat_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255)
);

CREATE TABLE vendes (
    venda_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    empleat_id INT,
    ulleres_id INT,
    data_venda DATE,
    periode_vendes VARCHAR(255),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (empleat_id) REFERENCES empleats(empleat_id),
    FOREIGN KEY (ulleres_id) REFERENCES ulleres(ulleres_id)
);