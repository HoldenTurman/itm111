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
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8 ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`department` ;

CREATE TABLE IF NOT EXISTS `university`.`department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `university`.`degree`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`degree` ;

CREATE TABLE IF NOT EXISTS `university`.`degree` (
  `degree_id` INT NOT NULL AUTO_INCREMENT,
  `degree_name` VARCHAR(45) NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`degree_id`),
  INDEX `fk_degree_department_idx` (`department_id` ASC),
  CONSTRAINT `fk_degree_department`
    FOREIGN KEY (`department_id`)
    REFERENCES `university`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `university`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`course` ;

CREATE TABLE IF NOT EXISTS `university`.`course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_title` VARCHAR(45) NOT NULL,
  `course_code` VARCHAR(45) NOT NULL,
  `course_num` VARCHAR(45) NOT NULL,
  `course_credit` VARCHAR(45) NOT NULL,
  `degree_id` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_degree1_idx` (`degree_id` ASC),
  CONSTRAINT `fk_course_degree1`
    FOREIGN KEY (`degree_id`)
    REFERENCES `university`.`degree` (`degree_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `university`.`semester`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`semester` ;

CREATE TABLE IF NOT EXISTS `university`.`semester` (
  `semester_id` INT NOT NULL AUTO_INCREMENT,
  `term` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  PRIMARY KEY (`semester_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `university`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`section` ;

CREATE TABLE IF NOT EXISTS `university`.`section` (
  `section_id` INT NOT NULL AUTO_INCREMENT,
  `section_num` INT NOT NULL,
  `capacity` INT NOT NULL,
  `course_id` INT NOT NULL,
  `semester_id` INT NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_course1_idx` (`course_id` ASC),
  INDEX `fk_section_semester1_idx` (`semester_id` ASC),
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `university`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_semester1`
    FOREIGN KEY (`semester_id`)
    REFERENCES `university`.`semester` (`semester_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `university`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`person` ;

CREATE TABLE IF NOT EXISTS `university`.`person` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `gender` CHAR(1) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `birthdate` DATE NULL,
  PRIMARY KEY (`person_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `university`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`role` ;

CREATE TABLE IF NOT EXISTS `university`.`role` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `university`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `enrollment_id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  INDEX `fk_enrollment_person1_idx` (`person_id` ASC),
  INDEX `fk_enrollment_role1_idx` (`role_id` ASC),
  INDEX `fk_enrollment_section1_idx` (`section_id` ASC),
  CONSTRAINT `fk_enrollment_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `university`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `university`.`role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Insert Statements
-- -----------------------------------------------------
INSERT INTO person (first_name, last_name, gender, birthdate, city, state)
VALUES
('Allen', 'Stokes', 'M', '2000-03-15', 'Rexburg', 'ID'),
('Marshall', 'Spence', 'M', '2001-05-10', NULL, NULL),
('Nellie', 'Marquez', 'F', '1999-08-24', 'Salt Lake City', 'UT'),
('Kerri', 'Shah', 'F', '2002-11-12', NULL, NULL);

INSERT INTO role (role_name)
VALUES
('Student'),
('TA'),
('Professor');

INSERT INTO department (department_name)
VALUES
('Computer Science & Engineering'),
('Mathematics'),
('Web Design & Development');

INSERT INTO degree (degree_name, department_id)
VALUES
('Bachelor of Computer Science', 1),
('Bachelor of Mathematics', 2),
('Bachelor of Web Design', 3);

INSERT INTO course (course_code, course_num, course_title, course_credit, degree_id)
VALUES
('CSE', '100', 'Intro to Computing', '3', 1),
('MATH', '119', 'Applied Calculus', '4', 2),
('WDD', '130', 'Web Development Basics', '3', 3);

INSERT INTO semester (term, year)
VALUES
('Winter', 2025),
('Fall', 2024);

INSERT INTO section (section_num, course_id, semester_id, capacity)
VALUES
(1, 1, 2, 30),
(2, 1, 1, 30),
(1, 2, 1, 25),
(1, 3, 1, 20);

INSERT INTO enrollment (person_id, section_id, role_id)
VALUES
(1, 1, 2), -- Allen is a TA for WDD 130
(1, 2, 1), -- Allen is a Student in MATH 119
(1, 3, 1), -- Allen is a Student in CSE 100
(2, 1, 1), -- Marshall is a Student in WDD 130
(3, 2, 1), -- Nellie is a Student in MATH 119
(4, 3, 1); -- Kerri is a Student in CSE 100

-- -----------------------------------------------------
-- Queries
-- -----------------------------------------------------
