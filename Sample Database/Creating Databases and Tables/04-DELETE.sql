-- Exploring the job table
SELECT *
FROM job;

-- Adding a new job
INSERT INTO job(job_name)
VALUES 
('Cowboy');

-- If we check, the new value is the third job 
SELECT *
FROM job;

-- Deleting and returning the rows that were deleted 
DELETE FROM job
WHERE job_name = 'Cowboy'
RETURNING job_id, job_name;

-- Checking the job table 
SELECT *
FROM job;