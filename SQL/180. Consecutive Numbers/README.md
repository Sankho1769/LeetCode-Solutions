# 180. Consecutive Numbers

**LeetCode:** [180. Consecutive Numbers](https://leetcode.com/problems/consecutive-numbers/)

**Difficulty:** Medium

**Topics:** SQL, Database, Self Join

**Status:** ✅ Solved

---

## 📌 Problem Description

Find all numbers that appear at least **three times consecutively** in the `Logs` table.

Return the result column named `ConsecutiveNums`. The result can be returned in any order.

---

## 🗃️ Database Schema

### `Logs`

| Column Name | Type | Description |
|---|---|---|
| `id` | int | Primary key, auto-incrementing from 1 |
| `num` | varchar | Logged number |

---

## 💡 Approach

We need to identify the same number appearing in three consecutive rows.

We can use a **self join** to match each row with the next two rows:

1. Match the next row using `id + 1`.
2. Match the row after that using `id + 2`.
3. Check that all three rows contain the same number.
4. Use `DISTINCT` to avoid duplicate results.

### Example

```text
id    num
1     1
2     1
3     1
4     2
5     1
6     2
7     2
```

The number `1` appears in three consecutive rows at IDs 1, 2, and 3.

Therefore, the result is `1`.

---

## ✅ SQL Solution

```sql
SELECT DISTINCT
    l1.num AS ConsecutiveNums
FROM Logs AS l1
JOIN Logs AS l2
    ON l2.id = l1.id + 1
   AND l2.num = l1.num
JOIN Logs AS l3
    ON l3.id = l1.id + 2
   AND l3.num = l1.num;
```

---

## 🔍 Explanation

### 1. First row

```sql
FROM Logs AS l1
```

Treats each row as a possible starting point for a sequence.

### 2. Match the next row

```sql
JOIN Logs AS l2
    ON l2.id = l1.id + 1
   AND l2.num = l1.num
```

Checks that the next ID contains the same number.

### 3. Match the third row

```sql
JOIN Logs AS l3
    ON l3.id = l1.id + 2
   AND l3.num = l1.num
```

Checks that the row two IDs ahead also contains the same number.

### 4. Remove duplicates

```sql
SELECT DISTINCT l1.num AS ConsecutiveNums
```

Returns each qualifying number only once, even if it appears in multiple sequences.

---

## 📊 Example

### Input

**Logs**

| id | num |
|---:|---|
| 1 | 1 |
| 2 | 1 |
| 3 | 1 |
| 4 | 2 |
| 5 | 1 |
| 6 | 2 |
| 7 | 2 |

### Output

| ConsecutiveNums |
|---|
| 1 |

### Explanation

The number `1` appears in three consecutive rows. The other numbers do not appear in a run of at least three consecutive rows.

---

## 🧠 Key SQL Concepts

- **Self join:** Joins a table with itself to compare different rows.
- **Consecutive IDs:** Uses `id + 1` and `id + 2` to identify adjacent rows.
- **`DISTINCT`:** Removes duplicate results.
- **Table aliases:** `l1`, `l2`, and `l3` represent three instances of the same table.

---

## 📚 What I Learned

- How to identify consecutive records using SQL.
- How to join a table to itself multiple times.
- How to compare values across three consecutive IDs.
- How to avoid duplicate results with `DISTINCT`.

---

## 🏷️ Tags

`SQL` `MySQL` `LeetCode` `Database` `Self Join` `DISTINCT` `Medium`
