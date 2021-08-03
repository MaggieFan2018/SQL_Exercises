SELECT person1, person2, count(*) AS call_count, SUM(duration) total_duration
FROM (SELECT IF(from_id < to_id, from_id, to_id) person1, 
             IF(from_id < to_id, to_id, from_id) person2,
             duration
      FROM Calls) t1
GROUP BY 1, 2;
