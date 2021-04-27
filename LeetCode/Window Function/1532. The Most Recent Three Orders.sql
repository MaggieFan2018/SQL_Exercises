# Write your MySQL query statement below
WITH t1 AS (SELECT customer_id, order_id, order_date, 
                   RANK() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS RK
           FROM Orders)
           
SELECT c.name customer_name, t1.customer_id, t1.order_id, t1.order_date
FROM Customers c
RIGHT JOIN t1
ON c.customer_id = t1.customer_id
WHERE t1.RK < 4
ORDER BY customer_name, customer_id, order_date DESC;
