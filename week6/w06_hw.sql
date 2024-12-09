-- ------------------------------------------------------------------------------------
-- Paste Forward Engineer code (from film.sql) into the w06_hw.sql file. (Do this last)

-- ------------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------------
-- USE the database
USE film;

-- ------------------------------------------------------------------------------------
-- 1. Insert into the studio table - Parent Table
-- Keeps telling me there are duplicates but I can't find them anywhere.
INSERT IGNORE INTO studio (studio_id, studio_name) VALUES
(1, 'Pixar'),
(2, 'MGM'),
(3, '20th Century Fox'),
(4, 'Apple TV+'),
(5, 'Warner Bros');


-- ------------------------------------------------------------------------------------
-- 2. Insert into the rating table - Parent Table
-- Keeps telling me there are duplicates but I can't find them anywhere.
INSERT IGNORE INTO rating (rating_id, rating_level)
VALUES
(1, 'G'),
(2, 'PG'),
(3, 'PG-13'); 

-- ------------------------------------------------------------------------------------
-- 3. Insert into the movie table - Child Table

INSERT IGNORE INTO movie (movie_id, movie_title, movie_year, rating_id,studio_id)
VALUES
(1, 'Toy Story', 1995, 1, 1),
(2, 'Toy Story 2', 1999, 1, 1),
(3, 'Brigadoone', 1954, 1, 2),
(4, 'The Empire Strikes Back', 1980, 2, 3),
(5, 'Coda', 2021, 3, 4),
(6, 'Dune', 2021, 3, 5);


-- ------------------------------------------------------------------------------------
-- 4. Insert into the actor table - Parent Table
INSERT IGNORE INTO actor (actor_id, actor_fname, actor_lname)
VALUES
(1, 'Tom','Hanks'),
(2, 'Tim','Allen'),
(3, 'Annie', 'Potts'),
(4, 'John', 'Ratzenberger'),
(5, 'Gene', 'Kelly'),
(6, 'Cyd', 'Charisse'),
(7, 'Van', 'Johnson'),
(8, 'Harrison', 'Ford'),
(9, 'Carrie', 'Fisher'),
(10, 'Mark', 'Hamill'),
(11, 'Emilia', 'Jones'),
(12, 'Marlee', 'Matlin'),
(13, 'Troy', 'Kotsur'),
(14, 'Timothee', 'Chalamet'),
(15, 'Rebecca', 'Ferguson'),
(16, 'Zendaya', NULL),
(17, 'Oscar', 'Isaac'),
(18, 'Jason', 'Momoa');

-- ------------------------------------------------------------------------------------
-- 5. Insert into the feature table - Parent Table
INSERT IGNORE INTO feature (feature_id, feature_name)
VALUES
(1, 'bloopers'),
(2, 'actor interviews'),
(3, 'cut scenes'),
(4, 'deleted scenes'),
(5, 'special effects'),
(6, 'trailers');

-- ------------------------------------------------------------------------------------
-- 6. Insert into the genre table - Parent Table
INSERT IGNORE INTO genre (genre_id, genre_name)
VALUES
(1, 'Family'),
(2, 'Animated'),
(3, 'Musical'),
(4, 'Romance'),
(5, 'Sci-Fi'),
(6, 'Comedy'),
(7, 'Drama'),
(8, 'Adventure'),
(9, 'Action');

-- ------------------------------------------------------------------------------------
-- 7. Insert into the media table - Parent Table

INSERT IGNORE INTO media (media_id, media_type)
VALUES
(1, 'DVD'),
(2, 'blu-ray'),
(3, 'Streaming'),
(4, '4K');

-- ------------------------------------------------------------------------------------
-- 8. Insert into the price table - Parent Table

INSERT IGNORE INTO price (price_id, price_value)
VALUES
(1, 19.95),
(2, 24.95),
(3, 35.00);

-- ------------------------------------------------------------------------------------
-- 9. Insert into the cast table - Linking Table
INSERT IGNORE INTO cast (movie_id, actor_id)
VALUES
-- Toy Story
(1, 1),
(1, 2),
(1, 3),
(1, 4),
-- Toy Story 2
(2, 1),
(2, 2),
(2, 3),
(2, 4),
-- Brigadoone
(3, 5),
(3, 6),
(3, 7),
-- The Empire Strikes Back
(4, 8),
(4, 9),
(4, 10),
-- Coda
(5, 11),
(5, 12),
(5, 13),
-- Dune
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18);

-- ------------------------------------------------------------------------------------
-- 10. Insert into the movie_feature table - Linking Table
INSERT IGNORE INTO movie_feature (movie_id, feature_id)
VALUES
-- Toy Story
(1, 1),
-- Toy Story 2
(2, 2),
-- The Empire Strikes Back
(4, 1),
(4, 3),
-- Coda
(5, 6),
-- Dune
(6, 4),
(6, 5),
(6, 6);

-- ------------------------------------------------------------------------------------
-- 11. Insert into the movie_genre table - Linking Table
INSERT IGNORE INTO movie_genre (movie_id, genre_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(5, 3),
(5, 6),
(5, 7),
(6, 7),
(6, 8),
(6, 9);

-- ------------------------------------------------------------------------------------
-- 12. Insert into the movie_media table - Linking Table
INSERT IGNORE INTO movie_media (movie_id, media_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 3),
(6, 2),
(6, 4);
-- ------------------------------------------------------------------------------------