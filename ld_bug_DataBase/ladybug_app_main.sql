-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ladybug_app_main
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ladybug_app_main` ;

-- -----------------------------------------------------
-- Schema ladybug_app_main
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ladybug_app_main` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ladybug_app_main` ;

-- -----------------------------------------------------
-- Table `ladybug_app_main`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ladybug_app_main`.`employees` ;

CREATE TABLE IF NOT EXISTS `ladybug_app_main`.`employees` (
  `emp_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `created_on` DATETIME NULL,
  `user_name` VARCHAR(45) NULL,
  `mgr_id` INT NULL,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `mgr_id`
    FOREIGN KEY (`mgr_id`)
    REFERENCES `ladybug_app_main`.`employees` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `mgr_id_idx` ON `ladybug_app_main`.`employees` (`mgr_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ladybug_app_main`.`login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ladybug_app_main`.`login` ;

CREATE TABLE IF NOT EXISTS `ladybug_app_main`.`login` (
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NULL,
  `last_login` DATETIME NULL,
  `reset_token` VARCHAR(45) NULL,
  `emp_id` INT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `employee_id`
    FOREIGN KEY (`emp_id`)
    REFERENCES `ladybug_app_main`.`employees` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `employee_id_idx` ON `ladybug_app_main`.`login` (`emp_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ladybug_app_main`.`projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ladybug_app_main`.`projects` ;

CREATE TABLE IF NOT EXISTS `ladybug_app_main`.`projects` (
  `project_id` INT NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(45) NOT NULL,
  `project_desc` VARCHAR(200) NULL,
  `project_mgr` INT NULL,
  PRIMARY KEY (`project_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ladybug_app_main`.`bug_dtls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ladybug_app_main`.`bug_dtls` ;

CREATE TABLE IF NOT EXISTS `ladybug_app_main`.`bug_dtls` (
  `bug_id` INT NOT NULL AUTO_INCREMENT,
  `bug_name` VARCHAR(45) NOT NULL,
  `bug_desc` VARCHAR(250) NOT NULL,
  `bug_start` DATETIME NULL,
  `bug_end` DATETIME NULL,
  `bug_priority` VARCHAR(45) NULL,
  `bug_by_emp_id` INT NOT NULL,
  `bug_assignee` VARCHAR(45) NULL,
  `bug_project_id` INT NULL,
  `bug_status` VARCHAR(45) NULL,
  `bug_mgr_id` VARCHAR(45) NULL,
  PRIMARY KEY (`bug_id`),
  CONSTRAINT `FK_EMP_ID`
    FOREIGN KEY (`bug_by_emp_id`)
    REFERENCES `ladybug_app_main`.`employees` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PROJ_ID`
    FOREIGN KEY (`bug_project_id`)
    REFERENCES `ladybug_app_main`.`projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `FK_EMP_ID_idx` ON `ladybug_app_main`.`bug_dtls` (`bug_by_emp_id` ASC) VISIBLE;

CREATE INDEX `FK_PROJ_ID_idx` ON `ladybug_app_main`.`bug_dtls` (`bug_project_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ladybug_app_main`.`emp_project_relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ladybug_app_main`.`emp_project_relation` ;

CREATE TABLE IF NOT EXISTS `ladybug_app_main`.`emp_project_relation` (
  `proj_id` INT NOT NULL,
  `e_id` INT NOT NULL,
  PRIMARY KEY (`proj_id`, `e_id`),
  CONSTRAINT `FK_EMP_ID_P`
    FOREIGN KEY (`e_id`)
    REFERENCES `ladybug_app_main`.`employees` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PROJ_ID_E`
    FOREIGN KEY (`proj_id`)
    REFERENCES `ladybug_app_main`.`projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `FK_EMP_ID_P_idx` ON `ladybug_app_main`.`emp_project_relation` (`e_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
