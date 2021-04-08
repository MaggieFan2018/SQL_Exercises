# Write your MySQL query statement below
SELECT TRIM(LOWER(product_name)) product_name, DATE_FORMAT(sale_date, "%Y-%m") sale_date, COUNT(sale_id) total
FROM Sales
GROUP BY 1, 2
ORDER BY 1, 2;


#NOTES:
#1. DATE_FORMAT() : https://www.w3schools.com/sql/func_mysql_date_format.asp
