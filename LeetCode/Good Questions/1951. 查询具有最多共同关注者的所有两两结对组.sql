WITH t1 AS (SELECT a.user_id user1_id, b.user_id user2_id, 
                   RANK() OVER(ORDER BY COUNT(*) DESC) RK
            FROM Relations a, Relations b
            WHERE a.user_id < b.user_id
            AND a.follower_id = b.follower_id
            GROUP BY 1,2)
SELECT user1_id, user2_id
FROM t1
WHERE RK = 1;
