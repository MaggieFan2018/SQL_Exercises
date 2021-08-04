SELECT machine_id, ROUND(SUM(timestamp * IF(activity_type = 'start', -1, 1)) / COUNT(DISTINCT process_id), 3) processing_time
FROM Activity
GROUP BY 1;
