-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cartorio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cartorio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cartorio` DEFAULT CHARACTER SET utf8 ;
USE `CARTORIO` ;


-- -----------------------------------------------------
-- Table `cartorio`.`servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CARTORIO`.`SERVICOS` (
  `ID_SERVICOS` INT(11) NOT NULL AUTO_INCREMENT,
  `SERVICOS` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_SERVICOS`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cartorio`.`subservicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CARTORIO`.`SUBSERVICOS` (
  `ID_SUBSERVICOS` INT(11) NOT NULL AUTO_INCREMENT,
  `SUBSERVICOS` VARCHAR(45) NULL DEFAULT NULL,
  `ID_SERVICOS` INT(11) NOT NULL,
  PRIMARY KEY (`ID_SUBSERVICOS`),
  UNIQUE INDEX `ID_SUBSERVICOS_UNIQUE` (`ID_SUBSERVICOS` ASC),
  UNIQUE INDEX `fk_SUBSERVICOS_SERVICOS_idx` (`ID_SERVICOS` ASC),
    CONSTRAINT `fk_SUBSERVICOS_SERVICOS`
    FOREIGN KEY (`ID_SERVICOS`)
    REFERENCES `CARTORIO`.`SERVICOS` (`ID_SERVICOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cartorio`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CARTORIO`.`ADMINISTRADOR` (
  `ID_ADMINISTRADOR` INT(11) NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(30) NOT NULL,
  `PASSWORD` VARCHAR(10) NOT NULL,
  `ID_SERVICOS` INT(11) NOT NULL,
  PRIMARY KEY (`ID_ADMINISTRADOR`),
  UNIQUE INDEX `fk_ADMINISTRADOR_SERVICOS_idx` (`ID_SERVICOS` ASC),
  CONSTRAINT `fk_ID_SERVICOS`
    FOREIGN KEY (`ID_SERVICOS`)
    REFERENCES `CARTORIO`.`SERVICOS` (`ID_SERVICOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `cartorio`.`status `
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CARTORIO`.`STATUS` (
  `ID_STATUS` INT(11) NOT NULL AUTO_INCREMENT,
  `STATUS` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_STATUS`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `cartorio`.`fila`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CARTORIO`.`FILA` (
  `ID_FILA` INT NOT NULL AUTO_INCREMENT,
  `SENHA` VARCHAR(15) NULL,
  `ID_SERVICOS` INT(11) NOT NULL,
  `ID_SUBSERVICOS` INT(11) NOT NULL,
  `ID_STATUS` INT(11) NOT NULL,
  PRIMARY KEY (`ID_FILA`),
  INDEX `fk_FILA_SERVICOS_idx` (`ID_SERVICOS` ASC),
  INDEX `fk_FILA_SUBSERVICOS_idx` (`ID_SUBSERVICOS` ASC),
  INDEX `fk_FILA_STATUS_idx` (`ID_STATUS` ASC),
  CONSTRAINT `fk_FILA_SERVICOS`
    FOREIGN KEY (`ID_SERVICOS`)
    REFERENCES `CARTORIO`.`SERVICOS` (`ID_SERVICOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FILA_SUBSERVICOS`
    FOREIGN KEY (`ID_SUBSERVICOS`)
    REFERENCES `CARTORIO`.`SUBSERVICOS` (`ID_SUBSERVICOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FILA_STATUS`
    FOREIGN KEY (`ID_STATUS`)
    REFERENCES `CARTORIO`.`STATUS` (`ID_STATUS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `cartorio`.`tipo_atd `
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CARTORIO`.`TIPO_ATD` (
  `ID_TIPO` INT(11) NOT NULL AUTO_INCREMENT,
  `TIPO_ATD` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_TIPO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `cartorio`.`atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CARTORIO`.`ATENDIMENTO` (
  `ID_ATENDIMENTO` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `INICIO` DATETIME NOT NULL,
  `TERMINO` DATETIME ,
  `ID_FILA` INT(11)NOT NULL,
  `ID_SERVICOS` INT(11) NOT NULL,
  `ID_SUBSERVICO` INT(11) NOT NULL,
  `ID_TIPO` INT(11) NULL,
  `ID_STATUS` INT(11) NOT NULL,
  PRIMARY KEY (`ID_ATENDIMENTO`),
  INDEX `fk_ATENDIMENTO_FILA_idx` (`ID_FILA` ASC),
  INDEX `fk_ATENDIMENTO_SERVICOS_idx` (`ID_SERVICOS` ASC),
  INDEX `fk_ATENDIMENTO_SUBSERVICOS_idx` (`ID_SUBSERVICO` ASC),
  INDEX `fk_ATENDIMENTO_TIPO_ATD_idx` (`ID_TIPO` ASC),
  INDEX `fk_ATENDIMENTO_STATUS_idx` (`ID_STATUS` ASC),
  CONSTRAINT `fk_ATENDIMENTO_FILA`
    FOREIGN KEY (`ID_FILA` )
    REFERENCES `CARTORIO`.`FILA` (`ID_FILA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ATENDIMENTO_SERVICOS`
    FOREIGN KEY (`ID_SERVICOS` )
    REFERENCES `CARTORIO`.`SERVICOS` (`ID_SERVICOS` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ATENDIMENTO_SUBSERVICOS`
    FOREIGN KEY (`ID_SUBSERVICO` )
    REFERENCES `CARTORIO`.`SUBSERVICOS` (`ID_SUBSERVICOS` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
   CONSTRAINT `fk_ATENDIMENTO_TIPO_ATD`
    FOREIGN KEY (`ID_TIPO` )
    REFERENCES `CARTORIO`.`TIPO_ATD` (`ID_TIPO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
   CONSTRAINT `fk_ATENDIMENTO_STATUS`
    FOREIGN KEY (`ID_STATUS`)
    REFERENCES `CARTORIO`.`STATUS` (`ID_STATUS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

USE CARTORIO;

insert into SERVICOS values (null,'Abertura de Firma');
insert into SERVICOS values (null,'Reconhecimento de Firma');
insert into SERVICOS values (null,'Reconhecimento de Firma');
insert into SERVICOS values (null,'Reconhecimento de Firma');
insert into SERVICOS values (null,'Reconhecimento de Firma');


select * from servicos;

delete servicos from servicos where ID_SERVICOS = 2;
delete servicos from servicos where ID_SERVICOS = 3;
delete servicos from servicos where ID_SERVICOS = 4;
delete servicos from servicos where ID_SERVICOS = 5;
delete servicos from servicos where ID_SERVICOS = 6;
delete servicos from servicos where ID_SERVICOS = 7;


select id_servicos, status from cartorio.status;

insert into STATUS values (null,'Aguardando atendimento');
insert into STATUS values (null,'Em atendimento servico');
insert into STATUS values (null,'Em atendimento subservico');
insert into STATUS values (null,'Finalizado');

SELECT * FROM cartorio.servicos;

SELECT * FROM administrador;

SELECT * FROM cartorio.subservicos;

SELECT * FROM cartorio.fila;

SELECT * FROM cartorio.atendimento;

SELECT * FROM cartorio.status;


