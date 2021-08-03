SELECT a.customer_id, a.product_id, b.product_name
FROM (SELECT customer_id, product_id, RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(*) DESC) RK
FROM Orders
GROUP BY 1,2) a
LEFT JOIN Products b
USING(product_id)
WHERE a.RK = 1;
