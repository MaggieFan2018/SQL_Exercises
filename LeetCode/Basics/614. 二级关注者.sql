SELECT followee follower, COUNT(DISTINCT follower) num
FROM follow
WHERE followee IN (SELECT follower FROM follow)
GROUP BY 1;
