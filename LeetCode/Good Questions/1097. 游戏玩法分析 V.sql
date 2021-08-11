WITH t1 AS (SELECT player_id, MIN(event_date) install_dt
            FROM Activity
            GROUP BY 1), 
     t2 AS (SELECT t1.*, a.event_date
            FROM t1
            LEFT JOIN Activity a 
            ON t1.player_id = a.player_id
            AND t1.install_dt + 1 = a.event_date)
SELECT install_dt, COUNT(*) installs, ROUND(COUNT(event_date)/COUNT(*), 2) Day1_retention
FROM t2
GROUP BY 1;
