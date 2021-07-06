SELECT product_id, sum(quantity) total_quantity
FROM Sales
group by 1;
