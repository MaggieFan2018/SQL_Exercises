# Write your MySQL query statement below
SELECT contest_id, ROUND(((COUNT(DISTINCT user_id))/(SELECT COUNT(DISTINCT(user_id)) FROM Users))*100, 2) AS percentage
FROM Register
GROUP BY 1
ORDER BY 2 DESC, 1;
