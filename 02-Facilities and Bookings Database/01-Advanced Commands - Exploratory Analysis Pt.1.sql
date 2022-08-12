-- TASK #1
-- Printing out a list of all the facilities and their cost to members

-- Quick look at the table
SELECT *
FROM cd.facilities 
LIMIT 5;

-- Selecting the important columns and ordering
SELECT name, membercost
FROM cd.facilities 
ORDER BY membercost ASC;



-- TASK #2
-- Producing a list of facilities that charge a fee to members

-- Filtering
SELECT name, membercost
FROM cd.facilities
WHERE membercost > 0;

-- An alternative would be to use the != operator 
SELECT name, membercost
FROM cd.facilities
WHERE membercost != 0;

-- Sorting by membercost in ascending order
SELECT name, membercost
FROM cd.facilities
WHERE membercost > 0
ORDER BY membercost ASC;



-- TASK #3
-- Producing a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost

-- Quickly checking the columns in the facilities table
SELECT *
FROM cd.facilities 
LIMIT 5;

-- Filtering only relevant columns
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities;

-- Filtering out the facilities where the membercost is equal to zero
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0;

-- Adding a condition to display only where the membercost is less than 1/50 of the monthlymaintenance 
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0
AND membercost < (monthlymaintenance/50.0);



-- TASK #4
-- Producing a list of all facilities with the word 'Tennis' in their name

-- Using LIKE (case sensitive)
SELECT *
FROM cd.facilities
WHERE name LIKE '%Tennis%';

-- Using ILIKE (case insensitive)
SELECT *
FROM cd.facilities
WHERE name ILIKE '%tennis%';



-- TASK #5
-- Retrieving the details of facilities with ID 1 and 5

-- Using the OR operator
SELECT *
FROM cd.facilities
WHERE facid = 1 OR facid = 5;

-- Using the IN operator
SELECT *
FROM cd.facilities
WHERE facid IN (1,5);



-- TASK #6
-- Produce a list of members who joined after the start of September 2012

-- Quick look at the members table
SELECT *
FROM cd.members 
LIMIT 5;

-- Filtering out the irrelevant columns 
SELECT memid, surname, firstname, joindate
FROM cd.members;

-- Filtering the joindate column
SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-09-01';



-- TASK #7
-- Producing an ordered list of the first 10 surnames in the members table (without duplicates)

-- Checking the table
SELECT *
FROM cd.members 
LIMIT 5;

-- Selecting the distinct surnames
SELECT DISTINCT(surname)
FROM cd.members;

-- Sorting by surname in ascending order
SELECT DISTINCT(surname)
FROM cd.members
ORDER BY surname ASC;

-- Limiting to only the first 10
SELECT DISTINCT(surname)
FROM cd.members
ORDER BY surname ASC
LIMIT 10;

-- Removing 'GUEST'
SELECT DISTINCT(surname)
FROM cd.members
WHERE surname != 'GUEST'
ORDER BY surname ASC
LIMIT 10;