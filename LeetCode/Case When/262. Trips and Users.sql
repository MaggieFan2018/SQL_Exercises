#TAKEAWAY: when assign variable names for names contain space need to add quote "".

SELECT Request_at Day, ROUND(AVG(CASE WHEN Status <> 'completed' THEN 1 ELSE 0 END), 2) AS 'Cancellation Rate'
FROM Trips
WHERE Client_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = 'Yes')
AND Driver_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = 'Yes')
AND Request_at BETWEEN "2013-10-01" and "2013-10-03"
GROUP BY 1;
