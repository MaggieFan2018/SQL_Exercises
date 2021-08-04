SELECT c.country_name, CASE WHEN t1.temp <= 15 THEN 'Cold'
                            WHEN t1.temp >= 25 THEN 'Hot'
                            ELSE 'Warm'
                            END AS weather_type
FROM (SELECT country_id, AVG(weather_state) temp
FROM Weather
WHERE DATE_FORMAT(day, '%Y-%m') = '2019-11'
GROUP BY 1) t1
LEFT JOIN Countries c
USING(country_id);
