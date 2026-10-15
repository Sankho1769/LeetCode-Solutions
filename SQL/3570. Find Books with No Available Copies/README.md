# 3570. Find Books with No Available Copies

**LeetCode:** [3570. Find Books with No Available Copies](https://leetcode.com/problems/find-books-with-no-available-copies/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find Books with No Available Copies**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use an anti-join (`LEFT JOIN ... IS NULL`) or `NOT EXISTS` to find rows with no qualifying match.

## SQL solution

```sql
SELECT b.book_id, b.name
FROM Books b
WHERE NOT EXISTS (
    SELECT 1 FROM Inventory i WHERE i.book_id = b.book_id AND i.quantity > 0
);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
