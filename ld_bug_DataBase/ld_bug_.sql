-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ld_bug_
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ld_bug_` ;

-- -----------------------------------------------------
-- Schema ld_bug_
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ld_bug_` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ld_bug_` ;



-- -----------------------------------------------------
-- Table `ld_bug_`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ld_bug_`.`employees` ;

CREATE TABLE IF NOT EXISTS `ld_bug_`.`employees` (
  `emp_id` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `created_on` DATETIME NULL DEFAULT NULL,
  `emp_role` VARCHAR(45) NOT NULL,
  `emp_username` VARCHAR(45) NULL DEFAULT NULL,
  `mgr_id` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  
  INDEX `FK_MANAGER` (`mgr_id` ASC) VISIBLE,
  CONSTRAINT `FK_MANAGER`
    FOREIGN KEY (`mgr_id`)
    REFERENCES `ld_bug_`.`employees` (`emp_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `ld_bug_`.`login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ld_bug_`.`login` ;

CREATE TABLE IF NOT EXISTS `ld_bug_`.`login` (
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) CHARACTER SET 'armscii8' NOT NULL,
  `last_login` DATETIME NULL DEFAULT NULL,
  `reset_token` VARCHAR(36) NULL DEFAULT NULL,
  `emp_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE INDEX `emp_id_UNIQUE` (`emp_id` ASC) VISIBLE,
  INDEX `fk_employees_id_idx` (`emp_id` ASC) VISIBLE,
  CONSTRAINT `fk_employees_id1`
    FOREIGN KEY (`emp_id`)
    REFERENCES `ld_bug_`.`employees` (`emp_id`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ld_bug_`.`projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ld_bug_`.`projects` ;

CREATE TABLE IF NOT EXISTS `ld_bug_`.`projects` (
  `project_id` VARCHAR(45) NOT NULL,
  `project_name` VARCHAR(45) NOT NULL,
  `project_desc` VARCHAR(45) NULL DEFAULT NULL,
  `project_mgr` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ld_bug_`.`bug_dtls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ld_bug_`.`bug_dtls` ;

CREATE TABLE IF NOT EXISTS `ld_bug_`.`bug_dtls` (
  `bug_id` VARCHAR(45) NOT NULL,
  `bug_name` VARCHAR(45) NOT NULL,
  `bug_desc` VARCHAR(250) NOT NULL,
  `bug_start` DATETIME NULL DEFAULT NULL,
  `bug_end` DATETIME NULL DEFAULT NULL,
  `bug_priority` VARCHAR(45) NULL DEFAULT NULL,
  `bug_by_emp_id` VARCHAR(45) NOT NULL,
  `bug_assignee` VARCHAR(45) NULL DEFAULT NULL,
  `bug_project_id` VARCHAR(45) NULL DEFAULT NULL,
  `bug_status` VARCHAR(45) NULL DEFAULT NULL,
  `bug_mgr_id` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`bug_id`),
  INDEX `emp_id_idx` (`bug_by_emp_id` ASC) VISIBLE,
  INDEX `project_id_idx` (`bug_project_id` ASC) VISIBLE,
  CONSTRAINT `emp_id`
    FOREIGN KEY (`bug_by_emp_id`)
    REFERENCES `ld_bug_`.`employees` (`emp_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `project_id`
    FOREIGN KEY (`bug_project_id`)
    REFERENCES `ld_bug_`.`projects` (`project_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ld_bug_`.`emp_project_relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ld_bug_`.`emp_project_relation` ;

CREATE TABLE IF NOT EXISTS `ld_bug_`.`emp_project_relation` (
  `proj_id` VARCHAR(45) NOT NULL,
  `e_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`e_id`, `proj_id`),
  INDEX `project_id_idx` (`proj_id` ASC) VISIBLE,
  CONSTRAINT `e_id`
    FOREIGN KEY (`e_id`)
    REFERENCES `ld_bug_`.`employees` (`emp_id`),
  CONSTRAINT `proj_id`
    FOREIGN KEY (`proj_id`)
    REFERENCES `ld_bug_`.`projects` (`project_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
