# Data Quality Report

## Database Structure

- The SQLite database contains 27 tables
- The `Fires` table was identified as the primary analysis table

## Validation Results

- Total wildfire records: 1,880,465
- Dataset spans 1992–2015
- No issues identified with record count during initial validation

Further validation will assess missing values, duplicate records, and invalid data

## Initial Validation

### Record Count

**Check Performed**

Verified the total number of wildfire records after loading database

**Result**

- Total wildfire records: **1,880,465**

**Conclusion**

The loaded dataset matches the expected size of approximately 1.88 million wildfire records, indicating that the database was imported successfully

### Data Set Year Range

**Check Performed**

Verified the year range of the data after downloading database

**Result**

1992 - 2015; The expected range for this database

**Conclusion**

The data was imported correctly and displays the full range of fires between those years


### Missing Values

**Check Performed**

Verified that the main analytical fields contain no null values.

**Fields Checked**

- FIRE_YEAR
- FIRE_SIZE
- STATE
- STAT_CAUSE_DESCR
- OWNER_DESCR

**Result**

No NULL values were found in any of the primary analytical fields.

**Conclusion**

These fields can be used for trend, geographic, cause, and ownership analyses without additional cleaning.


### Fire Size Validation

**Check Performed**

Reviewed the minimum and maximum recorded fire sizes to identify potentially invalid values.

**Result**

- Minimum fire size: 0.00001 acres
- Maximum fire size: 606,945 acres

**Conclusion**

Although the range is extremely wide, both values are considered plausible for this dataset. No cleaning required.


Missing Values
Containment Dates

A containment date is required to calculate wildfire duration.

Validation:

SELECT
COUNT(*) AS total_fires,
COUNT(CONT_DATE) AS fires_with_containment_date,
COUNT(*) - COUNT(CONT_DATE) AS missing_containment_dates
FROM Fires;

Results:

Metric	Count
Total fires	1,880,465
Fires with containment date	988,934
Missing containment date	891,531

Finding:

Approximately 47% of records do not contain containment dates.

Decision:

Containment duration analysis was treated cautiously and not used as a primary analysis due to incomplete data.

Cause Classification

The dataset includes wildfire cause categories such as:

Lightning
Equipment Use
Smoking
Campfire
Debris Burning
Arson
Miscellaneous
Missing/Undefined

Finding:

Some wildfire records have Missing/Undefined causes.

Decision:

These records were retained because removing them could bias results toward better-documented fires.

Fire Size Validation

The dataset includes fire sizes ranging from:

Minimum:

0.00001 acres

Maximum:

606,945 acres

Fire size values were retained as provided.

Data Limitations
Reporting Differences

Wildfire reporting may vary between agencies and states.

Missing Cause Information

Some fires lack a defined cause classification.

This limits interpretation of cause-based analyses.

Missing Containment Dates

Nearly half of records lack containment dates.

This limits the ability to analyze wildfire duration.

Dataset Time Period

The dataset covers 1992-2015 and does not represent wildfire activity after 2015.

## Problem Log

|Issue|Decision|Reason|
|---|---|---|