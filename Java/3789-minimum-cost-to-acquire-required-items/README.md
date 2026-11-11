# 3789. Minimum Cost to Acquire Required Items

**Difficulty:** Medium  
**Problem:** [LeetCode 3789 - Minimum Cost to Acquire Required Items](https://leetcode.com/problems/minimum-cost-to-acquire-required-items/)

## Problem Description

You are given the costs of three item types and the required quantities of two item types:

- A type 1 item costs `cost1` and contributes one unit toward requirement 1.
- A type 2 item costs `cost2` and contributes one unit toward requirement 2.
- A type 3 item costs `costBoth` and contributes one unit toward both requirements.

Buy enough items to satisfy both requirements while minimizing the total cost. Return the minimum cost as a `long`.

## Approach: Greedy — Check Three Candidate Strategies

Let `a = need1` and `b = need2`. Suppose we buy `t` type 3 items. They satisfy `t` units of both requirements, so the remaining quantities are `max(0, a - t)` and `max(0, b - t)`.

The total cost is therefore:

```text
cost(t) = t * costBoth
        + max(0, a - t) * cost1
        + max(0, b - t) * cost2
```

This cost is piecewise linear. Its slope can change only at `t = min(a, b)` and `t = max(a, b)`. Consequently, a minimum is attained at one of the three candidate values:

1. **Buy no combined items (`t = 0`)**: buy all type 1 and type 2 items separately.
2. **Cover the smaller requirement (`t = min(a, b)`)**: use combined items for the overlap, then buy the remaining larger requirement separately.
3. **Cover the larger requirement (`t = max(a, b)`)**: buy enough combined items to satisfy both requirements, possibly receiving extra units of the smaller requirement.

Calculate all three costs and return the minimum. Using `long` for every multiplication and total prevents integer overflow.

## Java Solution

```java
class Solution {
    public long minimumCost(int cost1, int cost2, int costBoth, int need1, int need2) {
        long ans = Long.MAX_VALUE;

        ans = Math.min(ans, (long) need1 * cost1 + (long) need2 * cost2);

        long min = Math.min(need1, need2);
        ans = Math.min(ans,
                min * costBoth
                + (long) (need1 - min) * cost1
                + (long) (need2 - min) * cost2);

        long max = Math.max(need1, need2);
        ans = Math.min(ans,
                max * costBoth
                + (long) Math.max(0, need1 - max) * cost1
                + (long) Math.max(0, need2 - max) * cost2);

        return ans;
    }
}
```

## Examples

### Example 1

```text
cost1 = 3, cost2 = 2, costBoth = 1
need1 = 3, need2 = 2
```

Buying two combined items and one type 1 item costs `2 * 1 + 1 * 3 = 5`. Buying three combined items costs `3 * 1 = 3`, which is the cheapest candidate.

**Output:** `3`

### Example 2

```text
cost1 = 5, cost2 = 4, costBoth = 15
need1 = 2, need2 = 3
```

Combined items are too expensive, so buying separately costs `2 * 5 + 3 * 4 = 22`.

**Output:** `22`

### Example 3

```text
cost1 = 5, cost2 = 4, costBoth = 15
need1 = 0, need2 = 0
```

No items are required, so the minimum cost is `0`.

**Output:** `0`

## Complexity Analysis

- **Time Complexity:** `O(1)` — only three candidate costs are calculated.
- **Space Complexity:** `O(1)` — only a constant number of variables are used.

## Key Concepts

- Greedy Algorithm
- Piecewise Linear Cost Function
- Mathematical Optimization
- Overflow Prevention with `long`
