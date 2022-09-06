-- Discovering and comparing the various amounts of films per rating 

-- Quick look at the films table
SELECT *
FROM film
LIMIT 10;

-- Filtering
SELECT rating
FROM film;

-- Retrieving only the distinct values
SELECT DISTINCT rating
FROM film;

-- Selecting the films with R rating and creating a category for it 
SELECT rating,
CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END
FROM film;

-- Counting the films in this category 
SELECT
SUM(CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END) AS r
FROM film;

-- Doing the same for films with PG rating
SELECT
SUM(CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END) AS r,
SUM(CASE rating
	WHEN 'PG' THEN 1
	ELSE 0
END) AS pg
FROM film;

-- As well for films with PG-13 rating
SELECT
SUM(CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END) AS r,
SUM(CASE rating
	WHEN 'PG' THEN 1
	ELSE 0
END) AS pg,
SUM(CASE rating
	WHEN 'PG-13' THEN 1
	ELSE 0
END) AS pg13
FROM film;