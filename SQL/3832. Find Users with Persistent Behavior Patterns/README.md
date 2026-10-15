# 3832. Find Users with Persistent Behavior Patterns

**LeetCode:** [3832. Find Users with Persistent Behavior Patterns](https://leetcode.com/problems/find-users-with-persistent-behavior-patterns/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **Find Users with Persistent Behavior Patterns**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ordered AS (
    SELECT user_id, event_date, behavior,
           LAG(behavior) OVER (PARTITION BY user_id ORDER BY event_date) AS prev_behavior
    FROM UserBehavior
)
SELECT user_id
FROM ordered
GROUP BY user_id
HAVING COUNT(*) >= 3 AND SUM(behavior = prev_behavior) >= 2;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
