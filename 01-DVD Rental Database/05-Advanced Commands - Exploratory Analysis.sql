-- TASK #1
-- During which months did payments occur?

-- Taking a rapid look at the payment table
SELECT *
FROM payment
LIMIT 5;

-- Extracting month data from the payment_date column 
SELECT EXTRACT(MONTH FROM payment_date)
FROM payment;

-- Extracting only the distinct months from payment_date column 
SELECT DISTINCT EXTRACT(MONTH FROM payment_date)
FROM payment;

-- Displaying the months 
SELECT DISTINCT TO_CHAR(payment_date, 'Month')
AS months
FROM payment;



-- TASK #2
-- How many payments occurred on a Monday?

-- First approach: using SELECT COUNT combined with TO_CHAR (longer query)
-- Observation: 'D' represents day of the week, Sunday (1) to Saturday (7) according to the official documentation
SELECT COUNT(TO_CHAR(payment_date, 'D'))
AS mondays_count
FROM payment 
WHERE TO_CHAR(payment_date, 'D') = '2';

-- Second approach: using SELECT COUNT combined with EXTRACT and dow (shorter query)
-- Observation: “dow” stands for “day of week” and returns a numerical output (zero indexing starting at Sunday)
SELECT COUNT(*)
FROM payment 
WHERE EXTRACT(dow FROM payment_date) = 1;