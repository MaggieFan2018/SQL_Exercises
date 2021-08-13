#难点：理解清楚同一时刻两个IP的写法：第一个IP的login时间在另一个IP的login和logout之间
SELECT DISTINCT  a.account_id
FROM LogInfo a
LEFT JOIN LogInfo b 
ON a.account_id = b.account_id
AND a.ip_address <> b.ip_address
AND b.login BETWEEN a.login AND a.logout
WHERE b.login IS NOT NULL;
