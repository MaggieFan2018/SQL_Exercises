SELECT e.employee_id, e.name, COUNT(e2.reports_to) reports_count, ROUND(AVG(e2.age), 0) average_age
FROM Employees e
LEFT JOIN Employees e2 
ON e.employee_id = e2.reports_to
GROUP BY 1
HAVING reports_count <> 0
ORDER BY 1;
