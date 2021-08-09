SELECT project_id, employee_id
FROM 
(
SELECT p.project_id, p.employee_id, e.experience_years, RANK() OVER(PARTITION BY p.project_id ORDER BY e.experience_years DESC) RK 
FROM Project p
LEFT JOIN Employee e 
USING(employee_id)
) t
WHERE RK = 1;
