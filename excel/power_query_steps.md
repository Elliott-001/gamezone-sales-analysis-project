Power Query Documentation
Overview

The cleaned dataset from MySQL was imported into excel using Power Query (via an ODBC connector) for preparation for use in Tableau.

Power Query was used to standardize data types (specifically dates), and also to handle missing values in the data.

Data Source: Cleaned MySQL data

Rows: 20,000+

Columns: 12

Step-by-Step Transformation Process
1) Import and Initial Inspection

Imported table into Power Query via an ODBC connector

Verified row count consistency with MySQL export

2) Data Type Enforcement

Explicitly set data types to prevent calculation errors, specifically the purchase and shipping date columns to prevent errors in computation and visualisation in tableau

3) Handling Missing Values

Filled blank country_code and region values with 'unknown'

Final Output: The transformed dataset was loaded into Tableau for visualisation
