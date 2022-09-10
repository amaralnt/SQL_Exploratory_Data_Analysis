-- Checking customer table
SELECT *
FROM customer;

-- Checking address table
SELECT *
FROM address;

-- Joining customer and address table together 
SELECT first_name, last_name, address
FROM customer 
INNER JOIN address
ON customer.address_id = address.address_id;

-- Creating a view for the previous query  
CREATE VIEW customer_info AS
SELECT first_name, last_name, address
FROM customer 
INNER JOIN address
ON customer.address_id = address.address_id;

-- Retrieving the new view 
SELECT *
FROM customer_info;

-- Altering the view 
CREATE OR REPLACE VIEW customer_info AS
SELECT first_name, last_name, address, district
FROM customer 
INNER JOIN address
ON customer.address_id = address.address_id;

-- Checking the modified view
SELECT *
FROM customer_info;

-- Changing the view name
ALTER VIEW customer_info RENAME TO cust_info;

-- Trying to call it by its old name will return an Error
SELECT *
FROM customer_info;

-- Retrieving the view by its new name
SELECT *
FROM cust_info;

-- Checking if a view exists and then deleting it
DROP VIEW IF EXISTS cust_info;

-- Now the view no longer exists