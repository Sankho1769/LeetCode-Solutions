# 1381. Design a Stack With Increment Operation

- **Platform:** LeetCode
- **Difficulty:** Medium
- **Language:** Java
- **Topics:** Stack, Array, Design, Lazy Propagation

## Approach: Lazy Increment Propagation

The implementation uses two fixed-size arrays:

- `stack[i]` stores the value pushed at index `i`.
- `increment[i]` stores an increment that is still pending for the prefix ending at index `i`.

The `increment(k, val)` operation records the increment at the boundary of the affected prefix instead of updating every element. When an element is popped, its pending increment is included in the returned value and propagated to the next lower element.

## Complexity Analysis

| Operation | Time Complexity |
|---|---:|
| Constructor | O(maxSize) |
| `push(x)` | O(1) |
| `pop()` | O(1) |
| `increment(k, val)` | O(1) |

**Space Complexity:** O(maxSize), for the two arrays.

## LeetCode Submission

Copy `CustomStack.java` into the Java editor for LeetCode problem 1381. LeetCode provides the test harness, so no `main` method is required.
