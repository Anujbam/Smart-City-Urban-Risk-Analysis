USE SmartCityRisk;
GO

-- ============================================
-- SMART CITY & URBAN RISK ANALYSIS
-- SQL ANALYSIS QUERIES
-- ============================================


-- 1. DATA QUALITY CHECK
-- Total records and unique City-Date combinations

SELECT
    COUNT(*) AS TotalRows,
    COUNT(DISTINCT CONCAT(City, Date)) AS UniqueCityDates
FROM dbo.Pollution;


-- 2. AQI RANGE
-- Minimum and maximum AQI

SELECT
    MIN(AQI) AS Min_AQI,
    MAX(AQI) AS Max_AQI
FROM dbo.Pollution;


-- 3. CITY-WISE AVERAGE AQI

SELECT
    City,
    ROUND(AVG(AQI), 2) AS Avg_AQI
FROM dbo.Pollution
GROUP BY City
ORDER BY Avg_AQI DESC;


-- 4. YEAR-WISE AVERAGE AQI

SELECT
    YEAR(Date) AS Year,
    ROUND(AVG(AQI), 2) AS Avg_AQI
FROM dbo.Pollution
GROUP BY YEAR(Date)
ORDER BY Year;


-- 5. CITY + YEAR AVERAGE AQI

SELECT
    City,
    YEAR(Date) AS Year,
    ROUND(AVG(AQI), 2) AS Avg_AQI
FROM dbo.Pollution
GROUP BY
    City,
    YEAR(Date)
ORDER BY
    City,
    Year;


-- 6. AQI RANGE DISTRIBUTION

SELECT
    CASE
        WHEN AQI < 100 THEN 'Below 100'
        WHEN AQI BETWEEN 100 AND 200 THEN '100-200'
        WHEN AQI > 200 THEN 'Above 200'
    END AS AQI_Range,
    COUNT(*) AS Record_Count
FROM dbo.Pollution
GROUP BY
    CASE
        WHEN AQI < 100 THEN 'Below 100'
        WHEN AQI BETWEEN 100 AND 200 THEN '100-200'
        WHEN AQI > 200 THEN 'Above 200'
    END
ORDER BY Record_Count DESC;


-- 7. HIGH AQI DAYS BY CITY
-- AQI greater than 200

SELECT
    City,
    COUNT(*) AS High_AQI_Days
FROM dbo.Pollution
WHERE AQI > 200
GROUP BY City
ORDER BY High_AQI_Days DESC;


-- 8. AVERAGE PM2.5 BY CITY

SELECT
    City,
    ROUND(AVG(PM2_5), 2) AS Avg_PM2_5
FROM dbo.Pollution
GROUP BY City
ORDER BY Avg_PM2_5 DESC;


-- 9. AVERAGE PM10 BY CITY

SELECT
    City,
    ROUND(AVG(PM10), 2) AS Avg_PM10
FROM dbo.Pollution
GROUP BY City
ORDER BY Avg_PM10 DESC;


-- 10. POLLUTION DRIVER SUMMARY

SELECT
    City,
    ROUND(AVG(PM2_5), 2) AS Avg_PM2_5,
    ROUND(AVG(PM10), 2) AS Avg_PM10,
    ROUND(AVG(NO2), 2) AS Avg_NO2,
    ROUND(AVG(CO), 2) AS Avg_CO,
    ROUND(AVG(SO2), 2) AS Avg_SO2,
    ROUND(AVG(O3), 2) AS Avg_O3
FROM dbo.Pollution
GROUP BY City
ORDER BY City;


-- 11. TOP 10 HIGHEST AQI OBSERVATIONS

SELECT TOP 10
    City,
    Date,
    AQI,
    AQI_Bucket,
    PM2_5,
    PM10,
    NO2,
    CO,
    SO2,
    O3
FROM dbo.Pollution
ORDER BY AQI DESC;


-- 12. YEAR-OVER-YEAR AQI CHANGE

WITH YearlyAQI AS
(
    SELECT
        YEAR(Date) AS Year,
        ROUND(AVG(AQI), 2) AS Avg_AQI
    FROM dbo.Pollution
    GROUP BY YEAR(Date)
)
SELECT
    Year,
    Avg_AQI,
    ROUND(
        Avg_AQI - LAG(Avg_AQI) OVER (ORDER BY Year),
        2
    ) AS YoY_Change
FROM YearlyAQI
ORDER BY Year;


-- 13. AQI BUCKET DISTRIBUTION

SELECT
    AQI_Bucket,
    COUNT(*) AS Record_Count
FROM dbo.Pollution
GROUP BY AQI_Bucket
ORDER BY Record_Count DESC;


-- 14. MISSING AQI BUCKET CHECK

SELECT
    COUNT(*) AS MissingAQIBucket
FROM dbo.Pollution
WHERE AQI_Bucket IS NULL;