USe UberDB
GO

SELECT
    Pickup_point,
    Time_Slot,
    COUNT(CASE WHEN Status = 'Cancelled' THEN Request_id END) AS Cancelled_Count,
    COUNT(Request_id) AS Total_Requests,
    Cast(Round((COUNT(CASE WHEN Status = 'Cancelled' THEN Request_id END) * 100.0 / COUNT(Request_id)),2) AS DEcimal(5,2)) AS Cancellation_Rate_Percentage
FROM
    [Cleaned_Uber Request Data]
GROUP BY
    Pickup_point,
    Time_Slot
ORDER BY
    Cancellation_Rate_Percentage DESC;