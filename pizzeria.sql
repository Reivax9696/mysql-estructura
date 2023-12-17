-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8mb4 ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`botigues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`botigues` (
  `botiga_id` INT(11) NOT NULL AUTO_INCREMENT,
  `adresa` VARCHAR(255) NULL DEFAULT NULL,
  `codi_postal` VARCHAR(10) NULL DEFAULT NULL,
  `localitat` VARCHAR(255) NULL DEFAULT NULL,
  `provincia` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`botiga_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`categories` (
  `categoria_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`categoria_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`clients` (
  `client_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NULL DEFAULT NULL,
  `cognoms` VARCHAR(255) NULL DEFAULT NULL,
  `adresa` VARCHAR(255) NULL DEFAULT NULL,
  `codi_postal` VARCHAR(10) NULL DEFAULT NULL,
  `localitat` VARCHAR(255) NULL DEFAULT NULL,
  `provincia` VARCHAR(255) NULL DEFAULT NULL,
  `telefon` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`comandes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`comandes` (
  `comanda_id` INT(11) NOT NULL AUTO_INCREMENT,
  `client_id` INT(11) NULL DEFAULT NULL,
  `data_hora` DATETIME NULL DEFAULT NULL,
  `tipus_entrega` VARCHAR(50) NULL DEFAULT NULL,
  `preu_total` FLOAT NULL DEFAULT NULL,
  `botiga_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`comanda_id`),
  INDEX `client_id` (`client_id` ASC) VISIBLE,
  INDEX `botiga_id` (`botiga_id` ASC) VISIBLE,
  CONSTRAINT `comandes_ibfk_1`
    FOREIGN KEY (`client_id`)
    REFERENCES `pizzeria`.`clients` (`client_id`),
  CONSTRAINT `comandes_ibfk_2`
    FOREIGN KEY (`botiga_id`)
    REFERENCES `pizzeria`.`botigues` (`botiga_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`productes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`productes` (
  `producte_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NULL DEFAULT NULL,
  `descripcio` TEXT NULL DEFAULT NULL,
  `imatge` VARCHAR(255) NULL DEFAULT NULL,
  `preu` FLOAT NULL DEFAULT NULL,
  `categoria_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`producte_id`),
  INDEX `categoria_id` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `productes_ibfk_1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `pizzeria`.`categories` (`categoria_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`comanda_detalls`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`comanda_detalls` (
  `comanda_id` INT(11) NOT NULL,
  `producte_id` INT(11) NOT NULL,
  `quantitat` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`comanda_id`, `producte_id`),
  INDEX `producte_id` (`producte_id` ASC) VISIBLE,
  CONSTRAINT `comanda_detalls_ibfk_1`
    FOREIGN KEY (`comanda_id`)
    REFERENCES `pizzeria`.`comandes` (`comanda_id`),
  CONSTRAINT `comanda_detalls_ibfk_2`
    FOREIGN KEY (`producte_id`)
    REFERENCES `pizzeria`.`productes` (`producte_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`empleats` (
  `empleat_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NULL DEFAULT NULL,
  `cognoms` VARCHAR(255) NULL DEFAULT NULL,
  `NIF` VARCHAR(20) NULL DEFAULT NULL,
  `telefon` VARCHAR(20) NULL DEFAULT NULL,
  `rol` VARCHAR(50) NULL DEFAULT NULL,
  `botiga_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`empleat_id`),
  INDEX `botiga_id` (`botiga_id` ASC) VISIBLE,
  CONSTRAINT `empleats_ibfk_1`
    FOREIGN KEY (`botiga_id`)
    REFERENCES `pizzeria`.`botigues` (`botiga_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`repartiment_detalls`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`repartiment_detalls` (
  `comanda_id` INT(11) NOT NULL,
  `empleat_id` INT(11) NOT NULL,
  `data_hora_lliurament` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`comanda_id`, `empleat_id`),
  INDEX `empleat_id` (`empleat_id` ASC) VISIBLE,
  CONSTRAINT `repartiment_detalls_ibfk_1`
    FOREIGN KEY (`comanda_id`)
    REFERENCES `pizzeria`.`comandes` (`comanda_id`),
  CONSTRAINT `repartiment_detalls_ibfk_2`
    FOREIGN KEY (`empleat_id`)
    REFERENCES `pizzeria`.`empleats` (`empleat_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
