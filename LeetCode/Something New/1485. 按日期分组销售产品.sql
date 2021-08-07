# GROUP_CONCAT(expr) 函数会从 expr 中连接所有非 NULL 的字符串。如果没有非 NULL 的字符串，那么它就会返回 NULL。语法如下：

# 【1】以逗号最为默认的连接字符

# SELECT GROUP_CONCAT(a.REGION_ID) FROM t_region a;

# 连接所有非 NULL 的字符串

# 【2】可以使用 DISTINCT 过滤重复的值，也可以加入 ORDER BY 对值进行排序，还可以使用 SEPARATOR 指定分隔符：

# SELECT GROUP_CONCAT( DISTINCT a.REGION_ID ORDER BY a.REGION_ID DESC SEPARATOR ' ') 
# FROM t_region a;

# 加入 DISTINCT 、 ORDER BY 与 SEPARATOR

# 这里的返回值以过滤了重复值，并且倒序排序，还使用了空格作为分隔符。

SELECT sell_date, COUNT(DISTINCT product) num_sold, GROUP_CONCAT(DISTINCT product) products
FROM Activities
GROUP BY 1;
