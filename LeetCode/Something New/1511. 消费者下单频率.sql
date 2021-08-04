SELECT c.customer_id, c.name
FROM Orders o 
LEFT JOIN Product p 
USING(product_id)
LEFT JOIN Customers c 
USING(customer_id)
GROUP BY 1
HAVING SUM(IF(DATE_FORMAT(o.order_date, '%Y-%m') = '2020-06', o.quantity*p.price, 0)) >= 100 AND SUM(IF(DATE_FORMAT(o.order_date, '%Y-%m') = '2020-07', o.quantity*p.price, 0)) >= 100;
