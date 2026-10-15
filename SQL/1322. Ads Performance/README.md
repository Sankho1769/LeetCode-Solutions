# 1322. Ads Performance

**LeetCode:** [1322. Ads Performance](https://leetcode.com/problems/ads-performance/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Ads Performance**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT ad_id,
       ROUND(COALESCE(SUM(action = 'Clicked') / NULLIF(SUM(action IN ('Clicked','Viewed')), 0) * 100, 0), 2) AS ctr
FROM Ads GROUP BY ad_id ORDER BY ctr DESC, ad_id;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
