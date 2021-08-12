# Write your MySQL query statement below
WITH t1 AS (SELECT *, IF(home_team_goals > away_team_goals, 3, IF(home_team_goals = away_team_goals, 1, 0)) AS home_points, IF(home_team_goals < away_team_goals, 3, IF(home_team_goals = away_team_goals, 1, 0)) AS away_points
            FROM Matches), 
     t2 AS (SELECT team_name, home_points points, home_team_goals goal_for, away_team_goals goal_against
            FROM Teams, t1
            WHERE team_id = home_team_id
            UNION ALL
            SELECT team_name, away_points points, away_team_goals goal_for, home_team_goals goal_against
            FROM Teams, t1
            WHERE team_id = away_team_id)

SELECT team_name, COUNT(*) matches_played, SUM(points) points, SUM(goal_for) goal_for, SUM(goal_against) goal_against, SUM(goal_for) - SUM(goal_against) goal_diff
FROM t2
GROUP BY 1
ORDER BY points DESC, goal_diff DESC, team_name;
