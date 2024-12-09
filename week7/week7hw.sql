-- ------------------------------------------------------------------------------------

USE v_art;

-- ------------------------------------------------------------------------------------
-- 1. The manager wants to add the artist Gustav Klimt as an artist in the database.
--    He was born in 1862, died in 1917, and is from Italy. 
--    He is not a local artist. 
--    Write the insert statement that would add the artist to the system. 
--    (Hint: Assign the artist a primary key that is next in sequence for the table)
-- ------------------------------------------------------------------------------------


-- ------------------------------------------------------------------------------------
-- 2. The manager wants to list all the artists sorted by the last name of the artist.
--    Write the query that would allow the 7 columns of values 
--    (all but the primary key) to show up alphabetically by the last name. 
-- ------------------------------------------------------------------------------------


-- ------------------------------------------------------------------------------------
-- 3. The manager wants to edit Klimt's information. 
--    She finds out that he died in 1918 not 1917. 
--    The manager changes the 'Date of Death' (dod) value to be 1918 and clicks 'Apply'
--    Write the SQL statement that will run in the background to accomplish this edit. 
--   (The UPDATE should include a WHERE clause!)
-- ------------------------------------------------------------------------------------


-- ------------------------------------------------------------------------------------------
-- 4. The manager decides that she wants to delete Klimt as an artist from her database.
--    Write the SQL statement that would delete Gustav Klimt from the database. 
--    (Don't forget a WHERE clause!)
-- ------------------------------------------------------------------------------------------





USE bike;

-- ------------------------------------------------------------------------------------
-- 5.  There is a product demonstration and bike race planned in Buffalo, New York 
--     and you'd like to text each of your customers from that city
--     to see if they will participate.
--     You need a list of their first and last names and phone numbers.
-- ------------------------------------------------------------------------------------



-- ------------------------------------------------------------------------------------
-- 6. You need to sell more of your high-end bikes. 
--    You want to take $600 off all bikes that have a list price of $6,000.00 or more.
--    You need to have a list showing the bike name, list price and discount price 
--    with an alias of 'Discount Price'. 
--    Order the list showing the most expensive bike first
-- ------------------------------------------------------------------------------------


-- -----------------------------------------------------------------------------------------------
-- 7. An important announcement was given to all the staff but those at your store (store_id 2).
--    The same announcement needs to get to all your staff. 
--    You need a list of all the staff and their email who are from your store.
-- -----------------------------------------------------------------------------------------------


-- ------------------------------------------------------------------------------------
-- 8. A customer needs more information about a specific bike, 
--    but all they know is that is has the word 'CrossRip' in the name. 
--    You need to list the name, model year, and list price of all the bikes 
--    with the word 'CrossRip' somewhere in the name. 
-- ------------------------------------------------------------------------------------


-- ------------------------------------------------------------------------------------
-- 9. You need to list all bikes names 
--    that have a range of prices from $600 to $750 sorted with the lowest price first.
-- ------------------------------------------------------------------------------------


-- ------------------------------------------------------------------------------------------
-- 10. Show the customer's first_name, last_name, phone, street, city, state, zip_code who:
--     have a phone number listed
--     AND whose city has the letters 'los' or 'lan' somewhere in their name of the city
--     OR whose last name is Armstrong
--     (HINT: because of the OR, someone with last name William 
--            does not have to have a phone number or live in an 'los'/'lan' city). 
--     Limit the result set to the first 5 results.
-- ------------------------------------------------------------------------------------------

