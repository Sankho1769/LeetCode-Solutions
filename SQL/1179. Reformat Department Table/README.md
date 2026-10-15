# 1179. Reformat Department Table

**LeetCode:** [1179. Reformat Department Table](https://leetcode.com/problems/reformat-department-table/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Reformat Department Table**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT id,
       MAX(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
       MAX(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
       MAX(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
       MAX(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
       MAX(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
       MAX(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
       MAX(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
       MAX(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
       MAX(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
       MAX(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
       MAX(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
       MAX(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department GROUP BY id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
