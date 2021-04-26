# Write your MySQL query statement below
SELECT a.employee_id
FROM Employees a
JOIN Employees b ON a.manager_id = b.employee_id
JOIN Employees c ON b.manager_id = c.employee_id
WHERE a.employee_id != 1 AND (b.manager_id =1 OR c.manager_id = 1);
