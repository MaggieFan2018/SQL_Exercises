SELECT sale_date, SUM(sold_num * IF(fruit = 'apples', 1, -1)) diff
FROM Sales
GROUP BY 1
order by 1;
