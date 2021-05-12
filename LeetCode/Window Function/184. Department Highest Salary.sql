SELECT d.Name Department, t.Name Employee, t.Salary
FROM (SELECT *, RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) RK
     FROM Employee) t
JOIN Department d
ON t.DepartmentId = d.Id
WHERE t.RK = 1;
