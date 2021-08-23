WITH t1 AS (SELECT account_id, MONTH(day) mth, SUM(amount) total
            FROM Transactions
            WHERE type = 'Creditor'
            GROUP BY 1, 2),
    t2 AS (SELECT t1.account_id, t1.mth - ROW_NUMBER() OVER(PARTITION BY t1.account_id ORDER BY t1.mth) RES
           FROM t1 
           JOIN Accounts a 
           ON t1.account_id = a.account_id AND a.max_income < t1.total)
SELECT DISTINCT account_id
FROM t2
GROUP BY account_id, RES
HAVING COUNT(*) >= 2;
