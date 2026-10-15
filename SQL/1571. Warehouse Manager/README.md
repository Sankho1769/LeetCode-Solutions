# 1571. Warehouse Manager

**LeetCode:** [1571. Warehouse Manager](https://leetcode.com/problems/warehouse-manager/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL to analyze employee/manager records and return the rows required by **Warehouse Manager**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT w.name AS warehouse_name,
       SUM(w.units * p.Width * p.Length * p.Height) AS volume
FROM Warehouse w JOIN Products p ON p.product_id = w.product_id
GROUP BY w.name;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
