WITH t1 AS (SELECT customer_id, order_id, order_date, RANK() OVER(PARTITION BY customer_id ORDER BY order_date DESC) RK
            FROM Orders)
SELECT c.name customer_name, t1.customer_id, t1.order_id, t1.order_date
FROM t1
LEFT JOIN Customers c
USING(customer_id)
WHERE RK <= 3
ORDER BY 1, 2, 4 DESC;
