USE UberDB
Go

SELECT 
    Time_slot,
    COUNT(*) AS total_requests,
    SUM(CASE WHEN status = 'Trip Completed' THEN 1 ELSE 0 END) AS completed,
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled,
    SUM(CASE WHEN status = 'No Cars Available' THEN 1 ELSE 0 END) AS no_cars
FROM 
   [Cleaned_Uber Request Data]
GROUP BY 
    Time_slot;
