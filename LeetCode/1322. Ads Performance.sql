# Write your MySQL query statement below
WITH t1 AS (SELECT ad_id, user_id,
           CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END AS clicked,
           CASE WHEN action = 'Viewed' THEN 1 ELSE 0 END AS viewed
           FROM Ads)

SELECT ad_id, 
       CASE WHEN SUM(clicked) + SUM(viewed) = 0 THEN 0.00 ELSE ROUND((SUM(clicked)/(SUM(clicked) + SUM(viewed)))*100, 2) END AS ctr
FROM t1
GROUP BY 1
ORDER BY ctr DESC, ad_id;
           
