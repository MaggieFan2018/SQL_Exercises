SELECT user_id, time_stamp last_stamp
FROM (SELECT user_id, time_stamp, RANK() OVER(PARTITION BY user_id ORDER BY time_stamp DESC) RK
    FROM Logins
    WHERE YEAR(time_stamp) = '2020') t
WHERE RK = 1;
