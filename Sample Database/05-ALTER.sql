-- Creating a new table
CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(50) NOT NULL UNIQUE
)

-- Checking the new table 
SELECT *
FROM information;

-- Renaming the table 
ALTER TABLE information
RENAME TO new_info;

-- If I try to retrieve the table by its old name I'll get an error, since the information table doesn't exist anymore
SELECT *
FROM information;

-- Using the new name
SELECT *
FROM new_info;

-- Renaming just a column
ALTER TABLE new_info 
RENAME COLUMN person TO people;

-- Checking the changes 
SELECT *
FROM new_info;

-- Inserting data (Error example)
INSERT INTO new_info(title)
VALUES
('example title');

-- The previous query generates an error regarding not null constraint violation
-- One way around this error would be to add in people and then add a value for it
-- The other solution is to remove this not null constraints (permanently affects the entire table)

-- Altering constraints 
ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL;

-- To add constraints use SET
-- To remove constraints use DROP

-- Inserting data (Working example)
INSERT INTO new_info(title)
VALUES
('example title');

-- Checking the changes 
SELECT *
FROM new_info;