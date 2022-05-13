-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema may_checklist
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `may_checklist` ;

-- -----------------------------------------------------
-- Schema may_checklist
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `may_checklist` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema checklist
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `checklist` ;

-- -----------------------------------------------------
-- Schema checklist
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `checklist` DEFAULT CHARACTER SET utf8 ;
USE `may_checklist` ;

-- -----------------------------------------------------
-- Table `may_checklist`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `may_checklist`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `may_checklist`.`models`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `may_checklist`.`models` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `col1` VARCHAR(45) NULL,
  `col2` VARCHAR(45) NULL,
  `col3` VARCHAR(45) NULL,
  `col4` VARCHAR(45) NULL,
  `user_id` INT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_models_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_models_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `may_checklist`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `checklist` ;

-- -----------------------------------------------------
-- Table `checklist`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `checklist`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `checklist`.`models`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `checklist`.`models` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `column1` VARCHAR(45) NULL DEFAULT NULL,
  `column2` VARCHAR(45) NULL DEFAULT NULL,
  `column3` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_models_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_models_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `checklist`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8mb3
COMMENT = '	';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
