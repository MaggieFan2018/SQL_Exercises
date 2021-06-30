# Write your MySQL query statement below
WITH t1 AS (SELECT player_id, event_date, RANK() OVER (PARTITION BY player_id ORDER BY event_date) AS rk
            FROM Activity)
SELECT player_id, event_date AS first_login
FROM t1
WHERE rk = 1;
