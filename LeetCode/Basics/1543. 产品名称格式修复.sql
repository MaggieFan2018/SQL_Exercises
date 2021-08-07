SELECT TRIM(LOWER(product_name)) product_name, DATE_FORMAT(sale_date, '%Y-%m') sale_date, COUNT(sale_date) total
FROM Sales
GROUP BY 1, 2
ORDER BY 1, 2;
