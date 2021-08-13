WITH t1 AS (SELECT user_id, visit_date, LEAD(visit_date, 1, '2021-01-01') OVER (PARTITION BY user_id ORDER BY visit_date) dt2
            FROM UserVisits)
SELECT user_id, MAX(DATEDIFF(dt2, visit_date)) biggest_window
FROM t1 
GROUP BY 1
ORDER BY 1;
