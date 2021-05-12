CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT MAX(Salary) 
      FROM (SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) row_num
            FROM Employee) t1
      WHERE row_num = N
      
  );
END
