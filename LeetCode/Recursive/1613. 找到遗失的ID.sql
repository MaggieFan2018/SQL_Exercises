#考点：recursive
WITH RECURSIVE t1 AS (SELECT 1 as n
                      UNION ALL
                      SELECT n + 1
                      FROM t1
                      WHERE n < 100)
SELECT n AS ids
FROM t1
WHERE n NOT IN (SELECT customer_id FROM Customers)
AND n <= (SELECT MAX(customer_id) FROM Customers);
