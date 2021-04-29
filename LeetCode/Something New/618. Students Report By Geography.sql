#Tag: using window function + case when to generate pivot table
#REFERENCE: https://stackoverflow.com/questions/40101963/can-we-write-case-statement-without-having-else-statement

WITH t1 AS (SELECT *, ROW_NUMBER() OVER (PARTITION BY continent ORDER BY name) id
           FROM student)

SELECT MAX(CASE WHEN continent = 'America' THEN name END) AS America,
       MAX(CASE WHEN continent = 'Asia' THEN name END) AS Asia,
       MAX(CASE WHEN continent = 'Europe' THEN name END) AS Europe
FROM t1
GROUP BY id;
