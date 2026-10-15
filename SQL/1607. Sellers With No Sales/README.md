# 1607. Sellers With No Sales

**LeetCode:** [1607. Sellers With No Sales](https://leetcode.com/problems/sellers-with-no-sales/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Sellers With No Sales**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use an anti-join (`LEFT JOIN ... IS NULL`) or `NOT EXISTS` to find rows with no qualifying match.

## SQL solution

```sql
SELECT s.seller_name
FROM Seller s
WHERE NOT EXISTS (
    SELECT 1 FROM Orders o
    WHERE o.seller_id = s.seller_id AND o.sale_date >= '2020-01-01' AND o.sale_date < '2021-01-01'
);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
