SELECT p.product_name, SUM(o.unit) unit
FROM Orders o 
JOIN Products p
USING(product_id)
WHERE DATE_FORMAT(o.order_date, '%Y-%m') = '2020-02'
GROUP BY 1
HAVING unit >= 100;
