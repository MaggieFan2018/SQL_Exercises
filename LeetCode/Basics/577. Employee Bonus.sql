SELECT e.name, b.bonus
FROM Employee e 
LEFT JOIN bonus b
USING(empId)
WHERE b.bonus < 1000 OR b.bonus IS NULL;
