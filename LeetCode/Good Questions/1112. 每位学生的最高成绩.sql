SELECT student_id, MIN(course_id) course_id, grade
FROM Enrollments
WHERE (student_id, grade) IN (SELECT student_id, MAX(grade) grade
                              FROM Enrollments
                              GROUP BY 1)
GROUP BY 1
ORDER BY 1;
