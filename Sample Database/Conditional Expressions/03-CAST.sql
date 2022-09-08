-- Syntax of CAST
SELECT CAST('5' AS INTEGER) AS new_integer;

-- PostgreSQL CAST operator
SELECT '5'::INTEGER AS new_integer;

-- Let's check a real example

-- Checking the rental table
SELECT *
FROM rental;

-- Filtering 
SELECT inventory_id
FROM rental;

-- Let's say we want to figure out the actual character length of each inventory_id

-- Casting inventory_id as a string with the CAST function
SELECT CAST(inventory_id AS VARCHAR)
FROM rental;

-- Checking character length with the CHAR_LENGTH function
SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR))
FROM rental;

-- Selecting only those with 4 digits 
SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR))
FROM rental
WHERE CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) = 4;

-- Counting only those with 4 digits 
SELECT COUNT(CHAR_LENGTH(CAST(inventory_id AS VARCHAR)))
FROM rental
WHERE CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) = 4;

-- Selecting only those with 1 digit
SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR))
FROM rental
WHERE CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) = 1;

-- Displaying the inventory_id as well
SELECT inventory_id, CHAR_LENGTH(CAST(inventory_id AS VARCHAR))
FROM rental
WHERE CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) = 1;