-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bd_biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_biblioteca` ;
USE `bd_biblioteca` ;

-- -----------------------------------------------------
-- Table `bd_biblioteca`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_biblioteca`.`pessoa` (
  `id_pessoa` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`id_pessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_biblioteca`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_biblioteca`.`autor` (
  `id_autor` INT NOT NULL AUTO_INCREMENT,
  `nacionalidade` VARCHAR(100) NULL,
  `nome` VARCHAR(100) NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_biblioteca`.`editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_biblioteca`.`editora` (
  `id_editora` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NULL,
  PRIMARY KEY (`id_editora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_biblioteca`.`livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_biblioteca`.`livro` (
  `id_Livro` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `Editora_id_editora` INT NOT NULL,
  PRIMARY KEY (`id_Livro`),
  INDEX `fk_livro_editora1_idx` (`Editora_id_editora` ASC) VISIBLE,
  CONSTRAINT `fk_livro_editora1`
    FOREIGN KEY (`Editora_id_editora`)
    REFERENCES `bd_biblioteca`.`editora` (`id_editora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_biblioteca`.`autor_has_livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_biblioteca`.`autor_has_livro` (
  `Autor_id_autor` INT NOT NULL,
  `Livro_id_Livro` INT NOT NULL,
  PRIMARY KEY (`Autor_id_autor`, `Livro_id_Livro`),
  INDEX `fk_autor_has_livro_livro1_idx` (`Livro_id_Livro` ASC) VISIBLE,
  INDEX `fk_autor_has_livro_autor1_idx` (`Autor_id_autor` ASC) VISIBLE,
  CONSTRAINT `fk_autor_has_livro_autor1`
    FOREIGN KEY (`Autor_id_autor`)
    REFERENCES `bd_biblioteca`.`autor` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_autor_has_livro_livro1`
    FOREIGN KEY (`Livro_id_Livro`)
    REFERENCES `bd_biblioteca`.`livro` (`id_Livro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_biblioteca`.`transacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_biblioteca`.`transacao` (
  `id_Transacao` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(20) NULL,
  `data` DATE NULL,
  `Pessoa_id_pessoa` INT NOT NULL,
  PRIMARY KEY (`id_Transacao`),
  INDEX `fk_transacao_pessoa1_idx` (`Pessoa_id_pessoa` ASC) VISIBLE,
  CONSTRAINT `fk_transacao_pessoa1`
    FOREIGN KEY (`Pessoa_id_pessoa`)
    REFERENCES `bd_biblioteca`.`pessoa` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_biblioteca`.`transacao_has_livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_biblioteca`.`transacao_has_livro` (
  `Transacao_id_Transacao` INT NOT NULL,
  `Livro_id_Livro` INT NOT NULL,
  PRIMARY KEY (`Transacao_id_Transacao`, `Livro_id_Livro`),
  INDEX `fk_transacao_has_livro_livro1_idx` (`Livro_id_Livro` ASC) VISIBLE,
  INDEX `fk_transacao_has_livro_transacao1_idx` (`Transacao_id_Transacao` ASC) VISIBLE,
  CONSTRAINT `fk_transacao_has_livro_transacao1`
    FOREIGN KEY (`Transacao_id_Transacao`)
    REFERENCES `bd_biblioteca`.`transacao` (`id_Transacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transacao_has_livro_livro1`
    FOREIGN KEY (`Livro_id_Livro`)
    REFERENCES `bd_biblioteca`.`livro` (`id_Livro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;