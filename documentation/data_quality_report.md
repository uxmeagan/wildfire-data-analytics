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




## Problem Log

|Issue|Decision|Reason|
|---|---|---|