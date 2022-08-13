-- TASK #1
-- Getting the signup date of the last member

-- Quick look at the members table
SELECT *
FROM cd.members
LIMIT 5;

-- Checking the joindate of the last member (ORDER BY and LIMIT method)
SELECT joindate
FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

-- Checking the joindate of the last member (MAX method)
SELECT MAX(joindate)
FROM cd.members;



-- TASK #2
-- Producing a count of the number of facilities that have a cost to guests of 10 or more

-- Quick look at the facilities table
SELECT *
FROM cd.facilities
LIMIT 5;

-- Counting 
SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost >= 10;



-- TASK #3
-- Producing a list of the total number of slots booked per facility in the month of September 2012

-- Quick look at the bookings table
SELECT *
FROM cd.bookings
LIMIT 5;

-- Filtering out irrelevant columns
SELECT facid, slots
FROM cd.bookings;

-- Grouping SUM of slots per facility ID
SELECT facid, SUM(slots)
FROM cd.bookings
GROUP BY facid; 

-- Adding aliases
SELECT facid, SUM(slots)
AS total_slots
FROM cd.bookings
GROUP BY facid;

-- Adding WHERE conditions to the starttime column
SELECT facid, SUM(slots)
AS total_slots
FROM cd.bookings
WHERE starttime >= '2012-09-01'
AND starttime <= '2012-10-01'
GROUP BY facid;

-- Sorting by SUM of slots in ascending order
SELECT facid, SUM(slots)
AS total_slots
FROM cd.bookings
WHERE starttime >= '2012-09-01'
AND starttime <= '2012-10-01'
GROUP BY facid
ORDER BY SUM(slots) ASC;



-- TASK #3
-- Producing a list of facilities with more than 1000 slots booked

-- Grouping SUM of slots per facility ID
SELECT facid, SUM(slots)
FROM cd.bookings
GROUP BY facid;

-- Adding aliases
SELECT facid, SUM(slots)
AS total_slots
FROM cd.bookings
GROUP BY facid;

-- Using HAVING to filter after performing a GROUP BY statement 
SELECT facid, SUM(slots)
AS total_slots
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000;

-- Sorting by facility ID in ascending order
SELECT facid, SUM(slots)
AS total_slots
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid ASC;



-- TASK #4
-- Producing a list of the start times for bookings for Tennis Courts, for the date '2012-09-21'

-- Checking facilities table
SELECT *
FROM cd.facilities
LIMIT 5;

-- Checking bookings table
SELECT *
FROM cd.bookings
LIMIT 5;

-- Performing an INNER JOIN to create a 'mega table'
SELECT *
FROM cd.facilities
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid;

-- Filtering out the irrelevant columns
SELECT name, starttime
FROM cd.facilities
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid;

-- Selecting only the Tennis Courts facilities (LIKE/ILIKE method)
SELECT name, starttime
FROM cd.facilities
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid
WHERE name LIKE '%Tennis Court%';

-- Selecting only the Tennis Courts facilities (IN method - using the facility ID)
SELECT name, starttime
FROM cd.facilities
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid
WHERE cd.facilities.facid IN (0,1);

-- Adding another WHERE condition with AND to filter the start time
SELECT name, starttime
FROM cd.facilities
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid
WHERE cd.facilities.facid IN (0,1)
AND cd.bookings.starttime >= '2012-09-21'
AND cd.bookings.starttime < '2012-09-22';

-- Sorting by start time in ascending order
SELECT name, starttime
FROM cd.facilities
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid
WHERE cd.facilities.facid IN (0,1)
AND cd.bookings.starttime >= '2012-09-21'
AND cd.bookings.starttime < '2012-09-22'
ORDER BY cd.bookings.starttime ASC;



-- TASK #5
-- Producing a list of the start times for bookings by members named 'David Farrell'

-- Checking bookings table
SELECT *
FROM cd.bookings
LIMIT 5;

-- Checking members table
SELECT *
FROM cd.members
LIMIT 5;

-- Performing an INNER JOIN to create a 'mega table'
SELECT *
FROM cd.bookings
INNER JOIN cd.members
ON cd.bookings.memid = cd.members.memid;

-- Filtering out the irrelevant columns
SELECT firstname, surname, starttime
FROM cd.bookings
INNER JOIN cd.members
ON cd.bookings.memid = cd.members.memid;

-- Filtering with WHERE to only display members named 'David Farrell' 
SELECT firstname, surname, starttime
FROM cd.bookings
INNER JOIN cd.members
ON cd.bookings.memid = cd.members.memid
WHERE firstname = 'David'
AND surname = 'Farrell';

-- Using String Concatenation to create a new column named full_name 
SELECT firstname || ' ' || surname AS full_name, starttime
FROM cd.bookings
INNER JOIN cd.members
ON cd.bookings.memid = cd.members.memid
WHERE firstname = 'David'
AND surname = 'Farrell';

-- Sorting by start time in ascending order
SELECT firstname || ' ' || surname AS full_name, starttime
FROM cd.bookings
INNER JOIN cd.members
ON cd.bookings.memid = cd.members.memid
WHERE firstname = 'David'
AND surname = 'Farrell'
ORDER BY starttime ASC;