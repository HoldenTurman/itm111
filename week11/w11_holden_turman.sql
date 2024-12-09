-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `university` ;

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`Department` ;

CREATE TABLE IF NOT EXISTS `university`.`Department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`Course` ;

CREATE TABLE IF NOT EXISTS `university`.`Course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_code` VARCHAR(10) NOT NULL,
  `course_num` VARCHAR(10) NOT NULL,
  `course_title` VARCHAR(45) NOT NULL,
  `credit_amount` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_Course_Department_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Department`
    FOREIGN KEY (`department_id`)
    REFERENCES `university`.`Department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`Teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`Teacher` ;

CREATE TABLE IF NOT EXISTS `university`.`Teacher` (
  `teacher_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`teacher_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`Semester`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`Semester` ;

CREATE TABLE IF NOT EXISTS `university`.`Semester` (
  `semester_id` INT NOT NULL AUTO_INCREMENT,
  `year` DATE NOT NULL,
  `term` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`semester_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`Section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`Section` ;

CREATE TABLE IF NOT EXISTS `university`.`Section` (
  `section_id` INT NOT NULL AUTO_INCREMENT,
  `year` DATE NOT NULL,
  `term` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  `course_id` INT NOT NULL,
  `teacher_id` INT NOT NULL,
  `semester_id` INT NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_Section_Course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_Section_Teacher1_idx` (`teacher_id` ASC) VISIBLE,
  INDEX `fk_Section_Semester1_idx` (`semester_id` ASC) VISIBLE,
  CONSTRAINT `fk_Section_Course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `university`.`Course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Section_Teacher1`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `university`.`Teacher` (`teacher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Section_Semester1`
    FOREIGN KEY (`semester_id`)
    REFERENCES `university`.`Semester` (`semester_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`Student` ;

CREATE TABLE IF NOT EXISTS `university`.`Student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `gender` CHAR(1) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`Enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`Enrollment` ;

CREATE TABLE IF NOT EXISTS `university`.`Enrollment` (
  `enrollment_id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  INDEX `fk_Enrollment_Student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_Enrollment_Section1_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_Enrollment_Student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `university`.`Student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrollment_Section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`Section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;