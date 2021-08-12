#NOTE:不能写作SUM() + SUM(), 需要先求和再SUM()
SELECT SUM(b.apple_count + IFNULL(c.apple_count, 0)) apple_count, SUM(b.orange_count + IFNULL(C.orange_count, 0)) orange_count
FROM Boxes b 
LEFT JOIN Chests c 
USING(chest_id);
