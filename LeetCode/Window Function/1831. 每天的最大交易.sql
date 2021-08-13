SELECT transaction_id
FROM
(
SELECT *, DATE(day) dt, RANK() OVER(PARTITION BY DATE(day) ORDER BY amount DESC) RK 
FROM Transactions
) t 
WHERE RK = 1
ORDER BY 1;
