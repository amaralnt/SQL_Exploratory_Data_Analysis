-- Retrieving new_info table
SELECT *
FROM new_info;

-- Dropping the people column
ALTER TABLE new_info
DROP COLUMN people;

-- Checking the changes in the new_info table
SELECT *
FROM new_info;

-- If I try to run this query again I'll get an Error saying that people column doesn't exist
ALTER TABLE new_info
DROP COLUMN people;

-- To avoid this Error what I can do is add the IF EXISTS clause to the query
ALTER TABLE new_info
DROP COLUMN IF EXISTS people;

-- Now instead of an Error I get a message saying that the ALTER TABLE command was skipped 