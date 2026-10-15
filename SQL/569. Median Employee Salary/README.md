# 569. Median Employee Salary

**LeetCode:** [569. Median Employee Salary](https://leetcode.com/problems/median-employee-salary/)  
**Difficulty:** Hard  
**Topics:** SQL, Window Functions, Row Number, Median  
**SQL dialect:** MySQL  
**Status:** Solution included

---

## Problem Summary

Return the employee row or rows at the median salary position within each company. When a company has an even number of employees, return both middle positions.

## Schema

`Employee(id INT, company VARCHAR, salary INT)`. `id` is the primary key.

## Approach

Number each company’s employees in salary order and count employees per company. For an odd count, select the single middle row; for an even count, select the two middle rows.

## SQL Solution

```sql
WITH ranked AS (
    SELECT
        id,
        company,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY company
            ORDER BY salary, id
        ) AS rn,
        COUNT(*) OVER (
            PARTITION BY company
        ) AS cnt
    FROM Employee
)
SELECT id, company, salary
FROM ranked
WHERE rn BETWEEN FLOOR((cnt + 1) / 2) AND CEIL((cnt + 1) / 2);
```

## Explanation

Uses MySQL 8.0+ window functions. `id` provides deterministic ordering if two employees have the same salary.

## Key Concepts

SQL, Window Functions, Row Number, Median

## Source

The problem title and requirements are linked to the official LeetCode page. This README summarizes the task in my own words rather than reproducing the complete statement.
