# 3055. Top Percentile Fraud

**LeetCode:** [3055. Top Percentile Fraud](https://leetcode.com/problems/top-percentile-fraud/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Top Percentile Fraud**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH ranked AS (
    SELECT fraud_id, state, fraud_score,
           CUME_DIST() OVER (PARTITION BY state ORDER BY fraud_score DESC) AS percentile
    FROM Fraud
)
SELECT fraud_id, state, fraud_score FROM ranked WHERE percentile <= 0.05;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
