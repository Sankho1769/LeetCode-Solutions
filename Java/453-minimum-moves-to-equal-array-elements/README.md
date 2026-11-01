# 453. Minimum Moves to Equal Array Elements

**Difficulty:** Medium  
**Problem:** [LeetCode 453 - Minimum Moves to Equal Array Elements](https://leetcode.com/problems/minimum-moves-to-equal-array-elements/)

## Problem Description

Given an integer array `nums`, return the minimum number of moves needed to make every element equal.

In one move, you can increment exactly `n - 1` elements by `1`.

## Approach: Find the Minimum Element

Incrementing `n - 1` elements by `1` has the same effect on the differences between array elements as decrementing the one excluded element by `1`.

Therefore, an optimal strategy is to make every element equal to the smallest element by considering the equivalent operation of reducing all other elements.

If the minimum value is `min`, each element `nums[i]` needs `nums[i] - min` moves relative to the minimum. The total answer is:

```text
sum(nums[i] - min)
```

### Algorithm

1. Traverse the array to find its smallest element.
2. Traverse the array again and add `num - smallestNum` for each element.
3. Return the total.

## Java Solution

```java
class Solution {
    public int minMoves(int[] nums) {
        int smallestNum = Integer.MAX_VALUE;

        for (int num : nums) {
            smallestNum = Math.min(num, smallestNum);
        }

        int minMoves = 0;

        for (int num : nums) {
            minMoves += num - smallestNum;
        }

        return minMoves;
    }
}
```

## Example 1

**Input:**

```text
nums = [1, 2, 3]
```

The minimum element is `1`.

```text
(1 - 1) + (2 - 1) + (3 - 1)
= 0 + 1 + 2
= 3
```

**Output:**

```text
3
```

## Example 2

**Input:**

```text
nums = [1, 1, 1]
```

Every element is already equal, so no moves are required.

**Output:**

```text
0
```

## Complexity Analysis

- **Time Complexity:** `O(n)` — the array is traversed twice.
- **Space Complexity:** `O(1)` — only a few variables are used.

## Key Concepts

- Greedy reasoning
- Array traversal
- Minimum element
- Mathematical transformation

## Git Commit Message

```text
feat: add LeetCode 453 solution
```
