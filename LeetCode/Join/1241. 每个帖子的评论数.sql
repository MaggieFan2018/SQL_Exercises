SELECT DISTINCT t1.sub_id post_id, IFNULL(t2.CT, 0) number_of_comments
FROM Submissions t1
LEFT JOIN (SELECT parent_id, COUNT(DISTINCT sub_id) CT
           FROM Submissions
           GROUP BY 1) t2
ON t1.sub_id = t2.parent_id
where t1.parent_id IS NULL
ORDER BY 1;
