# 3619. Count Islands With Total Value Divisible by K

**Difficulty:** Medium  
**Problem:** [LeetCode 3619 - Count Islands With Total Value Divisible by K](https://leetcode.com/problems/count-islands-with-total-value-divisible-by-k/)

## Problem Description

You are given an `m x n` grid of non-negative integers and a positive integer `k`.

A land cell is any cell with a positive value. An island is a maximal group of land cells connected horizontally or vertically. The value of an island is the sum of all values in its cells.

Return the number of islands whose total value is divisible by `k`.

## Approach

Use **iterative depth-first search (DFS)** to discover each island and calculate its total value.

1. Scan every cell in the grid.
2. When a positive cell is found, start a DFS with an explicit stack.
3. Add each discovered cell's value to the island sum, then set that cell to `0` so it will not be visited again.
4. Visit its four neighbors: up, down, left, and right.
5. When the island is fully explored, check whether `islandSum % k == 0`. If so, increment the answer.

The island sum uses `long` because up to `10^5` cells can each contain a value as large as `10^6`.

### Why iterative DFS?

A single island can contain up to `10^5` cells. An explicit stack avoids the call-stack overflow risk of recursive DFS on a very large connected island.

## Java Solution

```java
class Solution {
    public int countIslands(int[][] grid, int k) {
        if (grid == null || grid.length == 0 || grid[0].length == 0) {
            return 0;
        }

        int m = grid.length;
        int n = grid[0].length;
        int[] stack = new int[m * n];
        int count = 0;

        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == 0) {
                    continue;
                }

                int top = 0;
                long islandSum = grid[i][j];
                stack[top++] = i * n + j;
                grid[i][j] = 0;

                while (top > 0) {
                    int cell = stack[--top];
                    int r = cell / n;
                    int c = cell % n;

                    if (r > 0 && grid[r - 1][c] > 0) {
                        islandSum += grid[r - 1][c];
                        grid[r - 1][c] = 0;
                        stack[top++] = (r - 1) * n + c;
                    }

                    if (r + 1 < m && grid[r + 1][c] > 0) {
                        islandSum += grid[r + 1][c];
                        grid[r + 1][c] = 0;
                        stack[top++] = (r + 1) * n + c;
                    }

                    if (c > 0 && grid[r][c - 1] > 0) {
                        islandSum += grid[r][c - 1];
                        grid[r][c - 1] = 0;
                        stack[top++] = r * n + c - 1;
                    }

                    if (c + 1 < n && grid[r][c + 1] > 0) {
                        islandSum += grid[r][c + 1];
                        grid[r][c + 1] = 0;
                        stack[top++] = r * n + c + 1;
                    }
                }

                if (islandSum % k == 0) {
                    count++;
                }
            }
        }

        return count;
    }
}
```

## Example 1

**Input**

```text
grid = [[0,2,1,0,0],
        [0,5,0,0,5],
        [0,0,1,0,0],
        [0,1,4,7,0],
        [0,2,0,0,8]]
k = 5
```

**Output**

```text
2
```

There are four islands; two have a total value divisible by `5`.

## Complexity Analysis

Let `m` be the number of rows and `n` be the number of columns.

- **Time Complexity:** `O(m * n)` because each cell is visited at most once.
- **Space Complexity:** `O(m * n)` for the explicit DFS stack in the worst case.

## Important Note

This solution modifies `grid` by setting visited land cells to `0`. This is safe for the usual LeetCode judge, which does not require the input grid to remain unchanged.

## Key Concepts

- Grid Traversal
- Connected Components
- Depth-First Search (DFS)
- Iterative Stack
- Island Sum
- Modulo Arithmetic
