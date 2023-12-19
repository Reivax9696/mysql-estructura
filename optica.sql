-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8mb4 ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`clients` (
  `client_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  `adreca_postal` VARCHAR(50) NULL DEFAULT NULL,
  `telefon` VARCHAR(50) NULL DEFAULT NULL,
  `correu_electronic` VARCHAR(50) NULL DEFAULT NULL,
  `data_registre` DATE NULL DEFAULT NULL,
  `client_recomanador_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `client_recomanador_id` (`client_recomanador_id` ASC) VISIBLE,
  CONSTRAINT `clients_ibfk_1`
    FOREIGN KEY (`client_recomanador_id`)
    REFERENCES `optica`.`clients` (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `optica`.`empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleats` (
  `empleat_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`empleat_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `optica`.`proveidors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveidors` (
  `proveidor_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  `adreca_carrer` VARCHAR(50) NULL DEFAULT NULL,
  `adreca_numero` VARCHAR(50) NULL DEFAULT NULL,
  `adreca_pis` VARCHAR(50) NULL DEFAULT NULL,
  `adreca_porta` VARCHAR(50) NULL DEFAULT NULL,
  `ciutat` VARCHAR(50) NULL DEFAULT NULL,
  `codi_postal` VARCHAR(50) NULL DEFAULT NULL,
  `pais` VARCHAR(50) NULL DEFAULT NULL,
  `telefon` VARCHAR(50) NULL DEFAULT NULL,
  `fax` VARCHAR(50) NULL DEFAULT NULL,
  `NIF` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`proveidor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `optica`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `ulleres_id` INT(11) NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(50) NULL DEFAULT NULL,
  `graduacio_vidre_dreta` FLOAT NULL DEFAULT NULL,
  `graduacio_vidre_esquerra` FLOAT NULL DEFAULT NULL,
  `tipus_montura` VARCHAR(50) NULL DEFAULT NULL,
  `color_montura` VARCHAR(50) NULL DEFAULT NULL,
  `color_vidre_esquerra` VARCHAR(50) NULL DEFAULT NULL,
  `color_vidre_dreta` VARCHAR(50) NULL DEFAULT NULL,
  `preu` FLOAT NULL DEFAULT NULL,
  `proveidor_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ulleres_id`),
  INDEX `proveidor_id` (`proveidor_id` ASC) VISIBLE,
  CONSTRAINT `ulleres_ibfk_1`
    FOREIGN KEY (`proveidor_id`)
    REFERENCES `optica`.`proveidors` (`proveidor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `optica`.`vendes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`vendes` (
  `venda_id` INT(11) NOT NULL AUTO_INCREMENT,
  `client_id` INT(11) NULL DEFAULT NULL,
  `empleat_id` INT(11) NULL DEFAULT NULL,
  `ulleres_id` INT(11) NULL DEFAULT NULL,
  `data_venda` DATE NULL DEFAULT NULL,
  `periode_vendes` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`venda_id`),
  INDEX `client_id` (`client_id` ASC) VISIBLE,
  INDEX `empleat_id` (`empleat_id` ASC) VISIBLE,
  INDEX `ulleres_id` (`ulleres_id` ASC) VISIBLE,
  CONSTRAINT `vendes_ibfk_1`
    FOREIGN KEY (`client_id`)
    REFERENCES `optica`.`clients` (`client_id`),
  CONSTRAINT `vendes_ibfk_2`
    FOREIGN KEY (`empleat_id`)
    REFERENCES `optica`.`empleats` (`empleat_id`),
  CONSTRAINT `vendes_ibfk_3`
    FOREIGN KEY (`ulleres_id`)
    REFERENCES `optica`.`ulleres` (`ulleres_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
