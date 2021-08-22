WITH t1 AS (SELECT visited_on, SUM(amount) amount FROM Customer GROUP BY 1),
     t2 AS (SELECT visited_on, SUM(amount) OVER(ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) amount, ROUND(AVG(amount) OVER(ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) average_amount, ROW_NUMBER() OVER(ORDER BY visited_on) RK
            FROM t1)
SELECT visited_on, amount, average_amount
FROM t2
WHERE RK > 6;
