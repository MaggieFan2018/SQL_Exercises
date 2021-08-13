#ALL 的用法
SELECT DISTINCT order_id
FROM OrdersDetails
GROUP BY order_id
HAVING MAX(quantity) > ALL(SELECT AVG(quantity) FROM OrdersDetails GROUP BY order_id);
