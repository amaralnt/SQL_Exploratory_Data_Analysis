-- TASK #1
-- Return the customer ids of customers who have spent at least $110 with the staff member number 2

-- Taking a quick look at the payment table
SELECT *
FROM payment
LIMIT 5;

-- Matching the asked conditions
SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;



-- TASK #2
-- How many films begin with the letter 'J'?

-- Taking a quick look at the film table
SELECT *
FROM film
LIMIT 5;

-- Displaying film titles starting with the letter 'J'
SELECT title
FROM film
WHERE title LIKE 'J%';

-- Counting 
SELECT COUNT(title)
FROM film
WHERE title LIKE 'J%';



-- TASK #3
-- What customer has the highest customer id number whose name starts with an 'E' and has an address id lower than 500?

-- Taking a quick look at the customer table
SELECT *
FROM customer
LIMIT 5;

-- Matching the asked conditions
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'E%'
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;