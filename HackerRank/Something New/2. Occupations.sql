#create pivot table
WITH t1 AS (SELECT *, ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS id
           FROM OCCUPATIONS)
SELECT MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
       MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
       MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
       MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM t1
GROUP BY id;
