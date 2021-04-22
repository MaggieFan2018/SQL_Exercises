# Write your MySQL query statement below
WITH t1 AS (SELECT stock_name, CASE WHEN operation = 'Buy' THEN -1 ELSE 1 END AS sell, price
            FROM Stocks)
            
SELECT stock_name, SUM(sell*price) AS capital_gain_loss
FROM t1
GROUP BY 1
ORDER BY 1;
