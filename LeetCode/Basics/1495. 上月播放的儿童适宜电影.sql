SELECT DISTINCT c.title 
FROM TVProgram t 
LEFT JOIN Content c 
USING(content_id)
WHERE DATE_FORMAT(t.program_date, '%Y-%m') = '2020-06'
AND c.Kids_content = 'Y'
AND c.content_type = 'Movies';
