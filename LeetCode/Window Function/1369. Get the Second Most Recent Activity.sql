WITH t1 AS (SELECT *, RANK() OVER (PARTITION BY username ORDER BY startDate DESC) RK
           FROM UserActivity)
SELECT username, activity, startDate, endDate
FROM t1
WHERE RK = 2
UNION 
SELECT *
FROM UserActivity
WHERE username NOT IN (SELECT username FROM t1 WHERE RK > 1);
