#solution 1: window function
WITH t1 AS (SELECT activity, COUNT(*) CT
            FROM Friends
            GROUP BY 1)
SELECT activity 
FROM (SELECT activity, RANK() OVER(ORDER BY CT) RK1,
            RANK() OVER(ORDER BY CT DESC) RK2
      FROM t1) t2
      WHERE RK1 <> 1 AND RK2 <> 1;


#solution 2: some()/any()
SELECT activity 
FROM Friends
GROUP BY 1
HAVING COUNT(*) > SOME(SELECT COUNT(*) FROM Friends GROUP BY activity)
AND COUNT(*) < SOME(SELECT COUNT(*) FROM Friends GROUP BY activity)
