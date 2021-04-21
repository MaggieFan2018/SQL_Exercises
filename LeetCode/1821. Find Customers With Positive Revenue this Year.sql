# Write your MySQL query statement below
SELECT customer_id FROM (SELECT customer_id, SUM(revenue) total
                         FROM Customers
                         WHERE `year` = '2021'
                         GROUP BY customer_id
                         HAVING total > 0) t1;
                         
                         
                         
                         
#notes: When a column name matches a reserved keyword, add `` for the column name.
