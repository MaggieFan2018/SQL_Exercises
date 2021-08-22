SELECT DISTINCT f.user1_id, f.user2_id
FROM Friendship f 
JOIN Listens l1 ON l1.user_id = f.user1_id
JOIN Listens l2 ON l2.user_id = f.user2_id AND l2.day = l1.day AND l2.song_id = l1.song_id
GROUP BY f.user1_id, f.user2_id, l1.day
HAVING COUNT(DISTINCT l1.song_id) > 2;
