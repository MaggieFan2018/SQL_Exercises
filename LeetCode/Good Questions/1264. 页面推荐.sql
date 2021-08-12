SELECT DISTINCT page_id recommended_page
FROM Likes
WHERE user_id IN (SELECT user1_id id FROM Friendship WHERE user2_id = 1
                UNION 
                SELECT user2_id id FROM Friendship WHERE user1_id = 1)
AND page_id NOT IN 
(SELECT page_id FROM Likes WHERE user_id = 1);



#SOLUTION 2: IF 代替 UNION 
SELECT DISTINCT page_id recommended_page
FROM Likes
WHERE user_id IN (SELECT IF(user1_id = 1, user2_id, IF(user2_id = 1, user1_id, NULL))
                  FROM Friendship)
AND page_id NOT IN 
(SELECT page_id FROM Likes WHERE user_id = 1);
