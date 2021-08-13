WITH t1 AS (SELECT Wimbledon player_id FROM Championships
            UNION ALL
            SELECT Fr_open FROM Championships
            UNION ALL
            SELECT US_open FROM Championships
            UNION ALL
            SELECT Au_open FROM Championships) 
SELECT t1.player_id, p.player_name, COUNT(*) grand_slams_count
FROM Players p
RIGHT JOIN t1
USING(player_id)
GROUP BY 1;
