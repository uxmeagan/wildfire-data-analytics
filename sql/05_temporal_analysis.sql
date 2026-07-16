/*
===========================================================
Project: US Wildfire Analytics
Purpose:
Author: Meagan Barnhurst
===========================================================
*/

-----------------------------------------------------------------
-- How does wildfire activity vary by month?
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
-- How have wildfire activity and fire severity changed over time?
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

