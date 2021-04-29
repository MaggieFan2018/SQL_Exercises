#tag: dense_rank()
#helpful link about SQL ranking functions: https://www.geeksforgeeks.org/mysql-ranking-functions/

WITH t1 AS (SELECT DepartmentId, Name, Salary, DENSE_RANK() OVER(PARTITION BY DepartmentId ORDER BY Salary DESC)
            RK
            FROM Employee)
            
SELECT d.Name AS Department, t1.Name AS Employee, t1.Salary
FROM Department d
JOIN t1
ON t1.DepartmentId = d.Id
WHERE RK <= 3;
