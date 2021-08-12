WITH t1 AS (SELECT user1_id u1, user2_id u2 
            FROM Friendship
            UNION ALL
            SELECT user2_id u1, user1_id u2 
            FROM Friendship)
SELECT t1.u1 user_id, l1.page_id page_id, COUNT(*) friends_likes
FROM t1
LEFT JOIN Likes l1
ON l1.user_id = t1.u2
LEFT JOIN Likes l2
ON t1.u1 = l2.user_id AND l2.page_id = l1.page_id
WHERE l2.page_id IS NULL
GROUP BY 1, 2;
