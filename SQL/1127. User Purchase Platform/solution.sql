WITH platforms AS (
    SELECT 'desktop' AS platform UNION ALL SELECT 'mobile' UNION ALL SELECT 'both'
), dates AS (
    SELECT DISTINCT spend_date FROM Spending
), aggregates AS (
    SELECT spend_date, 'desktop' AS platform, SUM(amount) AS total_amount, COUNT(DISTINCT user_id) AS total_users
    FROM Spending WHERE platform = 'desktop' GROUP BY spend_date
    UNION ALL
    SELECT spend_date, 'mobile', SUM(amount), COUNT(DISTINCT user_id)
    FROM Spending WHERE platform = 'mobile' GROUP BY spend_date
    UNION ALL
    SELECT spend_date, 'both', SUM(amount), COUNT(DISTINCT user_id)
    FROM Spending GROUP BY spend_date, user_id HAVING COUNT(DISTINCT platform) = 2
)
SELECT d.spend_date, p.platform, COALESCE(SUM(a.total_amount), 0) AS total_amount,
       COALESCE(SUM(a.total_users), 0) AS total_users
FROM dates d CROSS JOIN platforms p
LEFT JOIN aggregates a ON a.spend_date = d.spend_date AND a.platform = p.platform
GROUP BY d.spend_date, p.platform;
