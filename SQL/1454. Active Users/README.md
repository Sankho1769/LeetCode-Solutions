# 1454. Active Users

**LeetCode:** [1454. Active Users](https://leetcode.com/problems/active-users/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **Active Users**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ranked AS (
    SELECT id, login_date,
           DATE_SUB(login_date, INTERVAL ROW_NUMBER() OVER (PARTITION BY id ORDER BY login_date) DAY) AS grp
    FROM Logins
)
SELECT DISTINCT l.id, a.name
FROM ranked l JOIN Accounts a ON a.id = l.id
GROUP BY l.id, a.name, grp
HAVING COUNT(*) >= 5;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
