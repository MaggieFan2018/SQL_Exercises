SELECT product_id, year first_year, quantity, price
FROM (SELECT *, RANK() OVER(PARTITION BY product_id ORDER BY year) RK 
FROM Sales) t1
WHERE RK = 1;
