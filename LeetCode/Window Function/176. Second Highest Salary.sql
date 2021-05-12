#get the Nth highest salary
SELECT MAX(Salary) SecondHighestSalary
FROM (SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS row_num
     FROM Employee) t1
WHERE row_num = 2;   #or N for Nth highest
