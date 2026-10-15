# 3172. Second Day Verification

**LeetCode:** [3172. Second Day Verification](https://leetcode.com/problems/second-day-verification/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Second Day Verification**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT s.user_id
FROM Signups s JOIN Confirmations c ON c.user_id = s.user_id
WHERE DATE(c.time_stamp) = DATE_ADD(DATE(s.signup_date), INTERVAL 1 DAY)
  AND c.action = 'confirmed';
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
