WITH t1 AS (SELECT a.post_id, a.action_date, r.remove_date 
           FROM Actions a
           LEFT JOIN Removals r
           ON a.post_id = r.post_id
           WHERE a.action = 'report'
           AND a.extra = 'spam')
SELECT ROUND(SUM(average) / count(action_date), 2) average_daily_percent 
FROM (SELECT action_date, (count(distinct case when remove_date is not null then post_id else null end)/count(distinct post_id))*100 average
FROM t1
GROUP BY 1) t2;
