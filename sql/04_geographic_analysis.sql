/*
===========================================================
Project: US Wildfire Analytics
Author: Meagan Barnhurst
===========================================================
*/


--------------------------------------------------
-- Wildfire Impact by State
--------------------------------------------------

-- Compares wildfire frequency, average size and acreage burned by state

SELECT 
    STATE,
    COUNT(*) AS num_of_fires,
    AVG(FIRE_SIZE) AS avg_fire_size,
    SUM(FIRE_SIZE) AS acres_burned
FROM Fires
GROUP BY STATE
ORDER BY acres_burned DESC;

-- Observation:
-- Alaska experienced the greatest total acreage burned,
-- despite having fewer wildfire incidents than California and Texas.