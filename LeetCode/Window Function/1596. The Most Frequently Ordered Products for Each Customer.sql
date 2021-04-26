# Write your MySQL query statement below

#tag: window function
WITH t1 AS (SELECT customer_id, product_id, 
                   RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(product_id) DESC) AS RK
           FROM Orders
           GROUP BY 1, 2)

SELECT t1.customer_id, t1.product_id, p.product_name
FROM t1
LEFT JOIN Products p
ON t1.product_id = p.product_id
WHERE t1.RK = 1;
