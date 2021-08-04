
#（一）left(day, x)取出day字段中的前x个字符
SELECT LEFT(order_date, 7) month, COUNT(DISTINCT order_id) order_count, COUNT(DISTINCT customer_id) customer_count
FROM Orders
WHERE invoice > 20
GROUP BY 1;

#（二）data_format(day, '%Y-%m') 将时间字段day 转换成yyyy-mm的形式（Y-四位数,y-两位数）
SELECT DATE_FORMAT(order_date, "%Y-%m") month, COUNT(DISTINCT order_id) order_count, COUNT(DISTINCT customer_id) customer_count
FROM Orders
WHERE invoice > 20
GROUP BY 1;
