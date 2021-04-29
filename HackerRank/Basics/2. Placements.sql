WITH t1 AS (SELECT s.*, p.salary salary_1
           FROM Students s
           LEFT JOIN Packages p
           USING (ID)),
     t2 AS (SELECT f.*, p.salary salary_2
           FROM Friends f
           LEFT JOIN Packages p
           ON f.Friend_ID = p.ID)
SELECT t1.name
FROM t1
JOIN t2
USING(ID)
WHERE salary_1 < salary_2
ORDER BY salary_2;
