SELECT Name 
FROM Employee
WHERE Id IN (SELECT ManagerId
             FROM Employee
             WHERE ManagerId IS NOT NULL
             GROUP BY 1
             HAVING COUNT(Name) >= 5);
