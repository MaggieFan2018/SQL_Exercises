# 解题思路

# METHOD 1 EQUAL TO MAX

#     USE GROUP BY, ORDER BY, AND LIMIT 1 TO GET THE MAX NUMBER OF EMPLOYEES;
#     USE GROUP BY AND HAVING;
#     HAVING THE NUMBER OF EMPLOYEES EQUAL TO THE MAX NUMBER OF EMPLOYEES;

SELECT project_id
FROM project
GROUP BY 1
HAVING COUNT(employee_id) = (SELECT COUNT(employee_id)
                             FROM project
                             GROUP BY project_id
                             ORDER BY 1 DESC
                             LIMIT 1);



# METHOD 2 GREATER THAN OR EQUAL TO ALL

#     USE GROUP BY AND ORDER BY TO GET THE NUMBER OF EMPLOYEES;
#     USE GROUP BY AND HAVING;
#     HAVING THE NUMBER OF EMPLOYEES GREATER THAN OR EQUAL TO ALL THE NUMBER OF EMPLOYEES;

SELECT project_id
FROM project
GROUP BY 1
HAVING COUNT(employee_id) >= ALL(SELECT COUNT(employee_id)
                             FROM project
                             GROUP BY project_id);
