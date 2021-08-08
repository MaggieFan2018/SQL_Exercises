SELECT p.name, IFNULL(SUM(i.rest), 0) rest, IFNULL(SUM(i.paid), 0) paid, IFNULL(SUM(i.canceled), 0) canceled, IFNULL(SUM(i.refunded), 0) refunded
FROM Invoice i 
RIGHT JOIN Product p 
USING(product_id)
GROUP BY 1
ORDER BY 1;
