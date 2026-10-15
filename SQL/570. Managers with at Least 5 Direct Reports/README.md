# 570. Managers with at Least 5 Direct Reports

**LeetCode:** [570. Managers with at Least 5 Direct Reports](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/)  
**Difficulty:** Medium  
**Topics:** SQL, Self Join, Group By, Having  
**SQL dialect:** MySQL  
**Status:** Solution included

---

## Problem Summary

Find the names of employees who have at least five direct reports.

## Schema

`Employee(id INT, name VARCHAR, department VARCHAR, managerId INT)`. `id` is the primary key; `managerId` refers to an employee’s manager.

## Approach

Self-join each manager row to their direct-report rows, group by manager, and retain groups with at least five reports.

## SQL Solution

```sql
SELECT manager.name
FROM Employee AS manager
JOIN Employee AS report
    ON report.managerId = manager.id
GROUP BY manager.id, manager.name
HAVING COUNT(*) >= 5;
```

## Explanation

Only direct reports are counted; reports of reports are not included.

## Key Concepts

SQL, Self Join, Group By, Having

## Source

The problem title and requirements are linked to the official LeetCode page. This README summarizes the task in my own words rather than reproducing the complete statement.
