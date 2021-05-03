SELECT t1.employee_id, t1.name, COUNT(t2.employee_id) reports_count, ROUND(AVG(t2.age), 0) average_age
FROM Employees t1
LEFT JOIN Employees t2
ON t1.employee_id = t2.reports_to
WHERE t2.reports_to IS NOT NULL
GROUP BY 1
ORDER BY employee_id;
