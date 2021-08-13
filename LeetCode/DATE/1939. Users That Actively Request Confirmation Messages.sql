SELECT DISTINCT user_id
FROM Confirmations a
JOIN Confirmations b
USING(user_id)
WHERE a.time_stamp < b.time_stamp
AND TIMESTAMPDIFF(second, a.time_stamp, b.time_stamp) BETWEEN 0 AND 60*60*24;
