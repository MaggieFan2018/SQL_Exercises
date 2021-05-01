#Tag: calculate medium 
#helpful link: https://codingsight.com/grouping-data-using-the-over-and-partition-by-functions/

WITH t1 AS (SELECT Id, Company, Salary, ROW_NUMBER() OVER (PARTITION BY Company ORDER BY Salary) AS salaryrank, 
           COUNT(Id) OVER (PARTITION BY Company) cnt
           FROM Employee)
           
SELECT Id, Company, Salary
FROM t1
WHERE salaryrank BETWEEN cnt/2.0 AND cnt/2.0 + 1;
