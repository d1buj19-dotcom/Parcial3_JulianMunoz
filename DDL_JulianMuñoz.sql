-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ASIS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ASIS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ASIS` DEFAULT CHARACTER SET utf8 ;
USE `ASIS` ;

-- -----------------------------------------------------
-- Table `ASIS`.`engineering`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ASIS`.`engineering` (
  `idengineering` INT NULL,
  `programs_name` VARCHAR(45) NULL,
  `programs_code` VARCHAR(45) NULL,
  `programs_director` VARCHAR(45) NULL,
  `engineering_director` VARCHAR(45) NULL,
  PRIMARY KEY (`idengineering`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ASIS`.`program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ASIS`.`program` (
  `idengineering` INT NULL,
  `faculty` VARCHAR(45) NULL,
  `program_name` VARCHAR(45) NULL,
  `program_code` VARCHAR(45) NULL,
  `program_director` VARCHAR(45) NULL,
  `total_credits` INT NULL,
  `academic_period` VARCHAR(45) NULL,
  `enrollment_status` VARCHAR(45) NULL,
  `average_grade` VARCHAR(45) NULL,
  `course_code` INT NULL,
  `course_name` VARCHAR(45) NULL,
  `course_credits` INT NULL,
  `weekly_hours` INT NULL,
  `professor_id` INT NULL,
  `professor_name` VARCHAR(45) NULL,
  `professor_email` VARCHAR(45) NULL,
  `engineering_idengineering` INT NOT NULL,
  PRIMARY KEY (`idengineering`),
  INDEX `fk_program_engineering1_idx` (`engineering_idengineering` ASC) VISIBLE,
  CONSTRAINT `fk_program_engineering1`
    FOREIGN KEY (`engineering_idengineering`)
    REFERENCES `ASIS`.`engineering` (`idengineering`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ASIS`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ASIS`.`student` (
  `studentCode` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `birthdate` DATE NULL,
  `age` INT NULL,
  `email` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `phone` INT NULL,
  `gender` VARCHAR(45) NULL,
  `program_idengineering` INT NOT NULL,
  PRIMARY KEY (`studentCode`),
  INDEX `fk_student_program_idx` (`program_idengineering` ASC) VISIBLE,
  CONSTRAINT `fk_student_program`
    FOREIGN KEY (`program_idengineering`)
    REFERENCES `ASIS`.`program` (`idengineering`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ASIS`.`officials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ASIS`.`officials` (
  `studentCode` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `birthdate` DATE NULL,
  `age` INT NULL,
  `email` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `phone` INT NULL,
  `gender` VARCHAR(45) NULL,
  `type_offcials` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  `official_state` VARCHAR(45) NULL,
  `engineering_idengineering` INT NOT NULL,
  PRIMARY KEY (`studentCode`),
  INDEX `fk_officials_engineering1_idx` (`engineering_idengineering` ASC) VISIBLE,
  CONSTRAINT `fk_officials_engineering1`
    FOREIGN KEY (`engineering_idengineering`)
    REFERENCES `ASIS`.`engineering` (`idengineering`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
