-- ------------------------------------------------------------------------------------
-- Paste Forward Engineer code (from film.sql) into the w06_hw.sql file. (Do this last)
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema film
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `film` ;

-- -----------------------------------------------------
-- Schema film
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `film` DEFAULT CHARACTER SET utf8 ;
USE `film` ;

-- -----------------------------------------------------
-- Table `film`.`rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`rating` ;

CREATE TABLE IF NOT EXISTS `film`.`rating` (
  `rating_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rating_level` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`rating_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `film`.`studio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`studio` ;

CREATE TABLE IF NOT EXISTS `film`.`studio` (
  `studio_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `studio_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`studio_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie` ;

CREATE TABLE IF NOT EXISTS `film`.`movie` (
  `movie_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_title` VARCHAR(45) NOT NULL,
  `movie_year` INT UNSIGNED NOT NULL,
  `rating_id` INT UNSIGNED NOT NULL,
  `studio_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_id`),
  INDEX `movie_fk1_idx` (`rating_id` ASC) VISIBLE,
  CONSTRAINT `movie_fk1`
    FOREIGN KEY (`rating_id`)
    REFERENCES `film`.`rating` (`rating_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `movie_fk2`
    FOREIGN KEY (`studio_id`)
    REFERENCES `film`.`studio` (`studio_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`actor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`actor` ;

CREATE TABLE IF NOT EXISTS `film`.`actor` (
  `actor_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `actor_fname` VARCHAR(45) NOT NULL,
  `actor_lname` VARCHAR(45) NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`genre` ;

CREATE TABLE IF NOT EXISTS `film`.`genre` (
  `genre_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `genre_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`feature` ;

CREATE TABLE IF NOT EXISTS `film`.`feature` (
  `feature_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `feature_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`feature_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`media` ;

CREATE TABLE IF NOT EXISTS `film`.`media` (
  `media_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `media_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`media_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`price`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`price` ;

CREATE TABLE IF NOT EXISTS `film`.`price` (
  `price_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `price_value` FLOAT UNSIGNED NOT NULL,
  PRIMARY KEY (`price_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie_genre` ;

CREATE TABLE IF NOT EXISTS `film`.`movie_genre` (
  `movie_genre_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` INT UNSIGNED NOT NULL,
  `genre_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_genre_id`),
  INDEX `movie_genre_fk1_idx` (`movie_id` ASC) VISIBLE,
  INDEX `movie_genre_fk2_idx` (`genre_id` ASC) VISIBLE,
  CONSTRAINT `movie_genre_fk1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movie_genre_fk2`
    FOREIGN KEY (`genre_id`)
    REFERENCES `film`.`genre` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`cast`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`cast` ;

CREATE TABLE IF NOT EXISTS `film`.`cast` (
  `cast_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` INT UNSIGNED NOT NULL,
  `actor_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`cast_id`),
  INDEX `cast_fk1_idx` (`movie_id` ASC) VISIBLE,
  INDEX `cast_fk2_idx` (`actor_id` ASC) VISIBLE,
  CONSTRAINT `cast_fk1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cast_fk2`
    FOREIGN KEY (`actor_id`)
    REFERENCES `film`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie_feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie_feature` ;

CREATE TABLE IF NOT EXISTS `film`.`movie_feature` (
  `movie_feature_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` INT UNSIGNED NOT NULL,
  `feature_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_feature_id`),
  INDEX `movie_feature_fk1_idx` (`movie_id` ASC) VISIBLE,
  INDEX `movie_feature_fk2_idx` (`feature_id` ASC) VISIBLE,
  CONSTRAINT `movie_feature_fk1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movie_feature_fk2`
    FOREIGN KEY (`feature_id`)
    REFERENCES `film`.`feature` (`feature_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie_media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie_media` ;

CREATE TABLE IF NOT EXISTS `film`.`movie_media` (
  `movie_media_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` INT UNSIGNED NOT NULL,
  `media_id` INT UNSIGNED NOT NULL,
  `price_id` INT UNSIGNED NULL,
  PRIMARY KEY (`movie_media_id`),
  INDEX `movie_media_fk1_idx` (`movie_id` ASC) VISIBLE,
  INDEX `movie_media_fk2_idx` (`media_id` ASC) VISIBLE,
  INDEX `movie_media_fk3_idx` (`price_id` ASC) VISIBLE,
  CONSTRAINT `movie_media_fk1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movie_media_fk2`
    FOREIGN KEY (`media_id`)
    REFERENCES `film`.`media` (`media_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movie_media_fk3`
    FOREIGN KEY (`price_id`)
    REFERENCES `film`.`price` (`price_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- ------------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------------
-- USE the database
USE film;

-- Studios
INSERT INTO `studio` (`studio_name`) VALUES
('Pixar'), ('MGM'), ('20th Century Fox'), ('Apple TV+'), ('Warner Bros');

-- Ratings
INSERT INTO `rating` (`rating_level`) VALUES
('G'), ('PG'), ('PG-13');

-- Media Types
INSERT INTO `media` (`media_type`) VALUES
('DVD'), ('blu-ray'), ('Streaming'), ('4K');

-- Prices
INSERT INTO `price` (`price_value`) VALUES
(19.95), (24.95), (35.00), (24.95);

-- Genres
INSERT INTO `genre` (`genre_name`) VALUES
('Family'), ('Animated'), ('Musical'), ('Romance'), ('Sci-Fi'),
('Comedy'), ('Drama'), ('Adventure'), ('Action');

-- Actors
INSERT INTO `actor` (`actor_fname`, `actor_lname`) VALUES
('Tom', 'Hanks'), ('Tim', 'Allen'), ('Annie', 'Potts'), ('John', 'Ratzenberger'),
('Gene', 'Kelly'), ('Cyd', 'Charisse'), ('Van', 'Johnson'), ('Harrison', 'Ford'),
('Carrie', 'Fisher'), ('Mark', 'Hamill'), ('Emilia', 'Jones'), ('Marlee', 'Matlin'),
('Troy', 'Kotsur'), ('Timothee', 'Chalamet'), ('Rebecca', 'Ferguson'), 
('Zendaya', NULL), ('Oscar', 'Isaac'), ('Jason', 'Momoa');

-- Features
INSERT INTO `feature` (`feature_name`) VALUES
('bloopers'), ('actor interviews'), ('cut scenes'), ('deleted scenes'), 
('special effects'), ('trailers');

-- Movies
INSERT INTO `movie` (`movie_title`, `movie_year`, `rating_id`, `studio_id`) VALUES
('Toy Story', 1995, 1, 1), ('Toy Story 2', 1999, 1, 1), ('Brigadoone', 1954, 1, 2), 
('The Empire Strikes Back', 1977, 2, 3), ('Coda', 2021, 3, 4), ('Dune', 2021, 3, 5);

-- Linking tables
-- Movie Media
INSERT INTO `movie_media` (`movie_id`, `media_id`, `price_id`) VALUES
(1, 1, 1), (2, 1, 2), (3, 1, 1), (4, 2, 3), (5, 3, NULL), (6, 2, 4), (6, 4, 1);

-- Movie Genres
INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES
(1, 1), (1, 2), (2, 1), (2, 2), (3, 3), (3, 4), (4, 5), (5, 6), (5, 7), 
(6, 7), (6, 8), (6, 9);

-- Cast
INSERT INTO `cast` (`movie_id`, `actor_id`) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (2, 1), (2, 2), (2, 3), (2, 4), 
(3, 5), (3, 6), (4, 8), (4, 9), (4, 10), (5, 11), (5, 12), (5, 13), 
(6, 14), (6, 15), (6, 16), (6, 17), (6, 18);

-- Movie Features
INSERT INTO `movie_feature` (`movie_id`, `feature_id`) VALUES
(1, 1), (2, 2), (4, 1), (4, 3), (5, 6), (6, 4), (6, 5), (6, 6);