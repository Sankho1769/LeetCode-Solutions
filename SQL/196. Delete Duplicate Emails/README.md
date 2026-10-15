# 196. Delete Duplicate Emails

**LeetCode:** [196. Delete Duplicate Emails](https://leetcode.com/problems/delete-duplicate-emails/)  
**Difficulty:** Easy  
**Topics:** SQL, DELETE, Self Join  
**SQL dialect:** MySQL  
**Status:** Solution included

---

## Problem Summary

Delete duplicate email rows from `Person`, keeping the row with the smallest `id` for each email address.

## Schema

`Person(id INT, email VARCHAR)`. `id` is the primary key.

## Approach

Join the table to itself on equal email values. A row is a duplicate when another row has the same email and a smaller ID. Delete only the row with the greater ID, leaving the earliest row for each email.

## SQL Solution

```sql
DELETE p1
FROM Person AS p1
JOIN Person AS p2
    ON p1.email = p2.email
   AND p1.id > p2.id;
```

## Explanation

This is a MySQL multi-table `DELETE`. The condition `p1.id > p2.id` ensures that the smallest ID for each email is retained.

## Key Concepts

SQL, DELETE, Self Join

## Source

The problem title and requirements are linked to the official LeetCode page. This README summarizes the task in my own words rather than reproducing the complete statement.
