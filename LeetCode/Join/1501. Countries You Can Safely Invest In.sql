WITH t1 AS (SELECT c.caller_id, c.duration, LEFT(p.phone_number, 3) country_code, c2.name
FROM Calls c
LEFT JOIN Person p
ON c.caller_id = p.id OR c.callee_id = p.id
LEFT JOIN Country c2
ON LEFT(p.phone_number, 3) = c2.country_code)

SELECT name country
FROM (SELECT name, AVG(duration) duration
     FROM t1
     GROUP BY 1) t2
WHERE duration > (SELECT AVG(duration) FROM Calls);
