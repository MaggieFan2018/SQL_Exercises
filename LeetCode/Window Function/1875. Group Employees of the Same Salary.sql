SELECT *, DENSE_RANK() OVER(ORDER BY salary) team_id
FROM Employees
WHERE salary NOT IN (SELECT salary FROM Employees GROUP BY 1 HAVING COUNT(*) = 1);
