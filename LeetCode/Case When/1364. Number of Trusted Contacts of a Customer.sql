WITH t1 AS (SELECT c1.customer_id, c1.customer_name, COUNT(c2.contact_name) contacts_cnt, SUM(CASE WHEN c2.contact_email IN (SELECT email FROM Customers) THEN 1 ELSE 0 END) AS trusted_contacts_cnt
            FROM Customers c1
            LEFT JOIN Contacts c2
            ON c1.customer_id = c2.user_id
           GROUP BY 1)
            
SELECT i.invoice_id, t1.customer_name, i.price, t1.contacts_cnt, t1.trusted_contacts_cnt
FROM Invoices i
LEFT JOIN t1
ON i.user_id = t1.customer_id
ORDER BY invoice_id;
