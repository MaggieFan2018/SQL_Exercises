SELECT t1.name, t2.amount balance
FROM Users t1
JOIN (SELECT account, SUM(amount) amount
FROM Transactions
GROUP BY 1
HAVING amount > 10000) t2
USING(account);
