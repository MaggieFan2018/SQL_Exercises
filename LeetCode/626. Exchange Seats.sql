# Write your MySQL query statement below
SELECT ROW_NUMBER() OVER (ORDER BY new_id) id, student
FROM (SELECT CASE WHEN id % 2 = 0 THEN id - 1 ELSE id + 1 END AS new_id, student
     FROM seat) t1;
