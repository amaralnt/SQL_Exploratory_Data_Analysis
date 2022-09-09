-- Creating table
CREATE TABLE depts(
	first_name VARCHAR(50),
	department VARCHAR(50)
);

-- Inserting into table
INSERT INTO depts(
	first_name,
	department
)
VALUES
('Vinton','A'),
('Lauren','A'),
('Claire','B');

-- Checking depts table
SELECT *
FROM depts;

-- Calculating ratio between male and female members
SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END) / 
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
) AS department_ratio
FROM depts;

-- Deleting 
DELETE FROM depts
WHERE department = 'B';

-- Checking changes made
SELECT *
FROM depts;

-- Trying to calculate the ratio again
SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END) / 
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
) AS department_ratio
FROM depts;

-- This Error make sense because we are divinding by 0, which is not possible 

-- Using the NULLIF function to get around this Error 
SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END) / 
NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END),0)
) AS department_ratio
FROM depts;

-- Now, instead of getting an Error it's going to return back a null