
#Solution 1: window function (COUNT() OVER())
SELECT employee_id, department_id
FROM (SELECT *, COUNT(*) OVER(PARTITION BY employee_id) CNT
      FROM Employee) t
WHERE CNT = 1 OR primary_flag = 'Y';


#Solution 2: UNION 自动去重
SELECT employee_id, department_id
FROM Employee
GROUP BY 1
HAVING COUNT(department_id) = 1
UNION 
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y';
