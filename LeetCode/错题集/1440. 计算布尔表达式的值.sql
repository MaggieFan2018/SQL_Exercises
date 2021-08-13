SELECT e.*, CASE WHEN operator = '>' AND l.value > r.value THEN 'true'
                 WHEN operator = '=' AND l.value = r.value THEN 'true'
                 WHEN operator = '<' AND l.value < r.value THEN 'true'
                 ELSE 'false'
                 END AS value
FROM Expressions e 
LEFT JOIN Variables l 
ON l.name = e.left_operand
LEFT JOIN Variables R 
ON r.name = e.right_operand;
