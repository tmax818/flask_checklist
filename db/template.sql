-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema template
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `template` ;

-- -----------------------------------------------------
-- Schema template
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `template` ;
USE `template` ;

-- -----------------------------------------------------
-- Table `template`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `template`.`users` (
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
-- Table `template`.`things`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `template`.`things` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `column1` VARCHAR(45) NULL,
  `column2` VARCHAR(45) NULL,
  `column3` VARCHAR(45) NULL,
  `column4` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_things_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_things_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `template`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
