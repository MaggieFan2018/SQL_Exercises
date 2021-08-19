WITH t1 AS (SELECT *, RANK() OVER(PARTITION BY product_id ORDER BY order_date DESC) RK
            FROM Orders) 

SELECT p.product_name, t1.product_id, t1.order_id, t1.order_date
FROM t1 
LEFT JOIN Products p
USING(product_id)
WHERE t1.RK = 1
ORDER BY 1, 2, 3;
