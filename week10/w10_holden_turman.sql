-- -------------------------------------------------------------------------------------------

USE bike;

-- -------------------------------------------------------------------------------------------
-- 1. Get the total quantity that we have in all our bike stocks.
-- -------------------------------------------------------------------------------------------
-- Need to come back and add a comma to this -- 
SELECT SUM(quantity) AS 'Total Stock'
FROM bike.stock;

-- -------------------------------------------------------------------------------------------
-- 2. Show the number of bikes by store that need to be reordered 
--    (those bikes that are out of stock). 
--    Filter the results to only the lowest quantity of zero.
-- -------------------------------------------------------------------------------------------
-- 2. Show bikes that need to be reordered
SELECT st.store_name, COUNT(*) AS 'Number to be reordered'
FROM stock s
JOIN store st ON s.store_id = st.store_id
WHERE s.quantity = 0
GROUP BY st.store_name;


-- -------------------------------------------------------------------------------------------
-- 3. How many bikes for each category of bike do we have in stock at 
--    our "Baldwin Bikes" store. We need to see the name of the category 
--    as well as the number of bikes in the category. 
--    Sort it by lowest total first. 
-- -------------------------------------------------------------------------------------------
-- 3. Number of bikes for each category at "Baldwin Bikes"
SELECT c.category_name, SUM(s.quantity) AS 'instock'
FROM stock s
JOIN product p ON s.product_id = p.product_id
JOIN category c ON p.category_id = c.category_id
JOIN store st ON s.store_id = st.store_id
WHERE st.store_name = 'Baldwin Bikes'
GROUP BY c.category_name
ORDER BY 'Total in Stock' ASC;



USE employees;


-- -------------------------------------------------------------------------------------------
-- 4. How many managers do we have?
-- -------------------------------------------------------------------------------------------
-- 4. Count the total number of managers
SELECT COUNT(*) AS 'Number of Managers'
FROM dept_manager;


-- -------------------------------------------------------------------------------------------
-- 5. Get the average salaries in each department. 
--    We only need those departments that have 
--    average salaries that are above 60,000. 
--    Format the salary to 2 decimal places and a comma 
--    in the thousands place and dollar sign in front. 
-- -------------------------------------------------------------------------------------------
-- 5. Average salaries by department, formatted and filtered above 60,000
SELECT d.dept_name, 
       CONCAT('$', FORMAT(AVG(s.salary), 2)) AS 'Average Salary'
FROM salaries s
JOIN dept_emp de ON s.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
HAVING AVG(s.salary) > 60000;


-- -------------------------------------------------------------------------------------------
-- 6. Find out how many females work in each department
--    List the department name and number of female workers,
--    ordered from most to least.
-- -------------------------------------------------------------------------------------------
SELECT d.dept_name, COUNT(*) AS Female_Employees
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE e.gender = 'F'
GROUP BY d.dept_name
ORDER BY Female_Employees DESC;

