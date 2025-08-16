SELECT
    Pickup_point,
    request_hour,
    COUNT(Request_id) AS Total_Requests,
    COUNT(CASE WHEN Status IN ('No cars available', 'Cancelled') THEN Request_id END) AS Unmet_Demand_Count,
    CAST(ROUND((COUNT(CASE WHEN Status IN ('No cars available', 'Cancelled') THEN Request_id END) * 100.0 / COUNT(Request_id)), 2) AS DECIMAL(5, 2)) AS Unmet_Demand_Rate_Percentage
FROM
    [Cleaned_Uber Request Data]
GROUP BY
    Pickup_point,
    request_hour

HAVING
    COUNT(Request_id) > 50 -- At least 50 requests in this segment (adjust as needed)
    AND
    (COUNT(CASE WHEN Status IN ('No cars available', 'Cancelled') THEN Request_id END) * 100.0 / COUNT(Request_id)) > 30 -- More than 30% unmet demand (adjust as needed)
ORDER BY
    Unmet_Demand_Rate_Percentage DESC, Total_Requests DESC;