WITH t1 AS (SELECT seller_id, SUM(price) total
            FROM Sales
            GROUP BY 1)
SELECT seller_id
FROM t1
WHERE total = (SELECT MAX(total) FROM t1);
