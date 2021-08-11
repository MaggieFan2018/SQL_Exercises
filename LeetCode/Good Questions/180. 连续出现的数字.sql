#SOLUTION 1: WINDOW FUNCTION
SELECT DISTINCT num ConsecutiveNums
FROM (SELECT num, LEAD(num, 1) OVER() n2, LEAD(num, 2) OVER() n3
      FROM Logs) t
WHERE t.num = t.n2
AND t.n2 = t.n3;


#solution 2: 自连接
#自连接（自身连接）的本质是把一张表复制出多张一模一样的表来使用。SQL语法：

# select 列名 
# from 表名 as 别名1,表名 as 别名2;

SELECT DISTINCT t1.Num ConsecutiveNums
FROM Logs t1, Logs t2, Logs t3
WHERE t2.Id - t1.Id = 1
AND t3.Id - t2.Id = 1
AND t1.Num = t2.Num 
AND t2.Num = t3.Num;
