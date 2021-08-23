#Step 1: 获得所有用户id
WITH t1 AS (SELECT contest_id, gold_medal user_id FROM Contests
           UNION ALL
           SELECT contest_id, silver_medal user_id FROM Contests
           UNION ALL
           SELECT contest_id, bronze_medal user_id FROM Contests), 
#STEP 2: 获得拿三次金牌的用户 
    t2 AS (SELECT gold_medal user_id FROM Contests GROUP BY 1 HAVING COUNT(*) >= 3),
#STEP 3: 获得连续三次拿奖牌的用户
    t3 AS (SELECT a.user_id
           FROM t1 a 
           JOIN t1 b
           ON a.user_id = b.user_id AND b.contest_id = a.contest_id + 1
           JOIN t1 c
           ON c.user_id = a.user_id AND c.contest_id = a.contest_id + 2)
SELECT name, mail
FROM Users
WHERE  user_id IN (SELECT user_id FROM t2
                   UNION 
                   SELECT user_id FROM t3);
