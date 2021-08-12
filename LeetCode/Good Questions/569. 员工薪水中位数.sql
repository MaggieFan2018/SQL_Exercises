SELECT Id, Company, Salary 
FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY Company ORDER BY Salary) RK_1,
                COUNT(Id) OVER(PARTITION BY Company) total
      FROM Employee) t
WHERE RK_1 >= total/2 AND RK_1 <= total/2 + 1;



#SOLUTION USING 571 LOGIC (开窗函数内还需要ID排序)
# SELECT Id, Company, Salary 
# FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY Company ORDER BY Salary, Id) RK_1,
#                 ROW_NUMBER() OVER (PARTITION BY Company ORDER BY Salary DESC, Id DESC) RK_2,
#                 COUNT(Id) OVER(PARTITION BY Company) total
#       FROM Employee) t
# WHERE RK_1 >= total/2 AND RK_2 >= total/2;
