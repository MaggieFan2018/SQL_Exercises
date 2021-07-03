#Method 1: Window Function 
# SELECT nxtid id
# FROM (SELECT *, LEAD(recordDate, 1) OVER(ORDER BY recordDate) nxtdt,
#                 LEAD(temperature, 1) OVER(ORDER BY recordDate) nxttp,
#                 LEAD(id, 1) OVER(ORDER BY recordDate) nxtid
#      FROM Weather) t1

# WHERE t1.Temperature < t1.nxttp
# AND DATEDIFF(t1.nxtdt, recordDate) = 1;     


#Method 2: 非等值连接
select t2.id
FROM Weather t1, Weather t2
WHERE t1.Temperature < t2.Temperature
AND DATEDIFF(t2.recordDate, t1.recordDate) = 1;  
