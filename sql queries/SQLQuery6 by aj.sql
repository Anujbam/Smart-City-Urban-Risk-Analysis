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
WITH YearlyAQI AS (
    SELECT
        YEAR(Date) AS Year,
        AVG(AQI) AS Average_AQI
    FROM dbo.Pollution
    GROUP BY YEAR(Date)
)
SELECT
    Year,
    ROUND(Average_AQI, 2) AS Average_AQI,
    ROUND(
        Average_AQI
        - LAG(Average_AQI) OVER (ORDER BY Year),
        2
    ) AS AQI_Change
FROM YearlyAQI
ORDER BY Year;