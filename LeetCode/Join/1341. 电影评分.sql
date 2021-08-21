(SELECT u.name results
FROM Movie_Rating m0
JOIN Users u 
USING(user_id)
GROUP BY 1
ORDER BY COUNT(*) DESC, 1
LIMIT 1)
UNION 
(SELECT m.title 
FROM Movies m
JOIN Movie_Rating m2
USING(movie_id)
WHERE LEFT(m2.created_at, 7) = '2020-02'
GROUP BY 1
ORDER BY AVG(rating) DESC, 1
LIMIT 1);
