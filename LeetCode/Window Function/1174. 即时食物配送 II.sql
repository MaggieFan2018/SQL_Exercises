WITH t1 AS (SELECT customer_id, order_date, customer_pref_delivery_date, 
            RANK() OVER (PARTITION BY customer_id ORDER BY order_date) RK
            FROM Delivery)
SELECT ROUND(AVG(customer_pref_delivery_date = order_date)*100, 2) immediate_percentage
FROM t1
WHERE RK = 1;
