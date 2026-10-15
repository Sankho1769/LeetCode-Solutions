# 2474. Customers With Strictly Increasing Purchases

**LeetCode:** [2474. Customers With Strictly Increasing Purchases](https://leetcode.com/problems/customers-with-strictly-increasing-purchases/)  
**Difficulty:** Hard  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Use SQL joins, filtering, grouping, or window functions to identify the customer/user records described by **Customers With Strictly Increasing Purchases**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `LAG`/`LEAD`, row numbering, or a gaps-and-islands grouping to compare ordered rows.

## SQL solution

```sql
WITH ordered AS (
    SELECT customer_id, amount,
           LAG(amount) OVER (PARTITION BY customer_id ORDER BY transaction_date) AS prev_amount
    FROM Transactions
)
SELECT customer_id FROM ordered GROUP BY customer_id
HAVING COUNT(*) >= 3 AND SUM(prev_amount IS NULL OR amount > prev_amount) = COUNT(*);
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
