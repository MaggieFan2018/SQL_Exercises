#In PostgreSQL, My SQL, and Oracle, we use MOD function to check the remainder.
#https://tableplus.com/blog/2019/09/select-rows-odd-even-value.html

# To find rows where a specified column has even values:

# SELECT * 
# FROM table_name 
# WHERE mod(column_name,2) = 0;



#Method 1: MOD
# SELECT * 
# FROM cinema
# WHERE description <> 'boring'
# AND MOD(id, 2) <> 0
# ORDER BY rating DESC;


#Method 2: % (slower)
SELECT * 
FROM cinema
WHERE description <> 'boring'
AND id % 2 <> 0
ORDER BY rating DESC;
