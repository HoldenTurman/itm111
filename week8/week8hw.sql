-- -------------------------------------------------------------------------------------------

USE magazine;


-- (REMINDER: With all of these problems, make sure you use aliases, such as "7% off,")
-- -------------------------------------------------------------------------------------------
-- 1. List the magazine name and then take 7% off the magazine price 
--    and round to two decimal places. 
-- -------------------------------------------------------------------------------------------

SELECT magazineName
,      ROUND(magazinePrice * 0.93, 2) AS '7% Off'
FROM   magazine;
-- -------------------------------------------------------------------------------------------
-- 2. Show the primary key of id from the subscriber table 
--    and using the date of 2023-07-07 as if it were today's date, 
--    how long in years, ROUNDED to the nearest year, has it been since their subscription started?  
-- -------------------------------------------------------------------------------------------
SELECT subscriberKey
,      ROUND(DATEDIFF('2023-07-07', subscriptionStartDate) / 365, 0) AS 'Years Since Subscription'
FROM   subscription;

-- -------------------------------------------------------------------------------------------
-- 3. Show the subscriptionStartDate and subscriptionLength 
--    and add the subscriptionLength to the subscriptionStartDate 
--    to see the date of how long their subscription will go. 
--    After you have that date, then include the format function 
--    to change the date to the format of: September 21st, 2023.
-- -------------------------------------------------------------------------------------------
SELECT DATE_FORMAT(subscriptionStartDate, '%M %D, %Y') AS 'subscriptionStartDate'
,      subscriptionLength
,      DATE_FORMAT(DATE_ADD(subscriptionStartDate, INTERVAL 1 YEAR), '%M %D, %Y') AS 'Subscription End'
FROM   subscription;



USE bike;

-- -------------------------------------------------------------------------------------------
-- 4. We need a list of all the products without the year 
--    at the end of the product_name string. 
--    Notice that some have two years listed, 
--    make sure you take those off as well. 
--    Order your results by product_id and 
--    limit your results to the last 14.
-- -------------------------------------------------------------------------------------------


SELECT REGEXP_REPLACE(product_name, '\\s*(20\\d{2}|19\\d{2})\\b', '') AS `Product Name w/o Year`
FROM   product
ORDER BY product_id DESC
LIMIT 14;



-- -------------------------------------------------------------------------------------------
-- 5. List the 2019 model year bikes, their price, 
--    show the amount needed for a 5% down payment 
--    and divide the remaining balance into 10 equal payments. 
--    Display all monetary values with a dollar sign, 
--    comma at the thousands place and two decimal places. 
--    Adjust the column headings to appear as the screenshot shows.
--    | product_name | Price | 5% Down | Ten Equal Payments |
-- -------------------------------------------------------------------------------------------
SELECT product_name
,      CONCAT('$', FORMAT(list_price, 2)) AS Price
,      CONCAT('$', FORMAT(list_price * 0.05, 2)) AS "5% Down"
,      CONCAT('$', FORMAT((list_price - (list_price * 0.05)) / 10, 2)) AS "Ten Equal Payments"
FROM   product
WHERE  model_year = 2019;