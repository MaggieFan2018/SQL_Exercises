SELECT a.id p1, b.id p2, abs((a.x_value - b.x_value) * (a.y_value - b.y_value)) area
FROM Points a 
JOIN Points b 
ON a.id <>  b.id AND a.id < b.id
WHERE abs((a.x_value - b.x_value) * (a.y_value - b.y_value)) >0
ORDER BY area DESC, 1, 2;
