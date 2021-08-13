#SOLUTION 1: IF()
WITH t1 AS (SELECT company_id, MAX(salary) msalary
            FROM Salaries
            GROUP BY 1)

SELECT s.company_id, s.employee_id, s.employee_name, ROUND(s.salary*IF(t1.msalary<1000, 1, IF(t1.msalary > 10000, 1 - 0.49, 1 - 0.24)), 0) salary
FROM Salaries s
LEFT JOIN t1 
USING(company_id);

#SOLUTION 2: CASE WHEN()
WITH t1 AS (SELECT company_id, CASE WHEN MAX(salary) < 1000 THEN 1
                                    WHEN MAX(salary) > 10000 THEN 1-0.49
                                    ELSE 1 - 0.24
                                END AS rate
FROM Salaries
GROUP BY 1)

SELECT s.company_id, s.employee_id, s.employee_name, ROUND(s.salary*t1.rate, 0) salary
FROM Salaries s
LEFT JOIN t1 
USING(company_id);
