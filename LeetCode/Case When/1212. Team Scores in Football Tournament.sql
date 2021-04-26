#to do: check better solutions

# Write your MySQL query statement below

# the first step is using case when to create the two scores columns
WITH t1 AS (SELECT host_team, guest_team,
                   CASE 
                       WHEN host_goals > guest_goals THEN 3
                       WHEN host_goals < guest_goals THEN 0
                       ELSE 1
                    END AS host_points,
                    CASE 
                       WHEN host_goals > guest_goals THEN 0
                       WHEN host_goals < guest_goals THEN 3
                       ELSE 1
                     END AS guest_points
            FROM Matches),
     t2 AS (SELECT DISTINCT host_team team_id, SUM(host_points) num_points
           FROM t1
           GROUP BY 1
           UNION ALL 
           SELECT DISTINCT guest_team team_id, SUM(guest_points) num_points
           FROM t1
           GROUP BY 1)
           
SELECT t.team_id team_id, t.team_name, IFNULL(t3.num_points, 0) num_points
FROM (SELECT DISTINCT team_id, SUM(num_points) num_points
     FROM t2
     GROUP BY 1) t3
RIGHT JOIN Teams t
ON t3.team_id = t.team_id
ORDER BY num_points DESC, team_id;
