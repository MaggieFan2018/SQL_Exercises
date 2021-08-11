#window function 解连续性问题
#id - rank(): 如果是连续的，那么差值相同

WITH t1 AS (SELECT *, id - RANK() OVER(ORDER BY id) RK 
            FROM Stadium
            WHERE people >= 100)
SELECT id, visit_date, people 
FROM t1 
WHERE RK IN (SELECT RK FROM t1 GROUP BY 1 HAVING COUNT(*) >= 3)
ORDER BY 2;
