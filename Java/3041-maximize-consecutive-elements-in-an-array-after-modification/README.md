# 3041. Maximize Consecutive Elements in an Array After Modification

**Difficulty:** Hard  
**Problem:** [LeetCode 3041 - Maximize Consecutive Elements in an Array After Modification](https://leetcode.com/problems/maximize-consecutive-elements-in-an-array-after-modification/)

## Problem Description

You are given a positive-integer array `nums`. Each element may be increased by at most `1`.

After these modifications, choose the largest possible subset whose values, when sorted, form a sequence of consecutive integers. Return the maximum number of selected elements.

## Approach: Sorting + Greedy Dynamic Programming

First, sort `nums`. Processing equal and nearby values in sorted order makes it possible to update the best consecutive sequence using only the previous value's state.

The solution maintains three variables:

- `keep`: best sequence length ending at the current original value without increasing that value.
- `bump`: best sequence length ending at the current original value plus one, when the current element is increased.
- `best`: maximum length found so far.

For each sorted value `x`, compare it with the previous original value `last`:

- **`x - last == 0`**: `x` is a duplicate. Use one copy as the increased value to extend the previous `keep` sequence: `bump = keep + 1`.
- **`x - last == 1`**: the current value can extend both tracked sequences, so increment `keep` and `bump`.
- **`x - last == 2`**: the current value can extend the previous `bump` sequence without modification. Set `keep = bump + 1` and reset `bump`.
- **Any other gap**: no consecutive sequence can connect across the gap, so reset both states to `1`.

After each value, update `best` from `keep` and `bump`.

## Java Solution

```java
import java.util.Arrays;

class Solution {
    public int maxSelectedElements(int[] nums) {
        Arrays.sort(nums);
        int best = 1, keep = 1, bump = 1, last = -10;

        for (int x : nums) {
            switch (x - last) {
                case 0 -> bump = keep + 1;
                case 1 -> {
                    keep++;
                    bump++;
                }
                case 2 -> {
                    keep = bump + 1;
                    bump = 1;
                }
                default -> {
                    keep = 1;
                    bump = 1;
                }
            }

            best = Math.max(best, Math.max(keep, bump));
            last = x;
        }

        return best;
    }
}
```

## Examples

**Example 1**

```text
Input: nums = [2,1,5,1,1]
Output: 3
```

After sorting: `[1,1,1,2,5]`. We can select values that become `[1,2,3]` by increasing selected elements by at most one.

**Example 2**

```text
Input: nums = [1,4,7,10]
Output: 1
```

No two values can be made consecutive, so the maximum selection contains one element.

## Complexity Analysis

Let `n` be the length of `nums`.

- **Time Complexity:** `O(n log n)` for sorting, followed by an `O(n)` scan.
- **Auxiliary Space Complexity:** `O(1)` for the DP state, excluding the sorting implementation's internal workspace.

## Key Concepts

- Sorting
- Greedy Dynamic Programming
- Consecutive Sequences
- State Optimization

## Git Commit Message

```text
feat: add LeetCode 3041 solution
```
