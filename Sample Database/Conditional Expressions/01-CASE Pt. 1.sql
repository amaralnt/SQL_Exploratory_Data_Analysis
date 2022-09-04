-- Checking customer table 
SELECT *
FROM customer;

-- Grabbing only the customer_id column
SELECT customer_id
FROM customer;

-- Using the General CASE statement to divide customers into tiers based on their customer_id
SELECT customer_id,
CASE
	WHEN (customer_id <= 100) THEN 'Premium'
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
	ELSE 'Normal'
END
FROM customer;

-- Using alias to rename the new column
SELECT customer_id,
CASE
	WHEN (customer_id <= 100) THEN 'Premium'
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
	ELSE 'Normal'
END AS customer_tier
FROM customer;

-- Using the CASE Expression to simulate a raffle (customer_id 2 will be the winner and 5 will be in second place)
SELECT customer_id,
CASE customer_id
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN 'Second Place'
	ELSE 'Normal'
END AS raffle_results
FROM customer;

-- Checking film table
SELECT *
FROM film;

-- Checking rental_rate
SELECT rental_rate
FROM film;

-- Checking distinct rental_rate values 
SELECT DISTINCT(rental_rate)
FROM film;

-- Creating a category for 0.99 movies
SELECT rental_rate,
CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END 
FROM film;

-- Checking how many 0.99 movies there are with SUM()
SELECT
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END ) AS bargains
FROM film;

-- Checking the 2.99 as well
SELECT
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargains,
SUM(CASE rental_rate
	WHEN 2.99 THEN 1
	ELSE 0
END) AS regular
FROM film;

-- Creating a new category, now for 4.99 movies
SELECT
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargains,
SUM(CASE rental_rate
	WHEN 2.99 THEN 1
	ELSE 0
END) AS regular,
SUM(CASE rental_rate
	WHEN 4.99 THEN 1
	ELSE 0
END) AS premium
FROM film;

-- Now at the exact same time as separate columns, I can check bargains, regurlar, and premium movies