-- First, taking a look at the account table 
SELECT *
FROM account;

-- The last_login column is null, let's update it

-- Updating
UPDATE account
SET last_login = CURRENT_TIMESTAMP;

-- It doesn't give us an output, so let's retrieve the table again

-- Checking the account table 
SELECT *
FROM account;

-- Making the last_login column match the created_on column
UPDATE account
SET last_login = created_on;

-- Checking the account table 
SELECT *
FROM account;

-- Both columns have now the exact same value, down to the sub second level



-- Updating based off two tables

-- First, taking a look at the job table 
SELECT *
FROM job;

-- Also, taking a look at the account_job table 
SELECT *
FROM account_job;

-- Updating
UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id;

-- Checking the account_job table 
SELECT *
FROM account_job;

-- Checking the account table 
SELECT *
FROM account;

-- Now the created_on date is exactly the same as the hire_date



-- The RETURNING keyword

-- Updating and returning the output
UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email, created_on, last_login;