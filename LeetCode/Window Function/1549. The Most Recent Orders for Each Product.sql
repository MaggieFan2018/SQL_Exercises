# Write your MySQL query statement below
#window function
#to do: check better solutions
WITH t1 AS (SELECT product_id, order_date, RANK() OVER (PARTITION BY product_id ORDER BY order_date DESC) AS RK, order_id
           FROM Orders)
           
SELECT p.product_name, t1.product_id, t1.order_id, t1.order_date
FROM Products p
RIGHT JOIN t1
ON p.product_id = t1.product_id
WHERE t1.RK = 1
ORDER BY product_name, product_id, order_id;
