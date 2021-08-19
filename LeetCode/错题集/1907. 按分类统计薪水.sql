 #KEY: 如果某个类别中没有帐户，则报告 0。所以此处不能用单纯的group by
 SELECT 'Low Salary' category, COUNT(IF(income < 20000, 1, null)) accounts_count FROM Accounts
 UNION ALL
 SELECT 'Average Salary' category, COUNT(IF(income >= 20000 AND income <= 50000, 1, null)) accounts_count FROM Accounts
 UNION ALL
 SELECT 'High Salary' category, COUNT(IF(income > 50000, 1, null)) accounts_count FROM Accounts;
