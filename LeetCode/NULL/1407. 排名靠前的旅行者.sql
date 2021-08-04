SELECT u.name, IFNULL(SUM(r.distance), 0) travelled_distance
FROM Rides r 
RIGHT JOIN Users u 
ON u.id = r.user_id
GROUP BY 1
ORDER BY 2 DESC, 1;
