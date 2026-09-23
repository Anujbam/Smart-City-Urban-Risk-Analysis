UPDATE dbo.Pollution
SET AQI_Bucket =
    CASE
        WHEN AQI <= 50 THEN 'Good'
        WHEN AQI <= 100 THEN 'Satisfactory'
        WHEN AQI <= 200 THEN 'Moderate'
        WHEN AQI <= 300 THEN 'Poor'
        WHEN AQI <= 400 THEN 'Very Poor'
        WHEN AQI > 400 THEN 'Severe'
    END
WHERE AQI_Bucket IS NULL;