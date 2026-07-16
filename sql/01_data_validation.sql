/*
===========================================================
Data Analysis
Author: Meagan Barnhurst
===========================================================
*/

--------------------------------------------------
-- Explore Database Structure
--------------------------------------------------

-- List all tables in the SQLite database

SELECT name
FROM sqlite_master
WHERE type = 'table'
ORDER BY name;

-- Inspect the structure of the main analysis table


PRAGMA table_info(Fires);

--------------------------------------------------
-- Validate Record Count
--------------------------------------------------

-- Count total wildfire records
SELECT COUNT(*) AS total_fires
FROM Fires;

--------------------------------------------------
-- Validate Year Range
--------------------------------------------------

SELECT
    MIN(FIRE_YEAR) AS first_year,
    MAX(FIRE_YEAR) AS last_year
FROM Fires;

---------------------------------------------------------
-- Find Missing Values in the main columns for analysis
---------------------------------------------------------

SELECT
    COUNT(*) AS total_records,
    COUNT(FIRE_YEAR) AS fire_year_present,
    COUNT(FIRE_SIZE) AS fire_size_present,
    COUNT(STATE) AS state_present,
    COUNT(STAT_CAUSE_DESCR) AS cause_present,
    COUNT(OWNER_DESCR) AS owner_present
FROM Fires;

-- Observation:
-- No null values in the columns selected

---------------------------------------------------------
-- Validate Fire Size Values
---------------------------------------------------------

SELECT 
	MAX(FIRE_SIZE) AS max_fire_size,
	MIN(FIRE_SIZE) AS min_fire_size
FROM Fires;



