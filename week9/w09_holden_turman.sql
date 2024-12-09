-- -------------------------------------------------------------------------------------------

USE v_art;


-- -------------------------------------------------------------------------------------------
-- 1. When you visit art.byuiwebdev.com, and you search by artist last name 
--    and you choose Picasso, you get one resulting image ("guitarist"). 
--    Write the query that will display this image.
-- -------------------------------------------------------------------------------------------
SELECT artwork.artfile
FROM artist
JOIN artwork ON artist.artist_id = artwork.artist_id
WHERE artist.lname = 'Picasso';


-- -------------------------------------------------------------------------------------------
-- 2. When you visit art.byuiwebdev.com, and you search by Subject and type in the word land, 
--    you get four images. Write the query to display those images.
--   (remember the keyword might have been 'landscape' but they typed 'land')
-- -------------------------------------------------------------------------------------------
SELECT artwork.artfile 
FROM artwork
JOIN artwork_keyword ON artwork.artwork_id = artwork_keyword.artwork_id
JOIN keyword ON artwork_keyword.keyword_id = keyword.keyword_id
WHERE keyword.keyword LIKE '%land%';






-- -------------------------------------------------------------------------------------------
-- 3. List the artist without a piece of artwork.
--    We need the first and last name and artwork title. 
-- -------------------------------------------------------------------------------------------

SELECT artist.fname, artist.lname, artwork.title
FROM artist
LEFT JOIN artwork ON artist.artist_id = artwork.artist_id
WHERE artwork.artwork_id IS NULL;




USE magazine;

-- -------------------------------------------------------------------------------------------
-- 4. List all magazines without a subscriber
--    List magazine name, and the subscriber's first and last name.
-- -------------------------------------------------------------------------------------------
SELECT m.magazineName, s.subscriberFirstName, s.subscriberLastName
FROM magazine m
LEFT JOIN subscription sub ON m.magazineKey = sub.magazineKey
LEFT JOIN subscriber s ON sub.subscriberKey = s.subscriberKey
WHERE sub.subscriptionKey IS NULL;

-- -------------------------------------------------------------------------------------------
-- 5.  List all the magazines that Albert Anderson subscribes to. 
-- -------------------------------------------------------------------------------------------
SELECT m.magazineName
FROM magazine m
JOIN subscription sub ON m.magazineKey = sub.magazineKey
JOIN subscriber s ON sub.subscriberKey = s.subscriberKey
WHERE s.subscriberFirstName = 'Albert' AND s.subscriberLastName = 'Anderson';


USE employees;


-- -------------------------------------------------------------------------------------------
-- 6. List the first 5 employees from the Marketing Department. 
--    Put them in alphabetical order by last name.
-- -------------------------------------------------------------------------------------------
SELECT e.first_name, e.last_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing'
ORDER BY e.last_name
LIMIT 5;












-- -------------------------------------------------------------------------------------------
-- 7. Find out the current salary and department of Tuval Kalloufi. 
--    You can use the ORDER BY and LIMIT to get just the most recent salary. 
--    Format the salary to be readable (Use FORMAT())
-- -------------------------------------------------------------------------------------------
SELECT e.first_name
,
       e.last_name
,
       d.dept_name AS debt_name
,
    CONCAT('$' ,FORMAT(s.salary, 2)) AS salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE e.first_name = 'Tuval' AND e.last_name = 'Kalloufi'
ORDER BY s.from_date DESC
LIMIT 1;


