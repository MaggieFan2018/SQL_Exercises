WITH t1 AS (SELECT c.*, c2.name
            FROM Calls c 
            LEFT JOIN Person p 
            ON c.caller_id = p.id  OR c.callee_id = p.id 
            LEFT JOIN Country c2 
            ON c2.country_code = LEFT(p.phone_number, 3))
SELECT name country
FROM
(
SELECT name, AVG(duration) avg_dur
FROM t1 
GROUP BY 1
) t2
WHERE avg_dur > (SELECT AVG(duration) FROM Calls);


# SELECT c.name AS country
# FROM Calls, Person, Country c
# WHERE (caller_id = id OR callee_id = id) AND country_code = LEFT(phone_number, 3)
# GROUP BY country_code
# HAVING AVG(duration) > (SELECT AVG(duration) FROM Calls);
