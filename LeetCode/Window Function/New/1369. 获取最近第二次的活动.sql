# SOLUTION 1
WITH t1 AS (SELECT *, ROW_NUMBER() OVER(PARTITION BY username ORDER BY startDate DESC) RK
            FROM UserActivity)
SELECT username, activity, startDate, endDate
FROM t1
WHERE RK = 2
UNION 
SELECT * 
FROM UserActivity
WHERE username IN (SELECT username FROM UserActivity GROUP BY 1 HAVING COUNT(*) = 1);


# SOLUTION 2
WITH t1 AS (SELECT *, ROW_NUMBER() OVER(PARTITION BY username ORDER BY startDate DESC) RK, COUNT(*) OVER(PARTITION BY username) CT 
FROM UserActivity)

SELECT username, activity, startDate, endDate
FROM t1
WHERE CT = 1 OR RK = 2;
