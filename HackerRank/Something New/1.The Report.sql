SELECT IF(g.Grade < 8, NULL, s.Name), g.Grade, s.Marks
FROM Students s
JOIN Grades g
ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY g.Grade DESC, s.Name;
