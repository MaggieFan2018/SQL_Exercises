WITH cte AS 
(
	SELECT exam_id, student_id, 
	RANK() OVER(partition by exam_id order by score DESC) AS "high_score",
	RANK() OVER(partition by exam_id order by score) AS "low_score"
	FROM Exam 
)

SELECT *
FROM Student
WHERE student_id NOT IN (SELECT student_id FROM cte WHERE high_score = 1 OR low_score = 1)
AND student_id IN (SELECT student_id FROM Exam)
ORDER BY student_id;
