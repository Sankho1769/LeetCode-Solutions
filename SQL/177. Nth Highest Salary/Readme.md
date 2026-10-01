# 177. Nth Highest Salary

**LeetCode:** [177. Nth Highest Salary](https://leetcode.com/problems/nth-highest-salary/)

**Difficulty:** Medium

**Topics:** SQL, Database, Function, DISTINCT, ORDER BY, LIMIT

**Status:** ✅ Solved

---

## 📌 Problem Description

Write a solution to find the `nth` highest **distinct** salary from the `Employee` table.

If there are fewer than `n` distinct salaries, return `NULL`.

---

## 🗃️ Database Schema

### `Employee`

| Column Name | Type | Description       |
| ----------- | ---- | ----------------- |
| `id`        | int  | Primary key       |
| `salary`    | int  | Employee's salary |

---

## 💡 Approach

We need to find the `nth` highest **distinct** salary.

The approach is:

1. Use `DISTINCT` so duplicate salaries are counted only once.
2. Sort salaries in descending order using `ORDER BY salary DESC`.
3. Convert `N` into a zero-based offset by using `N - 1`.
4. Use `LIMIT N, 1` to retrieve exactly one salary.
5. If that position does not exist, the subquery returns `NULL`.

For example, with:

```text
300
200
100
```

and `N = 2`:

```text
N - 1 = 1
```

The query skips the first salary (`300`) and returns the next one (`200`).

---

## ✅ SQL Solution

```sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N = N - 1;

    RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT N, 1
    );
END
```

---

## 🔍 Explanation

### `CREATE FUNCTION`

```sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
```

Creates the function required by LeetCode.

The function accepts `N` and returns an integer salary.

---

### `DISTINCT`

```sql
SELECT DISTINCT salary
```

The problem asks for the `nth` highest **distinct** salary.

For example:

```text
300
300
200
100
```

becomes:

```text
300
200
100
```

---

### `ORDER BY`

```sql
ORDER BY salary DESC
```

Sorts salaries from highest to lowest:

```text
300
200
100
```

---

### `SET N = N - 1`

```sql
SET N = N - 1;
```

`LIMIT` uses a zero-based offset.

Therefore:

```text
1st highest → offset 0
2nd highest → offset 1
3rd highest → offset 2
Nth highest → offset N - 1
```

---

### `LIMIT`

```sql
LIMIT N, 1
```

The first value specifies how many rows to skip.

The second value specifies how many rows to return.

For `N = 2`:

```text
LIMIT 1, 1
```

This skips the highest salary and returns the second highest salary.

---

## 📊 Example 1

### Input

| id | salary |
| -: | -----: |
|  1 |    100 |
|  2 |    200 |
|  3 |    300 |

```text
N = 2
```

Sorted distinct salaries:

```text
300
200
100
```

The second highest salary is:

```text
200
```

### Output

| getNthHighestSalary(2) |
| ---------------------: |
|                    200 |

---

## 📊 Example 2

### Input

| id | salary |
| -: | -----: |
|  1 |    100 |

```text
N = 2
```

There is only one distinct salary.

The second position does not exist, so the function returns:

```text
NULL
```

### Output

| getNthHighestSalary(2) |
| ---------------------- |
| NULL                   |

---

## 🧪 Duplicate Salary Example

Suppose the table contains:

| id | salary |
| -: | -----: |
|  1 |    500 |
|  2 |    500 |
|  3 |    400 |
|  4 |    300 |

Distinct salaries:

```text
500
400
300
```

For:

```text
N = 2
```

the answer is:

```text
400
```

The duplicate `500` is counted only once because of `DISTINCT`.

---

## 🧠 Key SQL Concepts

### `DISTINCT`

Removes duplicate salary values.

```sql
SELECT DISTINCT salary
FROM Employee;
```

### `ORDER BY ... DESC`

Sorts values from highest to lowest.

```sql
ORDER BY salary DESC;
```

### `LIMIT`

Selects a specific row using an offset.

```sql
LIMIT offset, count;
```

---

## 🔑 Pattern to Remember

For the `nth` highest distinct value:

```sql
SELECT DISTINCT column_name
FROM table_name
ORDER BY column_name DESC
LIMIT N - 1, 1;
```

Inside this problem's function, `N` is first reduced by one and then used as the offset.

---

## 📚 What I Learned

* How to create a SQL function
* How to find the `nth` highest value
* Why `DISTINCT` is necessary
* How descending sorting works
* How `LIMIT` and offsets can select a specific ranked row
* How SQL naturally returns `NULL` when the requested row does not exist

---

## 🏷️ Tags

`SQL` `MySQL` `LeetCode` `Database` `Function` `DISTINCT` `ORDER BY` `LIMIT` `Medium`
