SELECT c.customer_id, c.customer_name,
       COUNT(DISTINCT ct.contact_email) AS contacts_cnt,
       COUNT(DISTINCT cu.customer_id) AS trusted_contacts_cnt
FROM Customers c
LEFT JOIN Contacts ct ON ct.user_id = c.customer_id
LEFT JOIN Customers cu ON cu.email = ct.contact_email
GROUP BY c.customer_id, c.customer_name;
