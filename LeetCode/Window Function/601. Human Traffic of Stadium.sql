#Tag: consecutive rows: solution: window function
SELECT id, visit_date, people
FROM (SELECT id, visit_date, people, LEAD(people, 1) OVER (ORDER BY id) AS nxt,
           LEAD(people, 2) OVER (ORDER BY id) AS nxt2,
           LAG(people, 1) OVER (ORDER BY id) AS prev,
           LAG(people, 2) OVER (ORDER BY id) AS prev2
      FROM Stadium) AS t1
WHERE prev2 >= 100 AND prev >= 100 AND people >= 100
OR prev >= 100 AND nxt >= 100 AND people >= 100
OR people >= 100 AND nxt >= 100 AND nxt2 >= 100
ORDER BY visit_date;
