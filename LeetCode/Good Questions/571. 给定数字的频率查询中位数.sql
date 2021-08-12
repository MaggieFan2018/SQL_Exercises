# 使用sum over(order by ) 对数字个数进行正序和逆序累计，
# 当某一数字的 正序和逆序累计 均大于 整个序列的数字个数的一半 时即为中位数，
# 将最后选定的一个或两个中位数进行求均值即可。

SELECT AVG(Number) median
FROM (SELECT Number, SUM(Frequency) OVER(ORDER BY Number) sum_1,
             SUM(Frequency) OVER(ORDER BY Number DESC) sum_2
      FROM Numbers) t1,
      (SELECT SUM(Frequency) num FROM Numbers) t2
WHERE sum_1 >= num/2 AND sum_2 >= num/2;
