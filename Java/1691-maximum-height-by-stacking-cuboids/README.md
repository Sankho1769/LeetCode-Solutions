# 1691. Maximum Height by Stacking Cuboids

- **Platform:** LeetCode
- **Difficulty:** Hard
- **Language:** Java
- **Approach:** Sorting + Top-Down Dynamic Programming (Memoization)

## Problem

Given cuboids whose dimensions can be rearranged by rotation, choose and stack a subset to maximize the total stack height. A cuboid can be placed on another when all three of its dimensions are less than or equal to the corresponding dimensions of the bottom cuboid.

## Key idea

1. **Normalize each cuboid.** Sort its three dimensions in ascending order. This represents all possible rotations with one canonical orientation.
2. **Sort all cuboids lexicographically.** A cuboid that can support another will occur at the same or a later position in this order.
3. **Use memoized DFS.** `dp[i]` stores the maximum stack height when cuboid `i` is the topmost cuboid. Try every later cuboid that can be placed below it.

## Java solution

See [`Solution.java`](./Solution.java).

### DP definition

`solve(i)` returns the maximum achievable height of a stack whose topmost cuboid is `i`.

Base choice:

```text
dp[i] = height[i]
```

Transition for every compatible cuboid `j` below `i`:

```text
dp[i] = max(dp[i], height[i] + solve(j))
```

The answer is the maximum `solve(i)` over all possible topmost cuboids.

## Example walkthrough

Input:

```text
[[50,45,20], [95,37,53], [45,23,12]]
```

After normalizing and sorting:

```text
[12, 23, 45]
[20, 45, 50]
[37, 53, 95]
```

The three cuboids can be stacked in that order from top to bottom, producing:

```text
45 + 50 + 95 = 190
```

Output:

```text
190
```

## Complexity analysis

Let `n` be the number of cuboids.

- Normalizing dimensions: `O(n)` because each cuboid has exactly three dimensions.
- Sorting cuboids: `O(n log n)`.
- Memoized DP: `O(n^2)`. Each of the `n` states scans at most `n` later cuboids, and each state is computed once.
- Auxiliary space: `O(n)` for the DP array and up to `O(n)` recursion depth. The normalized cuboid copy also uses `O(n)` space because each cuboid has three dimensions.

**Overall time:** `O(n^2)`  
**Auxiliary space:** `O(n)`

## Correctness notes

- Sorting each cuboid's dimensions is valid because rotations are unrestricted.
- The component-wise comparison checks the exact stacking condition.
- Lexicographical sorting ensures any cuboid that can fit below the current cuboid is at the same or a later sorted position. Equal dimensions are allowed, so identical cuboids can be stacked.
- Memoization evaluates each state once while considering every valid next cuboid, so the recurrence finds the maximum possible stack height.

## Commit message

```text
Solve LeetCode 1691 with sorting and memoized DP
```

## LeetCode submission

Copy `Solution.java` into LeetCode's Java editor. The `Solution` class is intentionally package-free and has no `main` method, as expected by LeetCode.
