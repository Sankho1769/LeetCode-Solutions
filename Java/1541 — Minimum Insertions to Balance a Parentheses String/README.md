# 1541. Minimum Insertions to Balance a Parentheses String

**Difficulty:** Medium  
**Topics:** Greedy, String  
**Language:** Java

## Problem

Given a string `s` containing only `(` and `)`, return the minimum number of insertions needed to make it balanced.

Each opening parenthesis `(` must have two consecutive closing parentheses `))` as its match. Insertions can be made at any position in the string.

## Approach: Greedy

Track two values:

- `insertions`: the number of characters inserted so far.
- `need`: the number of closing parentheses `)` still required.

Scan the string from left to right:

1. When the character is `(`, add `2` to `need`.
2. If `need` is odd, insert one `)` to complete the previous closing pair and decrement `need` by `1`.
3. When the character is `)`, decrement `need` by `1`.
4. If `need` becomes negative, there is no unmatched `(` for this `)`. Insert one `(` and set `need` to `1`.
5. After processing every character, add the remaining `need` to `insertions`.

## Java Solution

```java
class Solution {
    public int minInsertions(String s) {
        int insertions = 0;
        int need = 0;

        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);

            if (ch == '(') {
                need += 2;

                if (need % 2 != 0) {
                    insertions++;
                    need--;
                }
            } else {
                need--;

                if (need < 0) {
                    insertions++;
                    need = 1;
                }
            }
        }

        return insertions + need;
    }
}
```

## Example

**Input:**

```text
s = "(()))"
```

**Output:**

```text
1
```

**Explanation:** One additional `)` is needed to give each `(` two corresponding consecutive closing parentheses. The balanced string is `(())))`.

## Complexity Analysis

- **Time Complexity:** `O(n)` — each character is processed once.
- **Space Complexity:** `O(1)` — only a fixed number of variables are used.

## Key Takeaway

The greedy counter tracks how many closing parentheses are required at every step, making a stack unnecessary.

## Git Commit Message

```text
feat: add LeetCode 1541 solution
```
