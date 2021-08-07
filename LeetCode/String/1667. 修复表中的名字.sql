# mysql 字符串函数各种复习
-- CONCAT(str1, str2)：字符连接函数
-- UPPER(str)：将字符串改为大写字母
-- LOWER(str)：将字符串改为小写字母
-- LENGTH(str)：判定字符串长度
-- SUBSTRING(str, a, b):提取字段中的一段，从字符串str的第a位开始提取，提取b个字符
-- LEFT(str, n)：提取字符串最左边的n个字符
-- RIGHT(str, n)：提取字符串最右边的n个字符

#SOLUTION 1: SUBSTRING()
SELECT user_id, CONCAT(UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name, 2))) name
FROM Users
ORDER BY 1;


#SOLUTION 2: LEFT()/RIGHT()
SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(RIGHT(name, LENGTH(name) - 1))) name
FROM Users
ORDER BY 1;
