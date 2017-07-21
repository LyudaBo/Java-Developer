-- MySQL Script generated by MySQL Workbench
-- Mon Jul  3 21:17:35 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema homework_1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `homework_1` ;

-- -----------------------------------------------------
-- Schema homework_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `homework_1` ;
USE `homework_1` ;

-- -----------------------------------------------------
-- Table `homework_1`.`developers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `homework_1`.`developers` ;

CREATE TABLE IF NOT EXISTS `homework_1`.`developers` (
  `DEVELOPER_ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `DEVELOPER_NAME` VARCHAR(255) NOT NULL,
  `DEVELOPER_SALARY` INT(6) NULL DEFAULT NULL,
  PRIMARY KEY (`DEVELOPER_ID`));


-- -----------------------------------------------------
-- Table `homework_1`.`skills`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `homework_1`.`skills` ;

CREATE TABLE IF NOT EXISTS `homework_1`.`skills` (
  `SKILL_ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `SKILL_NAME` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`SKILL_ID`));


-- -----------------------------------------------------
-- Table `homework_1`.`companies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `homework_1`.`companies` ;

CREATE TABLE IF NOT EXISTS `homework_1`.`companies` (
  `COMPANY_ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `COMPANY_NAME` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`COMPANY_ID`));


-- -----------------------------------------------------
-- Table `homework_1`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `homework_1`.`customers` ;

CREATE TABLE IF NOT EXISTS `homework_1`.`customers` (
  `CUSTOMER_ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CUSTOMER_NAME` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`));


-- -----------------------------------------------------
-- Table `homework_1`.`projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `homework_1`.`projects` ;

CREATE TABLE IF NOT EXISTS `homework_1`.`projects` (
  `PROJECT_ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PROJECT_NAME` VARCHAR(255) NOT NULL,
  `PROJECT_COST` INT(11) NULL DEFAULT NULL,
  `COMPANY_ID` INT(11)  UNSIGNED NULL DEFAULT NULL,
  `CUSTOMER_ID` INT(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`PROJECT_ID`),
  INDEX (`COMPANY_ID` ASC),
  INDEX (`CUSTOMER_ID` ASC),
  CONSTRAINT `COMPANY`
    FOREIGN KEY (`COMPANY_ID`)
    REFERENCES `homework_1`.`companies` (`COMPANY_ID`),
  CONSTRAINT `CUSTOMER`
    FOREIGN KEY (`CUSTOMER_ID`)
    REFERENCES `homework_1`.`customers` (`CUSTOMER_ID`));


-- -----------------------------------------------------
-- Table `homework_1`.`developer_skill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `homework_1`.`developer_skill` ;

CREATE TABLE IF NOT EXISTS `homework_1`.`developer_skill` (
  `DEVELOPER_ID` INT(11) UNSIGNED NOT NULL,
  `SKILL_ID` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`DEVELOPER_ID`, `SKILL_ID`),
  INDEX (`DEVELOPER_ID` ASC),
  INDEX (`SKILL_ID` ASC),
  CONSTRAINT `DEVELOPER`
    FOREIGN KEY (`DEVELOPER_ID`)
    REFERENCES `homework_1`.`developers` (`DEVELOPER_ID`),
  CONSTRAINT `SKILL`
    FOREIGN KEY (`SKILL_ID`)
    REFERENCES `homework_1`.`skills` (`SKILL_ID`));


-- -----------------------------------------------------
-- Table `homework_1`.`developer_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `homework_1`.`developer_project` ;

CREATE TABLE IF NOT EXISTS `homework_1`.`developer_project` (
  `DEVELOPER_ID` INT(11) UNSIGNED NOT NULL,
  `PROJECT_ID` INT(11) UNSIGNED NOT NULL,
  `SALARY` INT(6) NULL DEFAULT NULL,
  PRIMARY KEY (`DEVELOPER_ID`, `PROJECT_ID`),
  INDEX (`DEVELOPER_ID` ASC),
  INDEX (`PROJECT_ID` ASC),
 -- CONSTRAINT `DEVELOPER`
    -- FOREIGN KEY (`DEVELOPER_ID`)
   -- REFERENCES `homework_1`.`developers` (`DEVELOPER_ID`),
  CONSTRAINT `PROJECT`
    FOREIGN KEY (`PROJECT_ID`)
    REFERENCES `homework_1`.`projects` (`PROJECT_ID`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


