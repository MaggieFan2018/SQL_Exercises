
#update语句使用方法如下：
# update 表名
# set 列名 = 修改后的值;



#method 1: case when 
# UPDATE Salary
# SET sex = CASE sex WHEN 'm' THEN 'f' ELSE 'm' END;


#method 2: if clause
UPDATE Salary
SET sex = IF(sex = 'm', 'f', 'm');
