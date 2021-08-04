SELECT name
FROM salesperson
WHERE sales_id NOT IN (SELECT o.sales_id
                       FROM orders o 
                       LEFT JOIN company c 
                       USING(com_id)
                       WHERE c.name = 'RED');
