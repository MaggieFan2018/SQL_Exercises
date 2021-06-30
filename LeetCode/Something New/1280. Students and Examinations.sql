#takeaway: learn how to use cross join in this case

# Write your MySQL query statement below
SELECT s.student_id, s.student_name, u.subject_name, COUNT(e.subject_name) attended_exams
FROM Students s
CROSS JOIN Subjects u
LEFT JOIN Examinations e
USING(student_id, subject_name)
GROUP BY 1, 3
ORDER BY 1, 3;

