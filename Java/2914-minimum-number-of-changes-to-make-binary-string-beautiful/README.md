# 2914. Minimum Number of Changes to Make Binary String Beautiful

**Difficulty:** Medium  
**Problem:** [LeetCode 2914 - Minimum Number of Changes to Make Binary String Beautiful](https://leetcode.com/problems/minimum-number-of-changes-to-make-binary-string-beautiful/)

## Problem Description

You are given an even-length binary string `s`. A string is beautiful if it can be partitioned into one or more even-length substrings, where each substring contains only `0`s or only `1`s.

Return the minimum number of character changes needed to make `s` beautiful.

## Approach: Greedy Pairing

Because every valid substring has even length, every boundary between consecutive substrings must occur at an even index. Therefore, the string can be considered as fixed adjacent pairs:

```text
(s[0], s[1]), (s[2], s[3]), ...
```

For each pair:

- If both characters are equal, the pair is already valid and needs no changes.
- If the characters differ, at least one character must be changed. Changing either one makes that pair uniform, so exactly one change is sufficient.

The pairs do not overlap, so the minimum number of changes is simply the number of mismatched pairs.

## Java Solution

```java
class Solution {
    public int minChanges(String s) {
        int count = 0;

        for (int i = 0; i < s.length() - 1; i += 2) {
            if (s.charAt(i) != s.charAt(i + 1)) {
                count++;
            }
        }

        return count;
    }
}
```

## Examples

### Example 1

**Input:**

```text
s = "1001"
```

Pairs: `10` and `01`. Both pairs contain different characters, so each needs one change.

**Output:**

```text
2
```

One possible result is `1100`, partitioned as `11|00`.

### Example 2

**Input:**

```text
s = "10"
```

The only pair is `10`, so one change is required.

**Output:**

```text
1
```

### Example 3

**Input:**

```text
s = "0000"
```

Both pairs (`00` and `00`) are already uniform.

**Output:**

```text
0
```

## Complexity Analysis

- **Time Complexity:** `O(n)` — each character is checked once as part of a pair.
- **Space Complexity:** `O(1)` — only a counter is used.

## Key Concepts

- Greedy Algorithm
- String Traversal
- Pairwise Comparison
- Constant Extra Space

## Git Commit Message

```text
git commit -m "feat: add LeetCode 2914 solution"
```
