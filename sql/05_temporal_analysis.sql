/*
===========================================================
Temporal Analysis
Author: Meagan Barnhurst
===========================================================
*/

-----------------------------------------------------------------
-- How does wildfire activity vary by month
-- Number of fires, avg size, and total acreage burned
-----------------------------------------------------------------

SELECT 
	strftime('%m', DISCOVERY_DATE) AS month_number,
	COUNT(*) AS num_of_fires,
	AVG(fire_size) AS avg_fire_size,
	SUM(fire_size) AS acres_burned
FROM Fires
GROUP BY month_number
ORDER BY month_number;


-----------------------------------------------------------------
-- How have wildfire activity and fire severity changed over time
-- Number of fires, avg size, and total acreage burned
-----------------------------------------------------------------

SELECT 
	FIRE_YEAR,
	COUNT(*) AS num_of_fires,
	AVG(fire_size) AS avg_fire_size,
	SUM(fire_size) AS acres_burned
FROM Fires
GROUP BY FIRE_YEAR 
ORDER BY FIRE_YEAR;

-----------------------------
-- Largest fire every year 
-----------------------------

SELECT
    FIRE_YEAR,
    MAX(FIRE_SIZE) AS largest_fire
FROM Fires
GROUP BY FIRE_YEAR
ORDER BY FIRE_YEAR;

---------------------------------------
-- How many fires of each class by year
---------------------------------------

SELECT
    FIRE_YEAR,
    FIRE_SIZE_CLASS,
    COUNT(*) AS fire_count
FROM Fires
GROUP BY 
	FIRE_YEAR,
	FIRE_SIZE_CLASS
ORDER BY 
	FIRE_YEAR,
	FIRE_SIZE_CLASS;



------------------------------------------------------
-- How many fires of each class by month of the year 
------------------------------------------------------

SELECT
	strftime('%m', DISCOVERY_DATE) AS month_number,
    FIRE_SIZE_CLASS,
    COUNT(*) AS fire_count
FROM Fires
GROUP BY 
	month_number,
	FIRE_SIZE_CLASS
ORDER BY 
	month_number,
	FIRE_SIZE_CLASS;