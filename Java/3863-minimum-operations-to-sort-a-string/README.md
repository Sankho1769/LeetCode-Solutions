# 3863. Minimum Operations to Sort a String

**Difficulty:** Medium  
**Problem:** [LeetCode 3863 - Minimum Operations to Sort a String](https://leetcode.com/problems/minimum-operations-to-sort-a-string/)

## Problem Description

You are given a string `s` containing lowercase English letters. In one operation, you may choose any substring that is not the entire string and sort that substring in non-decreasing alphabetical order.

Return the minimum number of operations required to sort the entire string. If it is impossible, return `-1`.

## Approach

The solution determines the answer using the string's sorted status, its length, and the positions of its minimum and maximum characters.

1. Scan the string to determine whether it is already sorted and to find its minimum and maximum characters.
2. If the string is already sorted, return `0`.
3. If the string has length `2` and is not sorted, return `-1`, because the only substring that could change its order would be the entire string, which is not allowed.
4. If the first character is the minimum character or the last character is the maximum character, the answer is `1`.
5. Otherwise, if the minimum or maximum character appears in an interior position, the answer is `2`.
6. If none of those conditions applies, the answer is `3`.

## Java Solution

```java
class Solution {
    public int minOperations(String s) {
        int n = s.length();
        boolean sorted = true;
        char min = s.charAt(0);
        char max = s.charAt(0);

        for (int i = 1; i < n; i++) {
            char ch = s.charAt(i);
            min = (char) Math.min(min, ch);
            max = (char) Math.max(max, ch);

            if (ch < s.charAt(i - 1)) {
                sorted = false;
            }
        }

        if (sorted) {
            return 0;
        }

        if (n == 2) {
            return -1;
        }

        if (s.charAt(0) == min || s.charAt(n - 1) == max) {
            return 1;
        }

        for (int i = 1; i < n - 1; i++) {
            if (s.charAt(i) == min || s.charAt(i) == max) {
                return 2;
            }
        }

        return 3;
    }
}
```

## Examples

### Example 1

**Input**

```text
s = "dog"
```

**Output**

```text
1
```

Sort the substring `"og"` to obtain `"dgo"`.

### Example 2

**Input**

```text
s = "card"
```

**Output**

```text
2
```

### Example 3

**Input**

```text
s = "gf"
```

**Output**

```text
-1
```

## Complexity Analysis

- **Time Complexity:** `O(n)` — the string is scanned a constant number of times.
- **Auxiliary Space Complexity:** `O(1)` — only a fixed number of variables are used.

## Key Concepts

- String Traversal
- Greedy Reasoning
- Minimum and Maximum Characters
- Edge-Case Handling
