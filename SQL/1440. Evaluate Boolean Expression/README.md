# 1440. Evaluate Boolean Expression

**LeetCode:** [1440. Evaluate Boolean Expression](https://leetcode.com/problems/evaluate-boolean-expression/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Evaluate Boolean Expression**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT e.left_operand, e.operator, e.right_operand,
       CASE e.operator
         WHEN '>' THEN l.value > r.value
         WHEN '<' THEN l.value < r.value
         ELSE l.value = r.value
       END AS value
FROM Expressions e
JOIN Variables l ON l.name = e.left_operand
JOIN Variables r ON r.name = e.right_operand;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
