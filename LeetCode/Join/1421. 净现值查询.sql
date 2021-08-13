SELECT q.id, q.year, ifnull(n.npv, 0) npv
FROM Queries q 
LEFT JOIN NPV n 
ON q.id = n.id
AND q.year = n.year;
