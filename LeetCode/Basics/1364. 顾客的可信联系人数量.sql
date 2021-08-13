WITH t1 AS (SELECT user_id customer_id, COUNT(1) contacts_cnt, SUM(contact_name IN (SELECT customer_name FROM Customers)) trusted_contacts_cnt
            FROM Contacts
            GROUP BY 1)

SELECT i.invoice_id, c.customer_name, i.price, IFNULL(t1.contacts_cnt, 0) contacts_cnt, IFNULL(t1.trusted_contacts_cnt, 0) trusted_contacts_cnt
FROM Invoices i 
LEFT JOIN Customers c 
ON i.user_id = c.customer_id
LEFT JOIN t1 
USING(customer_id)
ORDER BY 1;
