#idea: first use wind fnction to get rank number for the two tables within the period, then use the overall rank and rk in each table to create intervals

WITH t1 AS (SELECT fail_date AS dt, 'failed' AS state, RANK() OVER (ORDER BY fail_date) AS RK
           FROM Failed
           WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
           UNION ALL
           SELECT success_date AS dt, 'succeeded' AS state, RANK() OVER (ORDER BY success_date) AS RK
           FROM Succeeded
           WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31'),           
     t2 AS (SELECT dt, RANK() OVER (ORDER BY dt) AS overall_rk, state, 
           RANK() OVER (ORDER BY dt) - RK AS interv
           FROM t1)
           
SELECT state AS period_state, MIN(dt) AS start_date, MAX(dt) AS end_date
FROM t2
GROUP BY interv, state
ORDER BY start_date;
