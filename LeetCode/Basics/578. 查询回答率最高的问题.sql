SELECT question_id survey_log
FROM survey_log
GROUP BY 1
ORDER BY SUM(action = 'answer')/1 DESC
LIMIT 1;
