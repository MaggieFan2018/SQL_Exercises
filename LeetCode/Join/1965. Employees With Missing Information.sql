WITH t1 AS (SELECT employee_id FROM Employees
            UNION 
            SELECT employee_id FROM Salaries)
SELECT employee_id FROM t1 WHERE employee_id NOT IN (SELECT employee_id FROM Employees)
UNION
SELECT employee_id FROM t1 WHERE employee_id NOT IN (SELECT employee_id FROM Salaries)ORDER BY 1;
