SELECT
    CAST(ROUND(
        SUM(CASE WHEN Status IN ('No cars available', 'Cancelled') THEN 1 ELSE 0 END) * 1.0 /
        SUM(CASE WHEN Status = 'Trip Completed' THEN 1 ELSE 0 END), 2
    ) AS DECIMAL(5, 2)) AS Unmet_to_Completed_Ratio
FROM
    [Cleaned_Uber Request Data];