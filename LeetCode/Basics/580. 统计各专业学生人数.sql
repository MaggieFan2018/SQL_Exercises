SELECT d.dept_name, COUNT(s.student_id) student_number
FROM department d 
LEFT JOIN student s 
USING(dept_id)
GROUP BY 1
ORDER BY 2 DESC, 1;
