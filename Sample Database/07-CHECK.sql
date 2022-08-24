-- Creating a new table
CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK (birthdate > '1900-01-01'),
	hire_date DATE CHECK (hire_date > birthdate),
	salary INTEGER CHECK (salary > 0)
)

-- Inserting data into this table
INSERT INTO employees(
	first_name,
	last_name,
	birthdate,
	hire_date,
	salary
)
VALUES
('Natan',
 'Amaral',
 '1000-06-02',
 '2022-12-11',
 40000
)

-- The previous query generates an Error
-- That's because the employees_birthdate constraint is being violated 

-- Correcting the birthdate
INSERT INTO employees(
	first_name,
	last_name,
	birthdate,
	hire_date,
	salary
)
VALUES
('Natan',
 'Amaral',
 '2000-06-02',
 '2022-12-11',
 40000
)

-- Adding another employee
INSERT INTO employees(
	first_name,
	last_name,
	birthdate,
	hire_date,
	salary
)
VALUES
('Anastasia',
 'Koval',
 '2000-11-11',
 '2022-12-11',
 -40000
)

-- The previous query generates an Error
-- This time is because the salary constraint is being violated

-- Correcting the salary
INSERT INTO employees(
	first_name,
	last_name,
	birthdate,
	hire_date,
	salary
)
VALUES
('Anastasia',
 'Koval',
 '2000-11-11',
 '2022-12-11',
 40000
)

-- Checking the changes made
SELECT *
FROM employees;

-- Notice that the serial kept the count of those failed attempts to insert
-- Let you know that rows were either removed or INSERT commands failed before and after 'Natan'