SELECT p.project_id, ROUND(SUM(e.experience_years) / COUNT(p.employee_id), 2) average_years
FROM Project p 
JOIN Employee e
USING(employee_id)
GROUP BY 1;
