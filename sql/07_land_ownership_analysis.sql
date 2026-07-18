/*
===========================================================
Land Ownership Analysis
Author: Meagan Barnhurst
===========================================================
*/

-------------------------------------------------------------------------------------
-- Number of fires, Average size of fires, and total acres burned by ownership type
-------------------------------------------------------------------------------------


SELECT 
	OWNER_DESCR, 
	COUNT(*) AS num_fires,
	AVG(fire_size) AS avg_fire_size,
	SUM(fire_size) AS acres_burned
FROM Fires
GROUP BY OWNER_DESCR
ORDER BY num_fires DESC; 


---------------------------------------------
-- Cause of most fires by Ownership type
---------------------------------------------

SELECT 
	OWNER_DESCR,
    STAT_CAUSE_DESCR,
    fire_count
FROM (
	SELECT *,
		RANK() OVER (
		PARTITION BY OWNER_DESCR
	ORDER BY fire_count DESC
			) AS cause_rank
	FROM (
		SELECT 
			OWNER_DESCR,
			STAT_CAUSE_DESCR,
			count(*) AS fire_count
		FROM Fires
		GROUP BY 
			OWNER_DESCR,
			STAT_CAUSE_DESCR 
		ORDER BY 
			OWNER_DESCR,
			STAT_CAUSE_DESCR
	) AS owner_causes
) AS ranked_causes
WHERE cause_rank = 1;


--------------------------------------------------------
-- Cause of biggest fires on average by Ownership type
--------------------------------------------------------

SELECT 
	OWNER_DESCR,
    STAT_CAUSE_DESCR,
    avg_fire_size
FROM (
	SELECT *,
		RANK() OVER (
		PARTITION BY OWNER_DESCR
	ORDER BY avg_fire_size DESC
			) AS cause_rank
	FROM (
		SELECT 
			OWNER_DESCR,
			STAT_CAUSE_DESCR,
			avg(fire_size) AS avg_fire_size
		FROM Fires
		GROUP BY 
			OWNER_DESCR,
			STAT_CAUSE_DESCR 
		ORDER BY 
			OWNER_DESCR,
			STAT_CAUSE_DESCR
	) AS owner_causes
) AS ranked_causes
WHERE cause_rank = 1;


--------------------------------------------------------
-- Cause of most acres burned by Ownership type
--------------------------------------------------------

SELECT 
	OWNER_DESCR,
    STAT_CAUSE_DESCR,
    acres_burned
FROM (
	SELECT *,
		RANK() OVER (
		PARTITION BY OWNER_DESCR
	ORDER BY acres_burned DESC
			) AS cause_rank
	FROM (
		SELECT 
			OWNER_DESCR,
			STAT_CAUSE_DESCR,
			SUM(fire_size) AS acres_burned
		FROM Fires
		GROUP BY 
			OWNER_DESCR,
			STAT_CAUSE_DESCR 
		ORDER BY 
			OWNER_DESCR,
			STAT_CAUSE_DESCR
	) AS owner_causes
) AS ranked_causes
WHERE cause_rank = 1;



--------------------------------------------------
-- Largest fire recorded by each ownership type
--------------------------------------------------

SELECT
    OWNER_DESCR,
    MAX(fire_size) AS largest_fire_acres
FROM Fires
GROUP BY OWNER_DESCR
ORDER BY largest_fire_acres DESC;