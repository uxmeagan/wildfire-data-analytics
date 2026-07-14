# Data Dictionary Notes


## Raw Database Structure

The original SQLite database contains 27 tables. These tables include the primary wildfire records table as well as supporting lookup/reference tables.

Initial exploration was performed using:

```sql
SELECT name
FROM sqlite_master
WHERE type='table'
ORDER BY name;