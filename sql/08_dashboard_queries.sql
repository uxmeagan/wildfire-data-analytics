/*
===========================================================
Project: US Wildfire Analytics
Purpose: Queries that create the csv's for the dashboard
Author: Meagan Barnhurst
===========================================================
*/

-- kpi summary

SELECT
    COUNT(*) AS total_fires,
    SUM(fire_size) AS total_acres_burned,
    AVG(fire_size) AS avg_fire_size,
    MAX(fire_size) AS largest_fire;


-- Largest Fire Details

SELECT
    FIRE_NAME,
    FIRE_YEAR,
    STATE,
    FIRE_SIZE,
    STAT_CAUSE_DESCR,
    DISCOVERY_DATE
FROM Fires
ORDER BY FIRE_SIZE DESC
LIMIT 1;


-- Fires by Year

SELECT
    FIRE_YEAR,
    COUNT(*) AS num_fires,
    AVG(fire_size) AS avg_fire_size,
    SUM(fire_size) AS acres_burned
FROM Fires
GROUP BY FIRE_YEAR
ORDER BY FIRE_YEAR;


-- Fires by Month

SELECT
    strftime('%m', DISCOVERY_DATE) AS month_number,
    COUNT(*) AS num_fires,
    AVG(fire_size) AS avg_fire_size,
    SUM(fire_size) AS acres_burned
FROM Fires
GROUP BY month_number
ORDER BY month_number;


-- Cause summary

SELECT
    STAT_CAUSE_DESCR,
    COUNT(*) AS num_fires,
    AVG(fire_size) AS avg_fire_size,
    SUM(fire_size) AS acres_burned
FROM Fires
GROUP BY STAT_CAUSE_DESCR
ORDER BY acres_burned DESC;


-- Ownership Summary

SELECT
    OWNER_DESCR,
    COUNT(*) AS num_fires,
    AVG(fire_size) AS avg_fire_size,
    SUM(fire_size) AS acres_burned
FROM Fires
GROUP BY OWNER_DESCR
ORDER BY acres_burned DESC;


-- State Summary

SELECT
    STATE,
    COUNT(*) AS num_fires,
    AVG(fire_size) AS avg_fire_size,
    SUM(fire_size) AS acres_burned
FROM Fires
GROUP BY STATE
ORDER BY acres_burned DESC;


-- Peak month by state 

SELECT
    STATE,
    month_number,
    fire_count
FROM (
    SELECT *,
            RANK() OVER (
                PARTITION BY STATE
                ORDER BY fire_count DESC
            ) AS month_rank
    FROM (
        SELECT
            STATE,
            strftime('%m', DISCOVERY_DATE) AS month_number,
            COUNT(*) AS fire_count
        FROM Fires
        GROUP BY
            STATE,
            month_number
    ) AS state_months
) ranked_months
WHERE month_rank = 1;


-- Fire Locations

SELECT
    LATITUDE,
    LONGITUDE,
    FIRE_SIZE,
    FIRE_YEAR,
    STATE,
    STAT_CAUSE_DESCR
FROM Fires
WHERE FIRE_SIZE >= 1000;


-- Fire Size Class

SELECT
    FIRE_SIZE_CLASS,
    COUNT(*) AS num_fires
FROM Fires
GROUP BY FIRE_SIZE_CLASS
ORDER BY FIRE_SIZE_CLASS;


-- Average Containment Time by Year

SELECT
    FIRE_YEAR,
    AVG(julianday(CONT_DATE) - julianday(DISCOVERY_DATE)) AS avg_containment_days
FROM Fires
WHERE CONT_DATE IS NOT NULL
GROUP BY FIRE_YEAR
ORDER BY FIRE_YEAR;