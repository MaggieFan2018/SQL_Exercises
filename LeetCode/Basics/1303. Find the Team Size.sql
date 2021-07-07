SELECT t1.employee_id, t2.team_size
FROM Employee t1
LEFT JOIN (SELECT team_id, COUNT(team_id) team_size
FROM Employee
GROUP BY 1) t2
USING(team_id);
