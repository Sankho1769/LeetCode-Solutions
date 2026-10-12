# 185. Department Top Three Salaries

**LeetCode:** [185. Department Top Three Salaries](https://leetcode.com/problems/department-top-three-salaries/)

**Difficulty:** Hard  
**Topics:** SQL, Database, Window Functions, `DENSE_RANK`, `JOIN`  
**Status:** ✅ Solved

---

## 📌 Problem Description

Find employees whose salary is among the **top three unique salaries in their department**.

If multiple employees share a salary, they all receive the same rank. The ranking must not skip numbers after ties. Return the department name, employee name, and salary in any order.

## 🗃️ Database Schema

### `Employee`

| Column | Type | Description |
|---|---|---|
| `id` | int | Primary key |
| `name` | varchar | Employee name |
| `salary` | int | Employee salary |
| `departmentId` | int | Department ID |

### `Department`

| Column | Type | Description |
|---|---|---|
| `id` | int | Primary key |
| `name` | varchar | Department name |

## 💡 Approach

Use the `DENSE_RANK()` window function to rank salaries **within each department**:

1. `PARTITION BY departmentId` starts the ranking separately for each department.
2. `ORDER BY salary DESC` ranks the highest salary first.
3. `DENSE_RANK()` gives equal salaries the same rank without gaps.
4. Keep ranks `1`, `2`, and `3`.
5. Join to `Department` to return the department name.

`DENSE_RANK()` is essential here: the problem asks for the top three **unique salary values**, not simply the top three employees.

## ✅ SQL Solution

```sql
SELECT
    d.name AS Department,
    ranked.name AS Employee,
    ranked.salary AS Salary
FROM (
    SELECT
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS salary_rank
    FROM Employee
) AS ranked
JOIN Department AS d
    ON d.id = ranked.departmentId
WHERE ranked.salary_rank <= 3;
```

## 🔍 Explanation

### Rank salaries per department

```sql
DENSE_RANK() OVER (
    PARTITION BY departmentId
    ORDER BY salary DESC
)
```

Each department has an independent ranking. Equal salaries share a rank; the next distinct salary receives the next consecutive rank.

### Keep the top three ranks

```sql
WHERE ranked.salary_rank <= 3
```

This includes every employee whose salary is one of the department's three highest distinct salaries, including all employees tied at those salary levels.

### Return department names

The join matches `Employee.departmentId` with `Department.id` so the output contains the department name rather than its numeric ID.

## 📊 Example

### Input: `Employee`

| id | name | salary | departmentId |
|---:|---|---:|---:|
| 1 | Joe | 85000 | 1 |
| 2 | Henry | 80000 | 2 |
| 3 | Sam | 60000 | 2 |
| 4 | Max | 90000 | 1 |
| 5 | Janet | 69000 | 1 |
| 6 | Randy | 85000 | 1 |
| 7 | Will | 70000 | 1 |

### Input: `Department`

| id | name |
|---:|---|
| 1 | IT |
| 2 | Sales |

### Output

| Department | Employee | Salary |
|---|---|---:|
| IT | Max | 90000 |
| IT | Joe | 85000 |
| IT | Randy | 85000 |
| IT | Will | 70000 |
| Sales | Henry | 80000 |
| Sales | Sam | 60000 |

### Explanation

- **IT:** The top three distinct salaries are `90000`, `85000`, and `70000`. Both Joe and Randy qualify because they share the second-highest salary.
- **Sales:** The two available distinct salaries are `80000` and `60000`, so both employees qualify.

## 🧠 Key SQL Concepts

- **`DENSE_RANK()`** assigns consecutive ranks without gaps after ties.
- **`PARTITION BY`** calculates ranks independently for each department.
- **`ORDER BY salary DESC`** puts the highest salary first.
- **Subquery** lets us filter using the rank computed by the window function.
- **`JOIN`** retrieves the department name.

### Why not `ROW_NUMBER()`?

`ROW_NUMBER()` gives every row a different number, even when employees have equal salaries. That could exclude employees who tie at a qualifying salary level.

### Why not `RANK()`?

`RANK()` leaves gaps after ties. `DENSE_RANK()` is the direct match for ranking the top three unique salaries.

## 🏷️ Tags

`SQL` `MySQL` `LeetCode` `Database` `Window Functions` `DENSE_RANK` `JOIN` `Hard`
