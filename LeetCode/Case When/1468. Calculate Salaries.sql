# Write your MySQL query statement below
WITH t1 AS (SELECT company_id, MAX(salary) max_salary
           FROM Salaries
           GROUP BY 1)

SELECT s.company_id, s.employee_id, s.employee_name, 
       ROUND((CASE WHEN t1.max_salary < 1000 THEN s.salary
            WHEN t1.max_salary between 1000 and 10000 THEN s.salary * (1-0.24)
            ELSE s.salary*(1-0.49)
       END), 0) AS salary
FROM Salaries s
INNER JOIN t1
ON t1.company_id = s.company_id;
