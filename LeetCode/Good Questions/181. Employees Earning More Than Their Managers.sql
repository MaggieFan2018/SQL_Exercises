# WITH t1 AS (SELECT e1.Id, e1.Name, e1. Salary AS eSalary, e2.Salary AS mSalary
#             FROM Employee e1 
#             LEFT JOIN Employee e2
#             ON e1.ManagerId = e2.Id)

# SELECT Name Employee
# FROM t1
# WHERE Id NOT in (SELECT Id FROM Employee WHERE ManagerId IS NULL)
# AND eSalary > mSalary;


# more efficient way: use join
SELECT e1.Name Employee
FROM Employee e1
JOIN Employee e2
ON e1.ManagerId = e2.Id
AND e1.Salary > e2.Salary;
