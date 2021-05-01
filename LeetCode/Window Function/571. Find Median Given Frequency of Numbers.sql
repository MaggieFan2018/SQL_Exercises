#tag: calculate medium
#helpful solution: https://leetcode.com/problems/find-median-given-frequency-of-numbers/discuss/681337/Super-Simple-5-Lines

SELECT AVG(Number) median
FROM (SELECT *, SUM(Frequency) OVER (ORDER BY Number) AS total_freq, (SUM(Frequency) OVER ())/2 AS med_loc
FROM Numbers) t1
WHERE med_loc BETWEEN total_freq - Frequency AND total_freq;
