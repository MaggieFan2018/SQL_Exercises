#TAKEAWAY: use DAYNAME() to get name of the week day of the specified date

SELECT DISTINCT i.item_category Category, SUM(CASE WHEN DAYNAME(o.order_date) = 'Monday' THEN o.quantity ELSE 0 END) AS Monday,
                        SUM(CASE WHEN DAYNAME(o.order_date) = 'Tuesday' THEN o.quantity ELSE 0 END) AS Tuesday,
                        SUM(CASE WHEN DAYNAME(o.order_date) = 'Wednesday' THEN o.quantity ELSE 0 END) AS Wednesday,
                        SUM(CASE WHEN DAYNAME(o.order_date) = 'Thursday' THEN o.quantity ELSE 0 END) AS Thursday,
                        SUM(CASE WHEN DAYNAME(o.order_date) = 'Friday' THEN o.quantity ELSE 0 END) AS Friday,
                        SUM(CASE WHEN DAYNAME(o.order_date) = 'Saturday' THEN o.quantity ELSE 0 END) AS Saturday,
                        SUM(CASE WHEN DAYNAME(o.order_date) = 'Sunday' THEN o.quantity ELSE 0 END) AS Sunday
FROM Items i
LEFT JOIN Orders o
USING(item_id)
GROUP BY 1
ORDER BY Category;
