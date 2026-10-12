# 181. Employees Earning More Than Their Managers

**LeetCode:** [181. Employees Earning More Than Their Managers](https://leetcode.com/problems/employees-earning-more-than-their-managers/)

**Difficulty:** Easy  
**Topics:** SQL, Database, Self Join  
**Status:** ✅ Solved

---

## Problem Description

Find the employees who earn more than their managers. Return their names in a column named `Employee`. The result can be returned in any order.

## Database Schema

### `Employee`

| Column | Type | Description |
|---|---|---|
| `id` | int | Primary key identifying the employee |
| `name` | varchar | Employee's name |
| `salary` | int | Employee's salary |
| `managerId` | int | ID of the employee's manager; `NULL` if there is no manager |

## Approach

Use a **self join** to compare an employee with their manager. The `Employee` table is referenced twice:

- `e1` represents the employee.
- `e2` represents the manager.

Join them where `e1.managerId = e2.id`, then keep only employees whose salary is greater than their manager's salary.

## SQL Solution

```sql
SELECT e1.name AS Employee
FROM Employee AS e1
JOIN Employee AS e2
    ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;
```

## Example

### Input

| id | name | salary | managerId |
|---:|---|---:|---:|
| 1 | Joe | 70000 | 3 |
| 2 | Henry | 80000 | 4 |
| 3 | Sam | 60000 | NULL |
| 4 | Max | 90000 | NULL |

### Output

| Employee |
|---|
| Joe |

### Explanation

Joe earns `70000`, which is greater than his manager Sam's salary of `60000`. Henry earns less than his manager Max, so Henry is not included. Sam and Max have no manager and therefore do not match a manager row in the join.

## Key SQL Concepts

- **Self join:** Uses the same table twice to relate employees to managers.
- **Join condition:** Matches each employee's `managerId` with the manager's `id`.
- **Filtering:** `WHERE e1.salary > e2.salary` keeps employees earning more than their managers.
- **Column alias:** `AS Employee` sets the required output column name.

## Tags

`SQL` `MySQL` `LeetCode` `Database` `Self Join` `Easy`
