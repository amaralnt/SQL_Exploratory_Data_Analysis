-- Checking the account table
SELECT *
FROM account;

-- user_id is SERIAL 
-- last_login don't have any Constraints

-- Inserting into the account table
INSERT INTO account(username, password, email, created_on)
VALUES
('Nathan','password','nathan@gmail.com', CURRENT_TIMESTAMP)

-- Selecting everything from the account table
SELECT *
FROM account;

-- Inserting into the job table
INSERT INTO job(job_name)
VALUES
('Data Scientist')

-- Selecting everything from the job table
SELECT *
FROM job;

-- Adding another job_name to the job table
INSERT INTO job(job_name)
VALUES
('Police Officer')

-- Selecting everything from the job table 
SELECT *
FROM job;

-- Assigning the account to a job
INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(1, 1, CURRENT_TIMESTAMP)

-- Selecting everything from the account_job table 
SELECT *
FROM account_job;

-- Trying to insert someone whose user_id doesn't exist 
INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(10, 10, CURRENT_TIMESTAMP)

-- This previous query generates an error, since it's violating a foreign key constraint

