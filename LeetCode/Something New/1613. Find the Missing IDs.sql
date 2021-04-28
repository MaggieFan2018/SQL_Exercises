# Write your MySQL query statement below
WITH RECURSIVE t1 AS (SELECT 1 AS n
                     UNION ALL
                     SELECT n + 1 FROM t1
                     WHERE n < (SELECT MAX(customer_id)
                               FROM Customers))
                               
SELECT n ids
FROM t1 
WHERE n NOT IN (SELECT customer_id FROM Customers)
ORDER BY ids;
