# Write your MySQL query statement below
SELECT q.*, IFNULL(n.npv, 0) npv
FROM Queries q
LEFT JOIN NPV n
ON q.id = n.id
AND q.year = n.year
ORDER BY id;
