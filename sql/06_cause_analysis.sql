/*
===========================================================
Cause Analysis
Author: Meagan Barnhurst
===========================================================
*/

-------------------------------------------------
-- Cause of fires by ranked 
--------------------------------------------------

-- by total acreage burned

SELECT 
	STAT_CAUSE_DESCR,
	COUNT(*) AS num_of_fires,
	AVG(fire_size) AS avg_fire_size,
	SUM(fire_size) AS acres_burned
FROM Fires
GROUP BY STAT_CAUSE_DESCR
ORDER BY acres_burned DESC;

-- by average size of fire

SELECT 
	STAT_CAUSE_DESCR,
	COUNT(*) AS num_of_fires,
	AVG(fire_size) AS avg_fire_size,
	SUM(fire_size) AS acres_burned
FROM Fires
GROUP BY STAT_CAUSE_DESCR
ORDER BY avg_fire_size DESC;

-- Observation:
-- Lightning-caused wildfires account for the greatest total acreage burned despite not being the most
-- frequent ignition source.
-- Debris burning is the most common ignition source, but generally results in smaller fires.

-------------------------------------------
-- Number 1 cause of fires each year
-------------------------------------------

SELECT 
	FIRE_YEAR,
	STAT_CAUSE_DESCR,
	FIRE_COUNT
FROM (
	SELECT *,
		RANK() OVER (
		PARTITION BY FIRE_YEAR
	ORDER BY fire_count DESC
			) AS cause_rank
	FROM (
		SELECT
            FIRE_YEAR,
            STAT_CAUSE_DESCR,
            COUNT(*) AS fire_count
        FROM Fires
        GROUP BY
            FIRE_YEAR,
            STAT_CAUSE_DESCR
	) AS yearly_causes
) AS ranked_causes
WHERE cause_rank = 1;


-- Observation:
-- Debris Burning was the leading reported wildfire cause in 21 of the 24 years included in the dataset.
--
-- Lightning was the leading cause in 1994 and 2003, while Miscellaneous was the leading cause in 2008.
-- These three years differ from the overall pattern and may warrant additional investigation.

---------------------------------------------
-- Cause of the most acreage burned by year 
---------------------------------------------

SELECT 
	FIRE_YEAR,
	STAT_CAUSE_DESCR,
	acres_burned
FROM (
	SELECT *,
		RANK() OVER (
		PARTITION BY FIRE_YEAR
        ORDER BY acres_burned DESC
			) AS cause_rank
	FROM (
        SELECT
            FIRE_YEAR,
            STAT_CAUSE_DESCR,
			SUM(fire_size) AS acres_burned
        FROM Fires
        GROUP BY
            FIRE_YEAR,
            STAT_CAUSE_DESCR
	) AS yearly_causes_acres
) AS ranked_causes
WHERE cause_rank = 1;

-- Observation:
-- Lightning is the leading cause of the highest acres burned every year 1992-2015
-- The amount burned varies substantially between less than 1 million to over 8 million 

---------------------------------------------
-- Largest average fire size by year
---------------------------------------------


SELECT 
	FIRE_YEAR,
	STAT_CAUSE_DESCR,
	avg_fire_size
FROM (
	SELECT *,
		RANK() OVER (
		PARTITION BY FIRE_YEAR
        ORDER BY avg_fire_size DESC
			) AS cause_rank
	FROM (
        SELECT
            FIRE_YEAR,
            STAT_CAUSE_DESCR,
			AVG(fire_size) AS avg_fire_size
        FROM Fires
        GROUP BY
            FIRE_YEAR,
            STAT_CAUSE_DESCR
	) AS yearly_causes
) AS ranked_causes
WHERE cause_rank = 1;

-- Observation:
-- Lightning produced the largest average wildfire size in most years of the dataset.
--
-- From 1999 through 2015, lightning was the leading cause in every year by average fire size.
--
-- Earlier years showed occasional exceptions where Powerline, Structure, or Missing/Undefined fires
-- had the largest average size.



---------------------------------
-- Fire count by year and cause 
---------------------------------

SELECT
    FIRE_YEAR,
    STAT_CAUSE_DESCR,
    COUNT(*) AS fire_count
FROM Fires
GROUP BY
    FIRE_YEAR,
    STAT_CAUSE_DESCR
ORDER BY
    FIRE_YEAR,
    STAT_CAUSE_DESCR;

    