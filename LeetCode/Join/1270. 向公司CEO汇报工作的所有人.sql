SELECT a.employee_id employee_id
FROM Employees a
LEFT JOIN Employees b
ON a.manager_id = b.employee_id
LEFT JOIN Employees c
ON b.manager_id = c.employee_id
LEFT JOIN Employees d
ON c.manager_id = d.employee_id
WHERE a. employee_id <> 1 AND (b.employee_id = 1
OR c.employee_id = 1
OR d.employee_id = 1);
