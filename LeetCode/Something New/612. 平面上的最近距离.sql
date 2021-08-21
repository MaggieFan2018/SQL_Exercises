SELECT ROUND(MIN(SQRT(POW(t1.x - t2.x, 2) + POW(t1.y - t2.y, 2))), 2) shortest
FROM point_2d t1, point_2d t2
WHERE (t1.x, t1.y) <> (t2.x, t2.y);
