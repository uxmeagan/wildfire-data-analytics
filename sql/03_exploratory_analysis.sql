/*
===========================================================
Project: US Wildfire Analytics
Author: Meagan Barnhurst
===========================================================
*/

--------------------------------------------------
-- Wildfire Frequency by Year
--------------------------------------------------

SELECT
    FIRE_YEAR,
    COUNT(*) AS total_fires
FROM Fires
GROUP BY FIRE_YEAR
ORDER BY FIRE_YEAR;

-- Observation:
-- Wildfire frequency fluctuates throughout the study period.
-- The highest number of recorded wildfires occurred in 2006.

--------------------------------------------------
-- Acres Burned by Year
--------------------------------------------------

SELECT
    FIRE_YEAR,
    SUM(FIRE_SIZE) AS total_acres_burned
FROM Fires
GROUP BY FIRE_YEAR
ORDER BY FIRE_YEAR;

-- Observation:
-- Total acres fluctuates throughout timeframe
-- Highest number was in 2015, followed closely by 2006


--------------------------------------------------
-- Average Fire Size by Year
--------------------------------------------------

SELECT
    FIRE_YEAR,
    avg(FIRE_SIZE) AS avg_fire_size
FROM Fires
GROUP BY FIRE_YEAR
ORDER BY FIRE_YEAR;

-- Observation:
-- 2015 was the highest by a decent increment

--------------------------------------------------
-- How Many Fires by Fire Size Class
--------------------------------------------------

SELECT
    FIRE_SIZE_CLASS,
    COUNT(*) AS count_of_fire_class
FROM Fires
GROUP BY FIRE_SIZE_CLASS
ORDER BY FIRE_SIZE_CLASS;

-- Observation:
-- The vast majority (>85%) of fires are small (Size A & B)

-------------------------------------------------------------
-- Fire Cause count, average fire size, and total acres burned
-------------------------------------------------------------

SELECT
	STAT_CAUSE_CODE,
	STAT_CAUSE_DESCR,
	COUNT(*) AS num_fires_by_cause,
	AVG(fire_size) AS avg_fire_size,
	SUM(fire_size) AS acres_burned
FROM Fires
GROUP BY
    STAT_CAUSE_CODE,
    STAT_CAUSE_DESCR
ORDER BY STAT_CAUSE_CODE; 
	
-- Observation:
-- Debris burning is the most common ignition source.
-- Lightning accounts for the greatest total acreage burned.
-- Lightning-caused fires have the largest average fire size




----------------------
-- May not include this look at number of fires by year and cause 
----------------------

SELECT 
	FIRE_YEAR,
	STAT_CAUSE_DESCR,
	COUNT(*) as num_of_fires
FROM Fires
GROUP BY 
	FIRE_YEAR,
	STAT_CAUSE_DESCR
ORDER BY 
	FIRE_YEAR,
	num_of_fires DESC;



    