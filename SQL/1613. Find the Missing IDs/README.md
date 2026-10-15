# 1613. Find the Missing IDs

**LeetCode:** [1613. Find the Missing IDs](https://leetcode.com/problems/find-the-missing-ids/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find the Missing IDs**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use an anti-join (`LEFT JOIN ... IS NULL`) or `NOT EXISTS` to find rows with no qualifying match.

## SQL solution

```sql
WITH RECURSIVE ids AS (
    SELECT 1 AS id
    UNION ALL SELECT id + 1 FROM ids WHERE id < (SELECT MAX(customer_id) FROM Customers)
)
SELECT ids.id AS ids
FROM ids LEFT JOIN Customers c ON c.customer_id = ids.id
WHERE c.customer_id IS NULL;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
