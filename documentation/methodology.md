# Methodology

## Objective

This project analyzes historical wildfire activity across the United States to identify patterns in wildfire frequency, severity, timing, geographic distribution, and causes.

The goal is to understand:
- When wildfires occur most frequently
- Where wildfire activity and impact are concentrated
- Which causes contribute most to wildfire occurrence and damage
- How wildfire characteristics vary across regions and time periods

---

## Dataset

Source:

Kaggle - 1.88 Million US Wildfires Dataset

Original dataset source:
US Forest Service Fire Program Analysis (FPA)

Time Period:

1992 - 2015

Observations:

1,880,465 wildfire records

Variables:

The dataset contains information about:

- Fire identification
- Discovery and containment dates
- Fire size and size classification
- Geographic location
- State and county information
- Cause classification
- Land ownership
- Reporting agency

---

## Tools Used

Database:
- SQLite

SQL Environment:
- DBeaver

Documentation:
- VS Code

Version Control:
- GitHub

---

## Analysis Process

The project followed these steps:

1. Data exploration
2. Data validation
3. Data quality assessment
4. Exploratory analysis
5. Temporal analysis
6. Cause analysis
7. Geographic analysis
8. Dashboard development

---

# Data Validation

The dataset was reviewed for:

- Total record count
- Available date range
- Missing values
- Invalid categories
- Data ranges
- Duplicate records

Validation checks were performed using SQL queries.

---

# Cleaning Decisions

| Issue | Decision | Reason |
| ----- | -------- | ------ |
| Missing containment dates | Documented as a limitation | Nearly half of records do not contain containment dates, limiting duration analysis |
| Missing/Undefined causes | Retained | Removing these records could introduce bias |
| Original wildfire records | Retained | Analysis focuses on understanding reported wildfire activity |

---

# Analysis Approach

## Temporal Analysis

Examined wildfire activity across:

- Monthly trends
- Yearly trends
- Fire severity trends over time
- Fire size classification patterns

---

## Cause Analysis

Analyzed wildfire causes by:

- Number of fires
- Total acreage burned
- Average fire size
- Yearly leading causes
- Monthly leading causes

---

## Geographic Analysis

Analyzed wildfire patterns by state:

- Number of fires
- Total acreage burned
- Average fire size
- Largest individual fires
- Leading causes by state
- Causes responsible for greatest acreage by state

---

## Limitations

The dataset represents reported wildfire records from 1992-2015.

Potential limitations include:

- Missing or undefined cause classifications
- Missing containment dates
- Differences in reporting practices between agencies
- Analysis is limited to available dataset fields
