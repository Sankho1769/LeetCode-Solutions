# 2388. Change Null Values in a Table to the Previous Value

**LeetCode:** [2388. Change Null Values in a Table to the Previous Value](https://leetcode.com/problems/change-null-values-in-a-table-to-the-previous-value/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Change Null Values in a Table to the Previous Value**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH marked AS (
    SELECT id, drink,
           SUM(drink IS NOT NULL) OVER (ORDER BY id) AS grp
    FROM CoffeeShop
)
SELECT id, MAX(drink) OVER (PARTITION BY grp) AS drink
FROM marked ORDER BY id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
