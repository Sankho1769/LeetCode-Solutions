# 1267. Count Servers that Communicate

**Difficulty:** Medium  
**Problem:** [LeetCode 1267 - Count Servers that Communicate](https://leetcode.com/problems/count-servers-that-communicate/)

## Problem Description

You are given an `m x n` grid where `1` represents a server and `0` represents an empty cell.

A server can communicate with another server when both are in the same row or the same column.

Return the number of servers that can communicate with at least one other server.

## Approach: Row and Column Counting

We use two passes through the grid and two frequency arrays.

### 1. Count servers in each row and column

- `countRow[i]` stores the number of servers in row `i`.
- `countCol[j]` stores the number of servers in column `j`.

Whenever `grid[i][j] == 1`, increment both counters.

### 2. Count communicating servers

Traverse the grid again. A server at `(i, j)` can communicate when:

```java
countRow[i] > 1 || countCol[j] > 1
```

The condition uses OR because sharing either a row or a column is enough. Count each qualifying server exactly once.

## Java Solution

```java
class Solution {
    public int countServers(int[][] grid) {
        int rows = grid.length;
        int cols = grid[0].length;

        int[] countRow = new int[rows];
        int[] countCol = new int[cols];

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (grid[i][j] == 1) {
                    countRow[i]++;
                    countCol[j]++;
                }
            }
        }

        int result = 0;

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (grid[i][j] == 1 && (countRow[i] > 1 || countCol[j] > 1)) {
                    result++;
                }
            }
        }

        return result;
    }
}
```

## Example 1

**Input:**

```text
grid = [[1,0],
        [0,1]]
```

Each server is alone in its row and column, so neither can communicate.

**Output:**

```text
0
```

## Example 2

**Input:**

```text
grid = [[1,0],
        [1,1]]
```

All three servers share a row or a column with another server.

**Output:**

```text
3
```

## Example 3

**Input:**

```text
grid = [[1,1,0,0],
        [0,0,1,0],
        [0,0,1,0],
        [0,0,0,1]]
```

The two servers in the first row communicate, and the two servers in the third column communicate. The bottom-right server cannot communicate with any other server.

**Output:**

```text
4
```

## Complexity Analysis

Let `m` be the number of rows and `n` be the number of columns.

- **Time Complexity:** `O(m * n)` — the grid is traversed twice.
- **Space Complexity:** `O(m + n)` — the row and column counters are stored in two arrays.

## Key Concepts

- Matrix Traversal
- Frequency Counting
- Row and Column Counting
- Two-Pass Approach
