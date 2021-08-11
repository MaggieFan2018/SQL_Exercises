# Write your MySQL query statement below
SELECT DISTINCT p.product_id, IFNULL(p2.new_price, 10) price
FROM Products p 
LEFT JOIN (SELECT product_id, new_price 
           FROM Products 
           WHERE (product_id, change_date) IN (SELECT product_id, MAX(change_date) 
                 FROM Products
                 WHERE change_date <= '2019-08-16'
                 GROUP BY 1)) p2
ON p.product_id = p2.product_id;
