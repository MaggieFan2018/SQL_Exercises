SELECT contest_id, ROUND(COUNT(DISTINCT user_id)*100/(SELECT COUNT(*) FROM Users), 2) percentage
FROM Register
GROUP BY 1
ORDER BY 2 DESC, 1;
