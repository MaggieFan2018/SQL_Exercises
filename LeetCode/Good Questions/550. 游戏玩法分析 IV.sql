SELECT ROUND(COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) fraction
FROM Activity
WHERE (player_id, event_date) IN (SELECT player_id, DATE(MIN(event_date)+1)
                                  FROM Activity
                                  GROUP BY 1);
