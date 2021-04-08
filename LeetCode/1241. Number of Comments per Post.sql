# Write your MySQL query statement below
WITH t1 AS (SELECT DISTINCT sub_id
           FROM Submissions
           WHERE parent_id IS NULL),
     t2 AS (SELECT DISTINCT parent_id, COUNT(sub_id) NUM
           FROM (SELECT DISTINCT sub_id, parent_id FROM Submissions) t3
           GROUP BY parent_id
           HAVING parent_id IS NOT NULL)

SELECT t1.sub_id post_id, IFNULL(t2.NUM, 0) number_of_comments
FROM t1
LEFT JOIN t2
ON t1.sub_id = t2.parent_id
ORDER BY t1.sub_id;


#NOTES: 1. To select distinct pairs (a, b) from a table, use: "SELECT DISTINCT a, b FROM XXX"
#       2. In this problem note there are more than 1 pairs of sub_id & parent_id so need to remove duplicates first
