-- TASK #1
-- How many payment transactions were greater than $5.00?

-- Taking a quick look at the payment table
SELECT *
FROM payment
LIMIT 5;

-- Checking the distinct values of the amount column in ascending order
SELECT DISTINCT (amount)
FROM payment 
ORDER BY amount ASC;

-- Discovering how many payments greater than $5.00 have occurred
SELECT COUNT (*)
FROM payment
WHERE amount > 5.00;



-- TASK #2
-- How many actors have a first name that starts with the letter P?

-- Taking a quick look at the actor table
SELECT *
FROM actor
LIMIT 5;

-- Looking for distinct first names that starts with P
SELECT DISTINCT (first_name)
FROM actor
WHERE first_name LIKE 'P%';

-- Looking for first names that starts with P 
-- (but with ILIKE, which is case insensitive) 
-- Also checking for duplicates by displaying the last names
SELECT first_name, last_name
FROM actor
WHERE first_name ILIKE 'P%';

-- Counting
SELECT COUNT (*)
FROM actor
WHERE first_name LIKE 'P%';



-- TASK #3
-- How many unique districts are our customers from?

-- Taking a quick look at the address table
SELECT *
FROM address
LIMIT 5;

-- Counting 
SELECT COUNT (DISTINCT (district))
FROM address;



-- TASK #4
-- Retrieve the list of names for those distinct districts from the previous task

-- Retrieving the list (goes up to 378)
SELECT DISTINCT (district)
FROM address;



-- TASK #5
-- How many films have a rating of R and a replacement cost between $5 and $15?

-- Taking a quick look at the film table
SELECT *
FROM film
LIMIT 5;

-- Filtering 
SELECT title, rating, replacement_cost
FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15
ORDER BY replacement_cost ASC;

-- Counting
SELECT COUNT (*)
FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15;



-- TASK #6
-- How many films have the word Truman somewhere in the title?

-- Taking a quick look at the film table
SELECT *
FROM film
LIMIT 5;

-- Filtering 
SELECT *
FROM film
WHERE title LIKE '%Truman%';

-- Counting
SELECT COUNT (*)
FROM film
WHERE title LIKE '%Truman%';