# 176. Second Highest Salary

**LeetCode:** [176. Second Highest Salary](https://leetcode.com/problems/second-highest-salary/)

**Difficulty:** Medium

**Topics:** SQL, Database, Subquery, Aggregate Functions

**Status:** ✅ Solved

---

## 📌 Problem Description

Write a solution to find the **second highest distinct salary** from the `Employee` table.

If there is no second highest salary, return `NULL`.

The salary must be **distinct**, meaning duplicate salary values should be treated as one value.

---

## 🗃️ Database Schema

### `Employee`

| Column Name | Type | Description       |
| ----------- | ---- | ----------------- |
| `id`        | int  | Primary key       |
| `salary`    | int  | Employee's salary |

---

## 💡 Approach

We need to find the **second highest distinct salary**.

A simple way is:

1. Find the highest salary using `MAX(salary)`.
2. Find the maximum salary that is **less than** the highest salary.
3. If no such salary exists, `MAX()` returns `NULL`.

The main idea is:

```text
Highest Salary
      ↓
Find salaries smaller than it
      ↓
Take MAX()
      ↓
Second Highest Salary
```

---

## ✅ SQL Solution

```sql
SELECT
    MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);
```

---

## 🔍 Explanation

### Step 1: Find the highest salary

```sql
SELECT MAX(salary)
FROM Employee;
```

For:

```text
100
200
300
```

the result is:

```text
300
```

---

### Step 2: Ignore the highest salary

The condition:

```sql
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
)
```

keeps only salaries smaller than the highest salary.

For example:

```text
100
200
```

---

### Step 3: Find the highest remaining salary

```sql
MAX(salary)
```

returns:

```text
200
```

Therefore:

```text
SecondHighestSalary
-------------------
200
```

---

## 📊 Example 1

### Input

**Employee**

| id | salary |
| -: | -----: |
|  1 |    100 |
|  2 |    200 |
|  3 |    300 |

### Output

| SecondHighestSalary |
| ------------------: |
|                 200 |

### Explanation

The highest salary is `300`.

Among the remaining salaries (`100`, `200`), the highest is `200`.

Therefore, the second highest distinct salary is `200`.

---

## 📊 Example 2

### Input

**Employee**

| id | salary |
| -: | -----: |
|  1 |    100 |

### Output

| SecondHighestSalary |
| ------------------- |
| NULL                |

### Explanation

There is only one distinct salary.

After excluding the highest salary, there are no salaries remaining.

Therefore:

```text
SecondHighestSalary = NULL
```

---

## 🧪 Duplicate Salary Example

Consider:

| id | salary |
| -: | -----: |
|  1 |    300 |
|  2 |    300 |
|  3 |    200 |
|  4 |    100 |

The distinct salaries are:

```text
300
200
100
```

The highest salary is:

```text
300
```

The highest salary below `300` is:

```text
200
```

So the result is:

```text
SecondHighestSalary
-------------------
200
```

The query handles duplicates correctly because it searches for the maximum value below the overall maximum.

---

## 🧠 Key SQL Concepts

### `MAX()`

`MAX()` returns the largest value in a column.

```sql
SELECT MAX(salary)
FROM Employee;
```

---

### Subquery

The following is a subquery:

```sql
(
    SELECT MAX(salary)
    FROM Employee
)
```

It is used to determine the highest salary before finding the second highest.

---

### `WHERE salary < ...`

This condition removes the highest salary from consideration:

```sql
WHERE salary < highest_salary
```

Then `MAX(salary)` finds the next largest distinct value.

---

## ❓ Why Does This Return `NULL`?

Suppose the table contains only:

```text
100
```

The query becomes conceptually:

```sql
SELECT MAX(salary)
FROM Employee
WHERE salary < 100;
```

There are no matching rows.

For an aggregate `MAX()` over no matching non-null values, the result is `NULL`.

That matches the problem requirement.

---

## ⏱️ Complexity

The exact execution cost depends on the database engine and indexes.

Conceptually, the query performs two aggregate operations over `Employee`. With an appropriate index and optimizer, the database may execute this efficiently.

---

## 📚 What I Learned

* How to find the second highest value using `MAX()`
* How to use a subquery inside `WHERE`
* How to handle **distinct** values
* How aggregate functions behave when no rows match
* How SQL returns `NULL` when a second highest value does not exist

---

## 🔑 Pattern to Remember

For finding the second highest distinct value:

```sql
SELECT MAX(column_name)
FROM table_name
WHERE column_name < (
    SELECT MAX(column_name)
    FROM table_name
);
```

This pattern can be adapted to many SQL problems involving the **second highest value**.

---

## 🏷️ Tags

`SQL` `MySQL` `LeetCode` `Database` `Subquery` `MAX` `Aggregate Functions` `Medium`
