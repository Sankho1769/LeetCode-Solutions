# 2308. Arrange Table by Gender

**LeetCode:** [2308. Arrange Table by Gender](https://leetcode.com/problems/arrange-table-by-gender/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Arrange Table by Gender**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ranked AS (
    SELECT user_id, gender,
           ROW_NUMBER() OVER (PARTITION BY gender ORDER BY user_id) AS rn
    FROM Genders
)
SELECT user_id, gender FROM ranked ORDER BY rn, FIELD(gender, 'female', 'other', 'male');
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
