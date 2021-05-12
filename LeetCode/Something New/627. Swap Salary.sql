#MYSQL UPDATE statement: https://www.mysqltutorial.org/mysql-update-data.aspx
UPDATE Salary
SET sex = IF(sex = 'm', 'f', 'm');
