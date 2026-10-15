# 3059. Find All Unique Email Domains

**LeetCode:** [3059. Find All Unique Email Domains](https://leetcode.com/problems/find-all-unique-email-domains/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Find All Unique Email Domains**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT SUBSTRING_INDEX(email, '@', -1) AS email_domain, COUNT(*) AS count
FROM Emails
WHERE email LIKE '%@%'
GROUP BY SUBSTRING_INDEX(email, '@', -1)
ORDER BY email_domain;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
