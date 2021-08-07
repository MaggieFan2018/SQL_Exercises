
# solution 1、REGEXP：
# 用|表示条件之一。
# 在开头用'^DIAB1'匹配。
# 在其他位置用'双反斜杠sDIAB1'匹配，'双反斜杠s'表示空格。

SELECT *
FROM Patients
WHERE conditions REGEXP '^DIAB1|\\sDIAB1';

# solution 2、LIKE：
# 在开头用'DIAB1%'匹配。
# 在其他位置用'% DIAB1%'匹配。

SELECT *
FROM Patients
WHERE conditions LIKE 'DIAB1%'
OR conditions LIKE '% DIAB1%';
