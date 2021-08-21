#此题的陷阱在于不能单纯筛出RK <>1 和RK2 <> 1 的学生，因为有的学生在一些exam中排第一但是别的exam中没排第一。因此需要对结果做一个MIN的筛选过滤掉所有得过第一的学生

WITH t1 AS (SELECT exam_id, student_id, RANK() OVER(PARTITION BY exam_id ORDER BY score) RK1, RANK() OVER(PARTITION BY exam_id ORDER BY score DESC) RK2
FROM Exam)

SELECT *
FROM Student
WHERE student_id IN (SELECT student_id FROM t1 GROUP BY 1 HAVING MIN(RK1) <> 1 AND MIN(RK2) <> 1)
ORDER BY student_id;
