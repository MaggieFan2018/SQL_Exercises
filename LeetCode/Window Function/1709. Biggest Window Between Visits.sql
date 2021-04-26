# Write your MySQL query statement below
SELECT user_id, MAX(windows) AS biggest_window
FROM (SELECT user_id, DATEDIFF(IFNULL(LEAD(visit_date, 1) OVER (PARTITION BY user_id ORDER BY visit_date), '2021-1-1'), visit_date) AS windows
     FROM UserVisits) t1
GROUP BY 1
ORDER BY 1;
