#NOTE: 好友是成对出现的
SELECT ID1 Id, COUNT(*) num
FROM
(
SELECT requester_id ID1, accepter_id ID2
FROM request_accepted
UNION 
SELECT accepter_id ID1, requester_id ID2
FROM request_accepted
) t1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
