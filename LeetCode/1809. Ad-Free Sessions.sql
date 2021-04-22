# Write your MySQL query statement below
WITH t1 AS (SELECT p.session_id session_id, a.timestamp T_time
            FROM Playback p
            JOIN Ads a
            ON p.customer_id = a.customer_id
           AND a.timestamp BETWEEN p.start_time AND p.end_time)
           
            
SELECT session_id FROM Playback
WHERE session_id NOT IN (SELECT DISTINCT session_id FROM t1);
