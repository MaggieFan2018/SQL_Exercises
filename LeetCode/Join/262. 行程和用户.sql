SELECT Request_at Day, ROUND(SUM(Status <> 'completed')/COUNT(*), 2) 'Cancellation Rate'
FROM 
(
SELECT t.Request_at, t.Status
FROM Trips t
LEFT JOIN Users u 
ON t.Client_Id = u.Users_Id
LEFT JOIN Users u2 
ON t.Driver_Id = u2.Users_Id
WHERE u.Banned = 'No'
AND U2.Banned = 'No'
AND t.Request_at BETWEEN "2013-10-01" AND "2013-10-03"
) t 
GROUP BY 1
ORDER BY 1;
