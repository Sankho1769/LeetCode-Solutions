SELECT SUBSTRING_INDEX(email, '@', -1) AS email_domain, COUNT(*) AS count
FROM Emails
WHERE email LIKE '%@%'
GROUP BY SUBSTRING_INDEX(email, '@', -1)
ORDER BY email_domain;
