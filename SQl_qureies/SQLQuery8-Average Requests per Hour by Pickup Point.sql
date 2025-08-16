use UberDB;
go

SELECT
    Pickup_point,
    request_hour,
    COUNT(Request_id) AS Average_Requests
FROM
    [Cleaned_Uber Request Data]
GROUP BY
    Pickup_point,
    request_hour
ORDER BY
    Pickup_point,
    request_hour;