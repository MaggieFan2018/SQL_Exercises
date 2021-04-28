SELECT t1.id p1, t2.id p2, ABS(t1.x_value - t2.x_value)*ABS(t1.y_value - t2.y_value) area
FROM Points t1, Points t2
WHERE ABS(t1.x_value - t2.x_value)*ABS(t1.y_value - t2.y_value) > 0
AND (t1.x_value <> t2.x_value OR t1.y_value  <> t2.y_value)
AND t1.id < t2.id
ORDER BY area DESC, p1, p2;
