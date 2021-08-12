SELECT person_name
FROM (SELECT person_name, turn, SUM(weight) OVER(ORDER BY turn) sum_wt
      FROM Queue) t 
WHERE sum_wt <= 1000
ORDER BY turn DESC
LIMIT 1;
