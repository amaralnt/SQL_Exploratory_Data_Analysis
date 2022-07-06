-- TASK #1
-- How many payments did each staff member handle?

-- Taking a quick look at the payment table
SELECT *
FROM payment
LIMIT 5;

-- Checking how many staff members there are
SELECT DISTINCT(staff_id)
FROM payment;

-- Counting the total of transactions
SELECT COUNT(*)
FROM payment;

-- Counting the number of transactions per staff member 
SELECT staff_id, COUNT(amount)
FROM payment 
GROUP BY staff_id;



-- TASK #2
-- What is the average replacement cost per MPAA rating?

-- Taking a quick look at the film table
SELECT *
FROM film
LIMIT 5;

-- Calculating the average replacement cost per MPAA rating
SELECT rating, AVG(replacement_cost)
FROM film
GROUP BY rating;

-- Rounding the results and ordering by ascending order
SELECT rating, ROUND(AVG(replacement_cost),2)
FROM film
GROUP BY rating
ORDER BY ROUND(AVG(replacement_cost),2);



-- TASK #3
-- What are the customer ids of the top 5 customers by total spend?

-- Taking a quick look at the payment table
SELECT *
FROM payment
LIMIT 5;

-- Counting the number of distinct customer ids
SELECT COUNT(DISTINCT(customer_id))
FROM payment;

-- Retrieving the total amount spent per customer id
SELECT customer_id, SUM(amount)
FROM payment 
GROUP BY customer_id;

-- Showing only the 5 who spent the most 
SELECT customer_id, SUM(amount)
FROM payment 
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;



-- TASK #4
-- What customers have had 40 or more transaction payments?

-- Taking a quick look at the payment table
SELECT *
FROM payment
LIMIT 5;

-- Further filtering and retrieving the customer ids with 40 or more transactions
SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id 
HAVING COUNT(amount) >= 40;



-- TASK #5
-- What are the customer ids of customers who have spent more than $100 in payment transactions with staff member 2?

-- Showing only the outputs that match the conditions above
SELECT customer_id, SUM(amount)
FROM payment 
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100
ORDER BY SUM(amount) ASC;