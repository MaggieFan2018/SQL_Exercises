SELECT a.business_id
FROM Events a
LEFT JOIN (SELECT event_type, AVG(occurences) AVG_occurences
           FROM Events
           GROUP BY 1) b 
USING(event_type)
WHERE a.occurences > b.AVG_occurences
GROUP BY 1
HAVING COUNT(*) >=2;
