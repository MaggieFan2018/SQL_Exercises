SELECT t2.product_name, t1.year, t1.price
FROM Sales t1
LEFT JOIN Product t2
USING(product_id);
