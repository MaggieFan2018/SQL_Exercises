# Write your MySQL query statement below

SELECT w.name WAREHOUSE_NAME, SUM(t1.VOLUME * w.units) VOLUME
FROM Warehouse w 
JOIN (SELECT product_id, Width*Length*Height AS VOLUME FROM Products) t1
USING(product_id)
GROUP BY 1
ORDER BY 1;
