Use UberDB
Go

SELECT
    Pickup_point,
    Request_hour,
    CAST(ROUND((COUNT(CASE WHEN Status = 'Trip Completed' THEN Request_id END) * 100.0 / COUNT(Request_id)), 2) AS DECIMAL(5, 2)) AS Completion_Rate_Percentage,
    CAST(ROUND((COUNT(CASE WHEN Status = 'No cars available' THEN Request_id END) * 100.0 / COUNT(Request_id)), 2) AS DECIMAL(5, 2)) AS No_Cars_Rate_Percentage,
    CAST(ROUND((COUNT(CASE WHEN Status = 'Cancelled' THEN Request_id END) * 100.0 / COUNT(Request_id)), 2) AS DECIMAL(5, 2)) AS Cancellation_Rate_Percentage
FROM
    [Cleaned_Uber Request Data]
GROUP BY
    Pickup_point,
    Request_hour
ORDER BY
    Pickup_point, Request_hour; -- Order by hour to see the progression through the day