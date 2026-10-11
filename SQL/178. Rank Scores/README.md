# 178. Rank Scores

**LeetCode:** [178. Rank Scores](https://leetcode.com/problems/rank-scores/)

**Difficulty:** Medium

**Topics:** SQL, Database, Subquery, Aggregate Functions, Ranking

**Status:** ✅ Solved

---

## 📌 Problem Description

Write a solution to rank the scores in the `Scores` table according to the following rules:

- Scores are ranked from highest to lowest.
- Equal scores receive the same rank.
- Rankings must have no gaps after ties.
- Return the results ordered by score in descending order.

---

## 🗃️ Database Schema

### `Scores`

| Column Name | Type | Description |
|---|---|---|
| `id` | int | Primary key |
| `score` | decimal | Game score |

---

## 💡 Approach

We can calculate the rank of each score using a **correlated subquery** with `COUNT(DISTINCT ...)`.

For each score, count the number of distinct scores that are greater than or equal to it.

This produces consecutive rankings without gaps.

### Example

Given these scores:

```text
Score
-----
4.00
4.00
3.85
3.65
3.65
3.50
```

The distinct scores greater than or equal to each score determine its rank.

| Score | Rank |
|---:|---:|
| 4.00 | 1 |
| 4.00 | 1 |
| 3.85 | 2 |
| 3.65 | 3 |
| 3.65 | 3 |
| 3.50 | 4 |

---

## ✅ SQL Solution

```sql
SELECT
    s.score,
    (
        SELECT COUNT(DISTINCT s2.score)
        FROM Scores AS s2
        WHERE s2.score >= s.score
    ) AS `rank`
FROM Scores AS s
ORDER BY s.score DESC;
```

---

## 🔍 Explanation

### 1. Outer query

```sql
SELECT s.score
FROM Scores AS s
```

Retrieves each score from the table.

### 2. Correlated subquery

```sql
SELECT COUNT(DISTINCT s2.score)
FROM Scores AS s2
WHERE s2.score >= s.score
```

Counts the distinct scores greater than or equal to the current score.

The subquery references `s.score` from the outer query, so it is a correlated subquery.

### 3. Why `COUNT(DISTINCT ...)`?

`DISTINCT` prevents duplicate scores from increasing the rank.

For example, if the scores are `100, 100, 90`, the rank of `90` is `2`, not `3`.

### 4. Why `ORDER BY DESC`?

```sql
ORDER BY s.score DESC;
```

Displays the highest score first.

### 5. Why use backticks around `rank`?

```sql
AS `rank`
```

Backticks safely delimit the requested output column name.

---

## 📊 Example

### Input

**Scores**

| id | score |
|---:|---:|
| 1 | 3.50 |
| 2 | 3.65 |
| 3 | 4.00 |
| 4 | 3.85 |
| 5 | 4.00 |
| 6 | 3.65 |

### Output

| score | rank |
|---:|---:|
| 4.00 | 1 |
| 4.00 | 1 |
| 3.85 | 2 |
| 3.65 | 3 |
| 3.65 | 3 |
| 3.50 | 4 |

---

## 🧠 Key SQL Concepts

- **Correlated subquery:** A subquery that references a column from the outer query.
- **`COUNT(DISTINCT ...)`:** Counts unique values while ignoring duplicates.
- **`ORDER BY DESC`:** Sorts results from highest to lowest.
- **Ranking without gaps:** Equal scores share a rank, and the next distinct score receives the next consecutive rank.

### Alternative Using `DENSE_RANK()`

Modern MySQL versions also support window functions, allowing a shorter solution:

```sql
SELECT
    score,
    DENSE_RANK() OVER (
        ORDER BY score DESC
    ) AS `rank`
FROM Scores
ORDER BY score DESC;
```

`DENSE_RANK()` directly implements the required ranking behavior.

---

## 📚 What I Learned

- How to rank values using SQL.
- How correlated subqueries work.
- How `COUNT(DISTINCT ...)` handles duplicate values.
- The difference between rankings with gaps and rankings without gaps.
- How to use `DENSE_RANK()` as a window function.

---

## 🏷️ Tags

`SQL` `MySQL` `LeetCode` `Database` `Subquery` `COUNT` `DISTINCT` `DENSE_RANK` `Medium`
