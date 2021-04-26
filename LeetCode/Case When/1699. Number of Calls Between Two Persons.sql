# Write your MySQL query statement below
SELECT CASE WHEN from_id < to_id THEN from_id ELSE to_id END AS person1,
       CASE WHEN from_id > to_id THEN from_id ELSE to_id END AS person2,
            COUNT(*) AS call_count,
            SUM(duration) AS total_duration
FROM Calls
GROUP BY 1, 2;
