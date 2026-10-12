# 183. Customers Who Never Order

**LeetCode:** [183. Customers Who Never Order](https://leetcode.com/problems/customers-who-never-order/)

**Difficulty:** Easy  
**Topics:** SQL, Database, `LEFT JOIN`, `IS NULL`  
**Status:** ✅ Solved

---

## Problem Description

Find all customers who have never placed an order. Return the result column named `Customers`. The result can be returned in any order.

## Database Schema

### `Customers`

| Column | Type | Description |
|---|---|---|
| `id` | int | Primary key |
| `name` | varchar | Customer's name |

### `Orders`

| Column | Type | Description |
|---|---|---|
| `id` | int | Primary key |
| `customerId` | int | ID of the customer who placed the order |

## Approach

Use a `LEFT JOIN` to keep every customer and attach a matching order when one exists. Customers without orders will have `NULL` in the joined `Orders` columns. Filter for those rows using `WHERE o.customerId IS NULL`.

## SQL Solution

```sql
SELECT c.name AS Customers
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.id = o.customerId
WHERE o.customerId IS NULL;
```

## Example

**Customers**

| id | name |
|---:|---|
| 1 | Joe |
| 2 | Henry |
| 3 | Sam |
| 4 | Max |

**Orders**

| id | customerId |
|---:|---:|
| 1 | 3 |
| 2 | 1 |

**Output**

| Customers |
|---|
| Henry |
| Max |

## Explanation

Joe and Sam have matching rows in `Orders`, so they are excluded. Henry and Max have no matching order, so their joined `customerId` values are `NULL` and they are returned.

## Key Concepts

- `LEFT JOIN` preserves all rows from the left table.
- `IS NULL` identifies customers with no matching order.
- `AS Customers` sets the required output column name.

## Tags

`SQL` `MySQL` `LeetCode` `LEFT JOIN` `IS NULL` `Easy`
