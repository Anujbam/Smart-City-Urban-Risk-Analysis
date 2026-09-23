# Smart City & Urban Risk Analysis

## Project Overview

This project analyzes air pollution and Air Quality Index (AQI) trends across five major Indian cities:

- Delhi
- Mumbai
- Bengaluru
- Chennai
- Lucknow

The project uses SQL Server for data cleaning and analysis and Power BI for interactive visualization and dashboard development.

## Objectives

- Analyze AQI levels across different cities
- Study yearly AQI trends
- Identify cities with frequent high-AQI days
- Analyze major air pollution indicators such as PM2.5 and PM10
- Understand AQI category distribution
- Build an interactive Power BI dashboard

## Tools & Technologies

- SQL Server
- SQL
- Power BI
- Python
- GitHub
- CSV

## Dataset

The analysis uses daily air-quality observations containing AQI and multiple pollutant measurements.

The final analysis dataset contains:

- 10,045 records
- 5 cities
- Daily observations
- 10 selected analytical columns

## Key Analysis

The project includes:

1. City-wise Average AQI
2. Year-wise Average AQI
3. City + Year AQI analysis
4. AQI range distribution
5. High AQI days by city
6. Average PM2.5 by city
7. Average PM10 by city
8. Pollution driver analysis
9. Top 10 highest AQI observations
10. Year-over-year AQI change
11. AQI bucket distribution
12. Data quality checks

## Power BI Dashboard

The dashboard provides:

- Average AQI
- Maximum AQI
- Minimum AQI
- Total Records
- City-wise Average AQI
- Year-wise AQI Trend
- AQI Bucket Distribution
- High AQI Days by City
- Average PM2.5 by City
- Average PM10 by City
- City and Year slicers

## Key Findings

- Delhi recorded the highest average AQI among the five analyzed cities.
- Bengaluru recorded the lowest average AQI among the five cities.
- Delhi and Lucknow accounted for most of the observations with AQI above 200.
- PM2.5 and PM10 levels were particularly high in Delhi compared with the other analyzed cities.
- Average AQI showed a declining trend from 2016 to 2020 in the analyzed dataset.

## Conclusion

This project demonstrates an end-to-end data analytics workflow, from data preparation and SQL-based analysis to interactive Power BI visualization.

It combines data cleaning, exploratory analysis, SQL querying, dashboard development, and data storytelling to examine urban air-quality patterns across selected Indian cities.

## Project Structure

```text
Smart-City-Urban-Risk-Analysis/
│
├── data/
│   └── final_pollution_5cities.csv
│
├── sql queries/
│   ├── analysis_queries.sql
│   └── previous SQL query files
│
├── powerbi/
│   └── Smart_City_Urban_Risk_Analysis.pbix
│
└── README.md