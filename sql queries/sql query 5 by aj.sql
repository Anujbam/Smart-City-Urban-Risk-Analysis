SELECT
    City,
    ROUND(AVG(AQI), 2) AS Average_AQI
FROM dbo.Pollution
GROUP BY City
ORDER BY Average_AQI DESC;
SELECT
    YEAR(Date) AS Year,
    ROUND(AVG(AQI), 2) AS Average_AQI
FROM dbo.Pollution
GROUP BY YEAR(Date)
ORDER BY Year;
SELECT
    City,
    YEAR(Date) AS Year,
    ROUND(AVG(AQI), 2) AS Average_AQI
FROM dbo.Pollution
GROUP BY City, YEAR(Date)
ORDER BY City, Year;
SELECT
    CASE
        WHEN AQI < 100 THEN 'Below 100'
        WHEN AQI <= 200 THEN '100-200'
        ELSE 'Above 200'
    END AS AQI_Range,
    COUNT(*) AS Days
FROM dbo.Pollution
GROUP BY
    CASE
        WHEN AQI < 100 THEN 'Below 100'
        WHEN AQI <= 200 THEN '100-200'
        ELSE 'Above 200'
    END
ORDER BY Days DESC;
SELECT
    City,
    COUNT(*) AS High_AQI_Days
FROM dbo.Pollution
WHERE AQI > 200
GROUP BY City
ORDER BY High_AQI_Days DESC;
SELECT
    City,
    ROUND(AVG(PM2_5), 2) AS Average_PM2_5
FROM dbo.Pollution
GROUP BY City
ORDER BY Average_PM2_5 DESC;
SELECT
    City,
    ROUND(AVG(PM10), 2) AS Average_PM10
FROM dbo.Pollution
GROUP BY City
ORDER BY Average_PM10 DESC;
