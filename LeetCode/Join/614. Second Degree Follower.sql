# Write your MySQL query statement below
#similiar question: manager report to another manager

SELECT f1.follower follower, COUNT(DISTINCT f2.follower) num
FROM follow f1
JOIN follow f2
ON f1.follower = f2.followee
GROUP BY 1;
