SELECT Department, Employee, Salary
FROM (SELECT d.Name Department, e.Name Employee, e.Salary, DENSE_RANK() OVER(PARTITION BY d.Name ORDER BY e.Salary DESC) RK 
      FROM Employee e 
      LEFT JOIN Department d
      ON e.DepartmentId = d.Id) t
WHERE RK < 4;
