-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ginasio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ginasio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ginasio` DEFAULT CHARACTER SET utf8 ;
USE `ginasio` ;

-- -----------------------------------------------------
-- Table `ginasio`.`Localidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ginasio`.`Localidade` (
  `Id_localidade` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id_localidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ginasio`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ginasio`.`Cliente` (
  `Id_cliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Data_nascimento` DATE NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  `Id_localidade` INT NOT NULL,
  PRIMARY KEY (`Id_cliente`),
  INDEX `fk_Cliente_Localidade1_idx` (`Id_localidade` ASC),
  CONSTRAINT `fk_Cliente_Localidade1`
    FOREIGN KEY (`Id_localidade`)
    REFERENCES `ginasio`.`Localidade` (`Id_localidade`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ginasio`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ginasio`.`Professor` (
  `Id_professor` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  `Data_nascimento` DATE NOT NULL,
  `Telemovel` CHAR(9) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(7) NOT NULL,
  `Id_localidade` INT NOT NULL,
  PRIMARY KEY (`Id_professor`),
  INDEX `fk_Professor_Localidade1_idx` (`Id_localidade` ASC),
  CONSTRAINT `fk_Professor_Localidade1`
    FOREIGN KEY (`Id_localidade`)
    REFERENCES `ginasio`.`Localidade` (`Id_localidade`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ginasio`.`Plano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ginasio`.`Plano` (
  `Id_plano` INT NOT NULL AUTO_INCREMENT,
  `Preco` DOUBLE NOT NULL,
  `Data_inicio` DATE NOT NULL,
  `Estado` VARCHAR(7) NOT NULL,
  `Id_cliente` INT NOT NULL,
  `Id_professor` INT NOT NULL,
  PRIMARY KEY (`Id_plano`),
  INDEX `fk_Plano_Cliente1_idx` (`Id_cliente` ASC),
  INDEX `fk_Plano_Professor1_idx` (`Id_professor` ASC),
  CONSTRAINT `fk_Plano_Cliente1`
    FOREIGN KEY (`Id_cliente`)
    REFERENCES `ginasio`.`Cliente` (`Id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Plano_Professor1`
    FOREIGN KEY (`Id_professor`)
    REFERENCES `ginasio`.`Professor` (`Id_professor`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ginasio`.`Atividade_Fitness`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ginasio`.`Atividade_Fitness` (
  `Id_atividade` INT NOT NULL AUTO_INCREMENT,
  `Max_participantes` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Duracao` TIME NOT NULL,
  `Sala` INT NOT NULL,
  `Nr_inscritos` INT NOT NULL,
  `Id_professor` INT NOT NULL,
  PRIMARY KEY (`Id_atividade`),
  INDEX `fk_Atividade_Fitness_Professor1_idx` (`Id_professor` ASC),
  CONSTRAINT `fk_Atividade_Fitness_Professor1`
    FOREIGN KEY (`Id_professor`)
    REFERENCES `ginasio`.`Professor` (`Id_professor`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ginasio`.`Maquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ginasio`.`Maquina` (
  `Id_maquina` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`Id_maquina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ginasio`.`Limitacao_Fisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ginasio`.`Limitacao_Fisica` (
  `Id_Limitacao` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id_Limitacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ginasio`.`Plano_Atividade_Fitness`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ginasio`.`Plano_Atividade_Fitness` (
  `Nr_aulas` INT NOT NULL,
  `Id_plano` INT NOT NULL,
  `Id_atividade` INT NOT NULL,
  PRIMARY KEY (`Id_plano`, `Id_atividade`),
  INDEX `fk_Plano_has_Atividade_Fitness_Atividade_Fitness1_idx` (`Id_atividade` ASC),
  INDEX `fk_Plano_has_Atividade_Fitness_Plano_idx` (`Id_plano` ASC),
  CONSTRAINT `fk_Plano_has_Atividade_Fitness_Plano`
    FOREIGN KEY (`Id_plano`)
    REFERENCES `ginasio`.`Plano` (`Id_plano`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Plano_has_Atividade_Fitness_Atividade_Fitness1`
    FOREIGN KEY (`Id_atividade`)
    REFERENCES `ginasio`.`Atividade_Fitness` (`Id_atividade`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ginasio`.`Atividade_Fitness_Maquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ginasio`.`Atividade_Fitness_Maquina` (
  `Nr_maquinas` INT NOT NULL,
  `Id_atividade` INT NOT NULL,
  `Id_maquina` INT NOT NULL,
  PRIMARY KEY (`Id_atividade`, `Id_maquina`),
  INDEX `fk_Atividade_Fitness_has_Maquina_Maquina1_idx` (`Id_maquina` ASC),
  INDEX `fk_Atividade_Fitness_has_Maquina_Atividade_Fitness1_idx` (`Id_atividade` ASC),
  CONSTRAINT `fk_Atividade_Fitness_has_Maquina_Atividade_Fitness1`
    FOREIGN KEY (`Id_atividade`)
    REFERENCES `ginasio`.`Atividade_Fitness` (`Id_atividade`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Atividade_Fitness_has_Maquina_Maquina1`
    FOREIGN KEY (`Id_maquina`)
    REFERENCES `ginasio`.`Maquina` (`Id_maquina`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ginasio`.`Telemovel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ginasio`.`Telemovel` (
  `Id_telemovel` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `Numero` CHAR(9) NOT NULL,
  `Id_cliente` INT NOT NULL,
  PRIMARY KEY (`Id_telemovel`, `Id_cliente`),
  INDEX `fk_Telemovel_Cliente1_idx` (`Id_cliente` ASC),
  CONSTRAINT `fk_Telemovel_Cliente1`
    FOREIGN KEY (`Id_cliente`)
    REFERENCES `ginasio`.`Cliente` (`Id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ginasio`.`Cliente_Limitacao_Fisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ginasio`.`Cliente_Limitacao_Fisica` (
  `Id_cliente` INT NOT NULL AUTO_INCREMENT,
  `Id_Limitacao` INT NOT NULL,
  PRIMARY KEY (`Id_cliente`, `Id_Limitacao`),
  INDEX `fk_Cliente_has_Limitacao_Fisica_Limitacao_Fisica1_idx` (`Id_Limitacao` ASC),
  INDEX `fk_Cliente_has_Limitacao_Fisica_Cliente1_idx` (`Id_cliente` ASC),
  CONSTRAINT `fk_Cliente_has_Limitacao_Fisica_Cliente1`
    FOREIGN KEY (`Id_cliente`)
    REFERENCES `ginasio`.`Cliente` (`Id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Cliente_has_Limitacao_Fisica_Limitacao_Fisica1`
    FOREIGN KEY (`Id_Limitacao`)
    REFERENCES `ginasio`.`Limitacao_Fisica` (`Id_Limitacao`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
