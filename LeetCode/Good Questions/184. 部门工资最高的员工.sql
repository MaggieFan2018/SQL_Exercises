SELECT Department, Employee, Salary
FROM 
(
SELECT d.Name Department, e.Name Employee, e.Salary, RANK() OVER(PARTITION BY d.Name ORDER BY e.Salary DESC) RK 
FROM Employee e 
JOIN Department d 
ON e.DepartmentId = d.Id
) t1
WHERE RK = 1;
