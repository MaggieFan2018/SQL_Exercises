# Write your MySQL query statement below
WITH t1 AS (SELECT country_id, 
            CASE WHEN AVG(weather_state) <= 15 THEN 'Cold'
                 WHEN AVG(weather_state) >= 25 THEN 'Hot'
                 ELSE 'Warm'
            END AS weather_type
            FROM Weather
            WHERE YEAR(day) = '2019' AND MONTH(day) = 11
            GROUP BY 1)
           
SELECT c.country_name country_name, t1.weather_type weather_type
FROM t1
LEFT JOIN Countries c
ON t1.country_id = c.country_id;
