SELECT '[0-5>' bin, COUNT(*) total
FROM Sessions WHERE duration/60 >= 0  AND duration/60 < 5
UNION
SELECT '[5-10>' bin, COUNT(*) total
FROM Sessions WHERE duration/60 >= 5  AND duration/60 < 10
UNION
SELECT '[10-15>' bin, COUNT(*) total
FROM Sessions WHERE duration/60 >= 10  AND duration/60 < 15
UNION
SELECT '15 or more' bin, COUNT(*) total
FROM Sessions WHERE duration/60 >= 15;  
