# 2020. Number of Accounts That Did Not Stream

**LeetCode:** [2020. Number of Accounts That Did Not Stream](https://leetcode.com/problems/number-of-accounts-that-did-not-stream/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Number of Accounts That Did Not Stream**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use an anti-join (`LEFT JOIN ... IS NULL`) or `NOT EXISTS` to find rows with no qualifying match.

## SQL solution

```sql
SELECT a.account_id, a.max_streams
FROM Accounts a
WHERE NOT EXISTS (SELECT 1 FROM Streams s WHERE s.account_id = a.account_id);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
