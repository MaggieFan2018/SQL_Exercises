# Write your MySQL query statement below
SELECT Name
FROM Employee
WHERE Id IN (SELECT ManagerId FROM (SELECT ManagerId, COUNT(DISTINCT Name) sum
           FROM Employee
           GROUP BY 1
           HAVING sum >= 5) t1);
