-- TASK #1
-- What are the emails of the customers who live in California?

-- Checking the customer table
SELECT *
FROM customer
LIMIT 5;

-- Checking the address table
SELECT *
FROM address
LIMIT 5;

-- Joining both and creating a "mega table"
SELECT *
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id;

-- Filtering to only district names that are equal to 'California'
SELECT *
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'California';

-- Displaying only the district and email columns
SELECT district, email
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'California';



-- TASK #2 
-- Getting a list of all the movies "Nick Wahlberg" has been in

-- Checking the film table
SELECT *
FROM film
LIMIT 5;

-- Checking the actor table
SELECT *
FROM actor
LIMIT 5;

-- Checking the film_actor table
SELECT *
FROM film_actor
LIMIT 5;

-- Joining these three and creating a "mega table"
SELECT *
FROM film_actor
INNER JOIN film
ON film_actor.film_id = film.film_id
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id;

-- Displaying only the title, first name and last name columns
SELECT title, first_name, last_name
FROM film_actor
INNER JOIN film
ON film_actor.film_id = film.film_id
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id;

-- Filtering and retrieving only the titles with "Nick Wahlberg"
SELECT title, first_name, last_name
FROM film_actor
INNER JOIN film
ON film_actor.film_id = film.film_id
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
WHERE first_name = 'Nick'
AND last_name = 'Wahlberg';