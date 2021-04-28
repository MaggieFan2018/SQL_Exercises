#tag: create a 7 days moving average


SELECT t1.visited_on, SUM(t2.daily_amt) amount, ROUND(AVG(t2.daily_amt), 2) average_amount
FROM (SELECT visited_on, SUM(amount) aS daily_amt 
      FROM Customer
      GROUP BY 1) t1
JOIN (SELECT visited_on, SUM(amount) aS daily_amt 
      FROM Customer
      GROUP BY 1) t2
ON DATEDIFF(t1.visited_on, t2.visited_on) BETWEEN 0 AND 6
GROUP BY 1
HAVING COUNT(t2.daily_amt) = 7;
