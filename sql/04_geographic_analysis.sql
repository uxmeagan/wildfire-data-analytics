/*
===========================================================
Geographical Analysis
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


---------------------------------
-- Number one cause of fires in each state
---------------------------------

SELECT
    STATE,
    STAT_CAUSE_DESCR,
    FIRE_COUNT
FROM (
	SELECT *,
		RANK() OVER (
		PARTITION BY STATE
	ORDER BY fire_count DESC
			) AS cause_rank_by_state
	FROM (
		SELECT 
			STATE,
			COUNT(*) AS fire_count,
			STAT_CAUSE_DESCR
		FROM Fires
		GROUP BY 
			STATE,
			STAT_CAUSE_DESCR 
		ORDER BY 
			STATE,
			fire_count DESC
	) AS state_causes
) AS ranked_causes
WHERE cause_rank_by_state = 1;

-- Observation:
-- The leading wildfire cause varies by state. Lightning is the most common ignition source across much
-- of the western United States, while Debris Burning is the leading cause in many eastern and southern states.


----------------------------------
-- Cause of most acreage burned by state
----------------------------------

SELECT
    STATE,
    STAT_CAUSE_DESCR,
    acres_burned
FROM (
	SELECT     
		STATE,
		STAT_CAUSE_DESCR,
        acres_burned,
		RANK() OVER (
		PARTITION BY STATE
	ORDER BY acres_burned DESC
			) AS cause_rank_by_state
	FROM (
		SELECT 
			STATE,
			sum(fire_size) AS acres_burned,
			STAT_CAUSE_DESCR
		FROM Fires
		GROUP BY 
			STATE,
			STAT_CAUSE_DESCR
	) AS state_causes
) AS ranked_causes
WHERE cause_rank_by_state = 1;

-- Observation:
-- Lightning was responsible for the greatest acreage burned across most western states, highlighting its association
-- with the largest and most destructive wildfires.
--
-- Several eastern states differed, with Arson responsible for the greatest total acreage burned despite not always
-- being the most frequent ignition source.

----------------------------------
-- Largest Fires by State
----------------------------------

SELECT 
	STATE,
	MAX(fire_size) AS largest_fire_acres
FROM Fires
GROUP BY STATE
ORDER BY largest_fire_acres DESC;

-- Observation:
-- The largest individual wildfires occurred primarily in western states, with Alaska, Oregon, and Arizona recording the largest single events.
-- This highlights that wildfire severity is concentrated in specific regions even when total fire frequency is lower.


--------------------------------
-- Number one fire by state
--------------------------------
SELECT
    STATE,
    FIRE_NAME,
    FIRE_YEAR,
    FIRE_SIZE
FROM (
    SELECT *,
        RANK() OVER (
        PARTITION BY STATE
        ORDER BY FIRE_SIZE DESC
        ) AS fire_rank
    FROM Fires
) AS ranked_fires
WHERE fire_rank = 1
ORDER BY STATE;