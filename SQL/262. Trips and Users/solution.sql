SELECT
    t.request_at AS Day,
    ROUND(SUM(t.status <> 'completed') / COUNT(*), 2) AS `Cancellation Rate`
FROM Trips AS t
JOIN Users AS client
    ON t.client_id = client.users_id
   AND client.banned = 'No'
JOIN Users AS driver
    ON t.driver_id = driver.users_id
   AND driver.banned = 'No'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at;
