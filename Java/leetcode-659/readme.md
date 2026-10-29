# 659. Split Array into Consecutive Subsequences

- **Platform:** LeetCode
- **Difficulty:** Medium
- **Topics:** Greedy, Hash Table
- **Language:** Java

## Problem Explanation

You are given an integer array `nums` sorted in non-decreasing order. Determine whether every element can be used exactly once to form one or more subsequences that satisfy both rules:

1. Each subsequence contains consecutive increasing integers. For example, `[2, 3, 4]` is valid, but `[2, 4, 5]` is not.
2. Each subsequence has a length of at least `3`.

Return `true` if such a split is possible; otherwise, return `false`.

### Example

**Input**

```text
nums = [1, 2, 3, 3, 4, 5]
```

**Output**

```text
true
```

One valid split is `[1, 2, 3]` and `[3, 4, 5]`.

## Solution Logic: Greedy with Two Hash Maps

The solution processes numbers in sorted order and makes a greedy choice for each unused occurrence.

### 1. `freq` — remaining occurrences

`freq[num]` stores how many unused occurrences of `num` remain in the array. When a number is assigned to a subsequence, its frequency is reduced.

### 2. `tails` — subsequences by ending number

`tails[num]` stores how many existing subsequences currently end at `num`.

For each number `num` that still has an unused occurrence, apply these rules in order:

1. **Extend an existing subsequence.** If a subsequence ends at `num - 1`, append `num` to it. Decrease `tails[num - 1]` and increase `tails[num]`.
2. **Otherwise, create a subsequence of length three.** If unused occurrences of both `num + 1` and `num + 2` exist, create `[num, num + 1, num + 2]`. Consume those two future occurrences and record a subsequence ending at `num + 2`.
3. **Otherwise, return `false`.** This occurrence cannot be assigned without creating a subsequence shorter than three or breaking consecutiveness.

After successfully extending or creating a subsequence, consume the current occurrence of `num` by decreasing `freq[num]`.

### Why this greedy strategy works

The algorithm first tries to extend a subsequence that already exists. If that is not possible, it starts a new subsequence only when the next two consecutive values are available, ensuring the new subsequence immediately has the minimum required length of three. Because the array is sorted, this local decision processes values in order without needing to rearrange elements. If neither choice is possible for an unused value, no valid split can include that occurrence, so returning `false` is correct.

## Complexity Analysis

Let `n` be the number of elements in `nums`.

- **Time:** `O(n)` average. Building the frequency map and processing each element use hash-map operations that take constant time on average.
- **Space:** `O(n)`. The `freq` and `tails` maps can each store up to `O(n)` distinct keys.

## Java Solution

The complete implementation is in [`solution.java`](solution.java).

## Commit Message

```text
Add greedy hash-map solution for LeetCode 659
```
