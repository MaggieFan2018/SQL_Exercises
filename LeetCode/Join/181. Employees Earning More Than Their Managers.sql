SELECT e.Name Employee
FROM Employee e
LEFT JOIN Employee e2
ON e.ManagerId = e2.Id
WHERE e.Salary > e2.Salary;
