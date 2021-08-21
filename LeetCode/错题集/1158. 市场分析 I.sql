SELECT u.user_id buyer_id, u.join_date, SUM(IF(LEFT(o.order_date, 4) = '2019', 1, 0)) orders_in_2019
FROM Users u 
LEFT JOIN Orders o
ON u.user_id = o.buyer_id
GROUP BY 1;
