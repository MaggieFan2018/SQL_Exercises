#tag: dense_rank()
#helpful link about SQL ranking functions: https://www.geeksforgeeks.org/mysql-ranking-functions/
#here use join, not left join 

SELECT d.Name Department, t.Name Employee, t.Salary
FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) RK
     FROM Employee) t
JOIN Department d
ON t.DepartmentId = d.Id
WHERE t.RK <= 3;
