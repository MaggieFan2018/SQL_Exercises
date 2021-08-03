SELECT a.product_id product_id, ROUND(SUM(a.price * b.units)/SUM(b.units), 2) average_price
FROM Prices a
JOIN UnitsSold b
ON a.product_id = b.product_id
AND (b.purchase_date BETWEEN a.start_date AND a.end_date)
GROUP BY 1;
