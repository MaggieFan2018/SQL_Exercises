# Write your MySQL query statement below
WITH t1 AS (SELECT customer_id, 
           SUM(CASE WHEN product_name ='A' THEN 1 
                WHEN product_name ='B' THEN 1 
                WHEN product_name ='C' THEN -1 
                ELSE 0 
           END) AS label
           FROM Orders
           GROUP BY 1)
           
SELECT DISTINCT t2.customer_id customer_id, c.customer_name
FROM (SELECT customer_id
     FROM t1 
     WHERE label > 1) t2
LEFT JOIN Customers c
ON t2.customer_id = c.customer_id
ORDER BY customer_id;
