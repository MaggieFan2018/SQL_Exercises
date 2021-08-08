CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT Salary
      FROM (SELECT DISTINCT Salary, DENSE_RANK() OVER(ORDER BY Salary DESC) RK 
            FROM Employee) t
    WHERE RK = N
      
  );
END
