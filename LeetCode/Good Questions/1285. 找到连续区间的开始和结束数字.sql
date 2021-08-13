WITH t1 AS (SELECT log_id - ROW_NUMBER() OVER(ORDER BY log_id) GRP, log_id
            FROM Logs)
SELECT MIN(log_id) start_id, MAX(log_id) end_id
FROM t1
GROUP BY GRP;
