-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `id_funcionario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Login` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  UNIQUE INDEX `id_funcionario_UNIQUE` (`id_funcionario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entradas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Entradas` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `CPF_cliente` CHAR(11) NOT NULL,
  `Hora_entrada` DATETIME NOT NULL,
  `Funcionario_id_funcionario` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Entradas_Funcionario1_idx` (`Funcionario_id_funcionario` ASC) VISIBLE,
  CONSTRAINT `fk_Entradas_Funcionario1`
    FOREIGN KEY (`Funcionario_id_funcionario`)
    REFERENCES `mydb`.`Funcionario` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Saidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Saidas` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `CPF_cliente` CHAR(11) NOT NULL,
  `Hora_saida` DATETIME NOT NULL,
  `Funcionario_id_funcionario` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Saidas_Funcionario_idx` (`Funcionario_id_funcionario` ASC) VISIBLE,
  CONSTRAINT `fk_Saidas_Funcionario`
    FOREIGN KEY (`Funcionario_id_funcionario`)
    REFERENCES `mydb`.`Funcionario` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
