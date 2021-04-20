# Write your MySQL query statement below
WITH t1 AS (SELECT customer_id, MONTH(order_date) AS month, SUM(quantity * price) AS total_price
            FROM Orders o
            LEFT JOIN Product p
            ON o.product_id = p.product_id
            WHERE YEAR(o.order_date) = "2020"
            GROUP BY 1, 2
            HAVING ((month = 6 AND total_price >= 100) OR (month = 7 AND total_price >= 100)))
            
SELECT t1.customer_id, name
FROM t1
LEFT JOIN Customers c
ON  t1.customer_id = c.customer_id
GROUP BY 1
HAVING COUNT(t1.month) = 2
