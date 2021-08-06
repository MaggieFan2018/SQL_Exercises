# 解题思路：

# 浏览完题目，发现该题的关键在于筛选 购买了 S8 手机却没有购买 iPhone 的买家。

# 把这个条件数学化，就是某个买家购买S8的次数至少为1，购买iPhone的次数为0。

# Solution 1: SUM()

SELECT s.buyer_id
FROM Sales s 
LEFT JOIN Product p 
USING(product_id)
GROUP BY s.buyer_id
HAVING SUM(p.product_name = 'S8') > 0  AND SUM(p.product_name = 'iPhone') = 0;

#Solution 2: COUNT(IF): COUNT 不计入NULL值
SELECT s.buyer_id
FROM Sales s 
LEFT JOIN Product p 
USING(product_id)
GROUP BY s.buyer_id
HAVING COUNT(IF(p.product_name = 'S8', 1, NULL)) > 0  AND COUNT(IF(p.product_name = 'iPhone', 1, NULL)) = 0;
