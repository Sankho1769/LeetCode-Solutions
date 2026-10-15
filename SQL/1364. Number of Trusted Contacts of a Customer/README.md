# 1364. Number of Trusted Contacts of a Customer

**LeetCode:** [1364. Number of Trusted Contacts of a Customer](https://leetcode.com/problems/number-of-trusted-contacts-of-a-customer/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **Number of Trusted Contacts of a Customer**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT c.customer_id, c.customer_name,
       COUNT(DISTINCT ct.contact_email) AS contacts_cnt,
       COUNT(DISTINCT cu.customer_id) AS trusted_contacts_cnt
FROM Customers c
LEFT JOIN Contacts ct ON ct.user_id = c.customer_id
LEFT JOIN Customers cu ON cu.email = ct.contact_email
GROUP BY c.customer_id, c.customer_name;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
