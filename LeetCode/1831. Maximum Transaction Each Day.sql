# Write your MySQL query statement below
WITH t1 AS (SELECT DATE(day) DATE, MAX(amount) max_amt
            FROM Transactions
            GROUP BY 1)
            
SELECT DISTINCT t.transaction_id 
FROM Transactions t
JOIN t1
ON DATE(t.day) = t1.date AND t.amount = t1.max_amt
ORDER BY 1;
