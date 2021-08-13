
SELECT s.user_id, ROUND(IFNULL(SUM(c.action = 'confirmed'), 0)/COUNT(*), 2) confirmation_rate
FROM Signups s 
LEFT JOIN Confirmations c 
USING(user_id)
GROUP BY 1;
