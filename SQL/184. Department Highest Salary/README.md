# 184. Department Highest Salary

**LeetCode:** [184. Department Highest Salary](https://leetcode.com/problems/department-highest-salary/)

**Difficulty:** Medium  
**Topics:** SQL, Database, JOIN, GROUP BY, MAX  
**Status:** ✅ Solved

---

## Problem Description

Find the employees who have the highest salary in each department. If multiple employees share the highest salary in a department, include all of them.

Return the result columns as `Department`, `Employee`, and `Salary`. The result can be returned in any order.

## Database Schema

### `Employee`

| Column | Type | Description |
|---|---|---|
| `id` | int | Primary key |
| `name` | varchar | Employee name |
| `salary` | int | Employee salary |
| `departmentId` | int | ID of the employee's department |

### `Department`

| Column | Type | Description |
|---|---|---|
| `id` | int | Primary key |
| `name` | varchar | Department name |

## Approach

1. Group employees by `departmentId` and calculate the maximum salary in each department with `MAX(salary)`.
2. Join those maximum salaries back to `Employee` using both the department ID and salary.
3. Join `Department` to retrieve the department name.

Joining on the maximum salary rather than selecting only one employee ensures that **all employees tied for the highest salary are returned**.

## SQL Solution

```sql
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee AS e
JOIN Department AS d
    ON d.id = e.departmentId
JOIN (
    SELECT
        departmentId,
        MAX(salary) AS max_salary
    FROM Employee
    GROUP BY departmentId
) AS highest
    ON highest.departmentId = e.departmentId
   AND highest.max_salary = e.salary;
```

## Example

### Input: `Employee`

| id | name | salary | departmentId |
|---:|---|---:|---:|
| 1 | Joe | 70000 | 1 |
| 2 | Jim | 90000 | 1 |
| 3 | Henry | 80000 | 2 |
| 4 | Sam | 60000 | 2 |
| 5 | Max | 90000 | 1 |

### Input: `Department`

| id | name |
|---:|---|
| 1 | IT |
| 2 | Sales |

### Output

| Department | Employee | Salary |
|---|---|---:|
| IT | Jim | 90000 |
| Sales | Henry | 80000 |
| IT | Max | 90000 |

Jim and Max are both included because they share the highest salary in IT.

## Key Concepts

- **`MAX(salary)`** finds the highest salary in each department.
- **`GROUP BY departmentId`** calculates one maximum salary per department.
- **JOIN** connects each department's maximum salary back to the matching employee and retrieves the department name.
- **Ties:** Joining by salary keeps every employee whose salary equals the departmental maximum.

## Complexity

The query groups the employee records and joins the result back to the employee and department tables. Actual performance depends on the database engine, optimizer, indexes, and table sizes.

## Tags

`SQL` `MySQL` `LeetCode` `JOIN` `GROUP BY` `MAX` `Medium`
