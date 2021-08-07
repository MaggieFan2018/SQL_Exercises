SELECT query_name, ROUND(SUM(rating/position)/COUNT(*), 2) quality,
       ROUND(COUNT(IF(rating < 3, 1, NULL))*100 / COUNT(*), 2) poor_query_percentage
FROM Queries
GROUP BY 1;


# #Solution 2: AVG()
# sum（条件） = sum(if(条件,1,0)) 
# avg（条件）相当于sum（if（条件，1，0））/count(全体)
# 进阶
# sum（if（条件，N，0））/count(全体) 可用 N*avg（条件）代替

# 使用bool条件将多个样本判断为0和1，多个0和多个1的平均值就是1在整体中的比例，也即满足条件的样本在整体中的比例。

SELECT query_name, ROUND(AVG(rating/position), 2) quality,
       ROUND(AVG(rating < 3)*100, 2) poor_query_percentage
FROM Queries
GROUP BY 1;
