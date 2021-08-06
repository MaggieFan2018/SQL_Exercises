#注意是“仅在”这个时间段，有可能部分商品同时还在别的时间段。简单的方法是直接排除别的时间段的id
SELECT product_id, product_name
FROM Product
WHERE product_id NOT IN (SELECT product_id
                         FROM Sales
                         WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31');
