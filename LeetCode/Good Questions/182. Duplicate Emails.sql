#Method 1: subquery
# SELECT Email 
# FROM (SELECT DISTINCT Email, COUNT(Email) AS CT
#       FROM Person
#       GROUP BY 1) t1
# WHERE CT > 1;

#Method 2: no subquery (more effective)
SELECT Email
FROM Person
GROUP BY Email
HAVING COUNT(Email) > 1;





# [举一反三】

# 本题也可以拓展为：找出重复出现n次的数据。只需要改变having语句中的条件即可：

# select 列名
# from 表名
# group by 列名
# having count(列名) > n;
