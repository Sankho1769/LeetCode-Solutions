# 946. Validate Stack Sequences

**Difficulty:** Medium  
**Problem:** [LeetCode 946 - Validate Stack Sequences](https://leetcode.com/problems/validate-stack-sequences/)

## Problem Description

Given two arrays, `pushed` and `popped`, containing distinct values, determine whether `popped` could be produced by pushing the values of `pushed` onto an initially empty stack in their given order and popping values when desired.

Return `true` if the sequence is possible; otherwise, return `false`.

## Approach

Simulate the stack operations using a stack and a pointer `j` to the next value expected in `popped`.

1. Iterate through `pushed` and push each value onto the stack.
2. After each push, while the stack is not empty and its top equals `popped[j]`, pop the stack and advance `j`.
3. Once all values from `pushed` have been processed, the sequence is valid if every value in `popped` was matched (`j == popped.length`).

Using `ArrayDeque` provides stack operations without the legacy `Stack` class.

## Java Solution

```java
import java.util.ArrayDeque;
import java.util.Deque;

class Solution {
    public boolean validateStackSequences(int[] pushed, int[] popped) {
        Deque<Integer> stack = new ArrayDeque<>();
        int j = 0;

        for (int value : pushed) {
            stack.push(value);

            while (!stack.isEmpty() && j < popped.length
                    && stack.peek() == popped[j]) {
                stack.pop();
                j++;
            }
        }

        return j == popped.length;
    }
}
```

## Example 1

**Input**

```text
pushed = [1, 2, 3, 4, 5]
popped = [4, 5, 3, 2, 1]
```

The simulation can push `1, 2, 3, 4`, pop `4`, push `5`, and then pop `5, 3, 2, 1` in order.

**Output**

```text
true
```

## Example 2

**Input**

```text
pushed = [1, 2, 3, 4, 5]
popped = [4, 3, 5, 1, 2]
```

After popping `4`, the next expected value is `3`, but `5` must be pushed before `3` can be popped. This sequence cannot be completed in the requested order.

**Output**

```text
false
```

## Complexity Analysis

- **Time Complexity:** `O(n)` — each value is pushed and popped at most once.
- **Space Complexity:** `O(n)` — in the worst case, the stack holds all pushed values.

## Key Concepts

- Stack simulation
- Greedy matching
- Array traversal
- `ArrayDeque`
