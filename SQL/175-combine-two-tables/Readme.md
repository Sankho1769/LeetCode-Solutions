# 175. Combine Two Tables

**Difficulty:** Easy  
**Problem:** [LeetCode 175 - Combine Two Tables](https://leetcode.com/problems/combine-two-tables/)

## Problem Description

Write a solution to report the following information for every person in the `Person` table:

- First name
- Last name
- City
- State

If a person does not have an address in the `Address` table, the city and state should be returned as `NULL`.

The result can be returned in any order.

## Approach

We use a `LEFT JOIN` between the `Person` and `Address` tables.

A `LEFT JOIN` is used because we need to include **every person** from the `Person` table, even when no matching record exists in the `Address` table.

The tables are joined using:

```sql
p.personId = a.personId