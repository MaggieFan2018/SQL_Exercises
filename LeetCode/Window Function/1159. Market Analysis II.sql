#idea: first extract the 2nd order then join users table ("If a user sold less than two items, report the answer for that user as no." this can be asily met if the joined brand value is null)
WITH t1 AS (SELECT seller_id, item_brand
            FROM (SELECT o.seller_id, RANK() OVER (PARTITION BY seller_id ORDER BY order_date) AS RK, i.item_brand
           FROM Orders o
           LEFT JOIN Items i
           USING(item_id)) t0
            WHERE RK = 2)
            
SELECT u.user_id seller_id, CASE WHEN u.favorite_brand = t1.item_brand THEN 'yes' ELSE 'no' END AS 2nd_item_fav_brand
FROM Users u
LEFT JOIN t1
ON u.user_id = t1.seller_id
ORDER BY 1;
