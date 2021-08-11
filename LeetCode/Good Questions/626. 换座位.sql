#换座位问题：如果是奇数： +1， 偶数： -1， 奇数且是最后一个： 不变
#IF 实现上述操作
SELECT IF(MOD(id, 2) = 0, id - 1, IF(id = (SELECT COUNT(*) FROM seat), id, id + 1) )id, student
FROM seat
ORDER BY 1;
