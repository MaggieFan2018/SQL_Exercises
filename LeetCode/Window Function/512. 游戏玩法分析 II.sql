SELECT player_id, device_id
FROM (SELECT player_id, device_id, RANK() OVER(PARTITION BY player_id ORDER BY event_date) RK
FROM Activity) t1
WHERE RK = 1;
