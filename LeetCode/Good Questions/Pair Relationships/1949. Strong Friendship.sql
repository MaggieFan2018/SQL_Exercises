#列出所有关系对
WITH t1 AS (SELECT * FROM Friendship
           UNION ALL
           SELECT user2_id user1_id, user1_id user2_id
           FROM Friendship),
#此步骤类似于1951. 查询具有最多共同关注者的所有两两结对组
    t2 AS (SELECT a.user1_id, b.user1_id user2_id, COUNT(*) common_friend
           FROM t1 a, t1 b
           WHERE a.user1_id <> b.user1_id AND a.user2_id = b.user2_id
           GROUP BY 1, 2
           HAVING common_friend > 2)
#放回原数据集筛选
SELECT * FROM t2 WHERE (user1_id, user2_id) IN (SELECT * FROM Friendship);
