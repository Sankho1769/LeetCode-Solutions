# 3601. Find Drivers with Improved Fuel Efficiency

**LeetCode:** [3601. Find Drivers with Improved Fuel Efficiency](https://leetcode.com/problems/find-drivers-with-improved-fuel-efficiency/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find Drivers with Improved Fuel Efficiency**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `LAG`/`LEAD`, row numbering, or a gaps-and-islands grouping to compare ordered rows.

## SQL solution

```sql
WITH ranked AS (
    SELECT driver_id, fuel_efficiency,
           ROW_NUMBER() OVER (PARTITION BY driver_id ORDER BY record_date) AS first_rn,
           ROW_NUMBER() OVER (PARTITION BY driver_id ORDER BY record_date DESC) AS last_rn
    FROM FuelRecords
)
SELECT driver_id,
       MAX(CASE WHEN first_rn = 1 THEN fuel_efficiency END) AS first_efficiency,
       MAX(CASE WHEN last_rn = 1 THEN fuel_efficiency END) AS last_efficiency
FROM ranked GROUP BY driver_id
HAVING MAX(CASE WHEN last_rn = 1 THEN fuel_efficiency END) > MAX(CASE WHEN first_rn = 1 THEN fuel_efficiency END);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
