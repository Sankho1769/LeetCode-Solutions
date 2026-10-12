# 182. Duplicate Emails

**LeetCode:** [182. Duplicate Emails](https://leetcode.com/problems/duplicate-emails/)  
**Difficulty:** Easy  
**Topics:** SQL, Database, `GROUP BY`, `HAVING`, Aggregate Functions  
**Status:** ✅ Solved

---

## Problem Description

Report all email addresses that appear more than once in the `Person` table. The result can be returned in any order.

## Database Schema

### `Person`

| Column | Type | Description |
|---|---|---|
| `id` | int | Primary key |
| `email` | varchar | Email address; guaranteed not to be `NULL` |

## Approach

Group rows by `email`, then use `HAVING COUNT(*) > 1` to keep only email groups that contain more than one row.

## SQL Solution

```sql
SELECT Email
FROM Person
GROUP BY Email
HAVING COUNT(*) > 1;
```

## Explanation

- `GROUP BY Email` places identical email addresses into the same group.
- `COUNT(*)` counts the rows in each group.
- `HAVING COUNT(*) > 1` filters out email addresses that occur only once.
- The output column is named `Email`, as required by the result format.

## Example

### Input

| id | email |
|---:|---|
| 1 | a@b.com |
| 2 | c@d.com |
| 3 | a@b.com |

### Output

| Email |
|---|
| a@b.com |

## Key Concepts

- `GROUP BY` groups rows with the same email address.
- `HAVING` filters groups after aggregation.
- `COUNT(*)` counts the rows in each group.

## Complexity

The query groups the table by email. Its exact runtime and memory usage depend on the database engine, execution plan, and available indexes; grouping commonly requires processing the rows and may use a sort or hash aggregation.

## Tags

`SQL` `MySQL` `LeetCode` `Database` `GROUP BY` `HAVING` `COUNT` `Easy`
