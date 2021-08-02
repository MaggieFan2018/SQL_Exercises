SELECT ROUND(AVG(IF(order_date = customer_pref_delivery_date, 1, 0))*100, 2) immediate_percentage
FROM Delivery;
