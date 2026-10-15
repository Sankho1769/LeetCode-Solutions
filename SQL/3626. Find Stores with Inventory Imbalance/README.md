# 3626. Find Stores with Inventory Imbalance

**LeetCode:** [3626. Find Stores with Inventory Imbalance](https://leetcode.com/problems/find-stores-with-inventory-imbalance/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find Stores with Inventory Imbalance**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT store_id
FROM Inventory
GROUP BY store_id
HAVING MAX(quantity) > 2 * MIN(quantity);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
