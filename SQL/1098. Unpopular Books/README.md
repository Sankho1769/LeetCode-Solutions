# 1098. Unpopular Books

**LeetCode:** [1098. Unpopular Books](https://leetcode.com/problems/unpopular-books/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Unpopular Books**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT b.book_id, b.name
FROM Books b
WHERE b.available_from < '2019-05-23'
  AND b.book_id NOT IN (
      SELECT o.book_id FROM Orders o
      WHERE o.dispatch_date >= '2018-06-23' AND o.dispatch_date <= '2019-06-23'
      GROUP BY o.book_id HAVING SUM(o.quantity) >= 10
  );
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
