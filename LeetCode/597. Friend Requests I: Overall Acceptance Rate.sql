# Write your MySQL query statement below
WITH t1 AS (SELECT DISTINCT sender_id, send_to_id
           FROM FriendRequest),
     t2 AS (SELECT DISTINCT requester_id, accepter_id
           FROM RequestAccepted)
           
           
SELECT ROUND(IFNULL((SELECT COUNT(requester_id) FROM t2)/(SELECT COUNT(sender_id) FROM t1), 0.00), 2) AS accept_rate
