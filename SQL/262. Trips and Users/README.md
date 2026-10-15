# 262. Trips and Users

**LeetCode:** [262. Trips and Users](https://leetcode.com/problems/trips-and-users/)  
**Difficulty:** Hard  
**Topics:** SQL, Joins, Conditional Aggregation, Group By  
**SQL dialect:** MySQL  
**Status:** Solution included

---

## Problem Summary

For each day from 2013-10-01 through 2013-10-03, calculate the cancellation rate of trips whose client and driver are both not banned. A cancelled trip is one whose status is not `completed`.

## Schema

`Trips(id, client_id, driver_id, city_id, status, request_at)` and `Users(users_id, banned, role)`. `Trips.client_id` and `Trips.driver_id` refer to `Users.users_id`.

## Approach

Join `Trips` to `Users` twice to verify that both the client and the driver are not banned. Restrict the date range, then group by request date. Divide cancelled trips by all eligible trips and round to two decimal places.

## SQL Solution

```sql
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
```

## Explanation

The joins exclude trips involving a banned client or driver. The specified date range comes from the problem statement. Dates with no eligible trips do not produce a group in this query.

## Key Concepts

SQL, Joins, Conditional Aggregation, Group By

## Source

The problem title and requirements are linked to the official LeetCode page. This README summarizes the task in my own words rather than reproducing the complete statement.
