# Write your MySQL query statement below
WITH t1 AS (SELECT i.item_category, 
                   IF(DAYOFWEEK(o.order_date) = 2, quantity, 0) Monday,
                   IF(DAYOFWEEK(o.order_date) = 3, quantity, 0) Tuesday,
                   IF(DAYOFWEEK(o.order_date) = 4, quantity, 0) Wednesday,
                   IF(DAYOFWEEK(o.order_date) = 5, quantity, 0) Thursday,
                   IF(DAYOFWEEK(o.order_date) = 6, quantity, 0) Friday,
                   IF(DAYOFWEEK(o.order_date) = 7, quantity, 0) Saturday,
                   IF(DAYOFWEEK(o.order_date) = 1, quantity, 0) Sunday
            FROM Orders o
            RIGHT JOIN Items i 
            USING(item_id)                  
            )
SELECT item_category Category, IFNULL(SUM(Monday), 0) Monday, IFNULL(SUM(Tuesday), 0) Tuesday, IFNULL(SUM(Wednesday), 0) Wednesday, IFNULL(SUM(Thursday), 0) Thursday, IFNULL(SUM(Friday), 0) Friday, IFNULL(SUM(Saturday), 0) Saturday, IFNULL(SUM(Sunday), 0) Sunday
FROM t1 
GROUP BY 1
ORDER BY 1;
