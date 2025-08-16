USe UberDB;
GO

SELECT
    Time_Slot,
    COUNT(Request_id) AS Total_Requests,
    COUNT(CASE WHEN Status = 'Trip Completed' THEN Request_id END) AS Completed_Trips,
    CAST(ROUND((COUNT(CASE WHEN Status = 'Trip Completed' THEN Request_id END) * 100.0 / COUNT(Request_id)), 2) AS DECIMAL(5, 2)) AS Completion_Rate_Percentage,
    COUNT(CASE WHEN Status = 'No cars available' THEN Request_id END) AS No_Cars_Available_Count,
    CAST(ROUND((COUNT(CASE WHEN Status = 'No cars available' THEN Request_id END) * 100.0 / COUNT(Request_id)), 2) AS DECIMAL(5, 2)) AS No_Cars_Rate_Percentage,
    COUNT(CASE WHEN Status = 'Cancelled' THEN Request_id END) AS Cancelled_Count,
    CAST(ROUND((COUNT(CASE WHEN Status = 'Cancelled' THEN Request_id END) * 100.0 / COUNT(Request_id)), 2) AS DECIMAL(5, 2)) AS Cancellation_Rate_Percentage
FROM
    [Cleaned_Uber Request Data]
GROUP BY
    Time_Slot
ORDER BY
    CASE Time_Slot
        WHEN 'Early Morning' THEN 1
        WHEN 'Morning' THEN 2
        WHEN 'Day' THEN 3
        WHEN 'Evening' THEN 4
        WHEN 'Night' THEN 5
        WHEN 'Late Night' THEN 6
        ELSE 99 -- For any unexpected TimeSlot values, put them at the end
    END;