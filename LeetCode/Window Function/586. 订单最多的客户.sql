SELECT customer_number
FROM (SELECT customer_number, RANK() OVER(ORDER BY COUNT(order_number) DESC) RK 
FROM orders
GROUP BY 1) t
WHERE RK = 1;
