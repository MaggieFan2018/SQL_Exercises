SELECT DISTINCT t1.account_id
FROM LogInfo t1, LogInfo t2
WHERE t1.login BETWEEN t2.login AND t2.logout
AND t1.account_id = t2.account_id
AND t1.ip_address <> t2.ip_address;
