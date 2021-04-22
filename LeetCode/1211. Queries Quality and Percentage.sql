# Write your MySQL query statement below
WITH t1 AS (SELECT query_name, rating/position AS ratio, 
           CASE WHEN rating < 3 THEN 1 ELSE 0 END AS poor
            FROM Queries)
SELECT query_name, ROUND(AVG(ratio), 2) AS quality, ROUND(AVG(poor)*100, 2) AS poor_query_percentage
FROM t1
GROUP BY 1;
