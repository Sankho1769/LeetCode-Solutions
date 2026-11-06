# 936. Stamping The Sequence

- **LeetCode:** [936. Stamping The Sequence](https://leetcode.com/problems/stamping-the-sequence/)
- **Difficulty:** Hard
- **Topics:** String, Greedy, Queue, Graph
- **Language:** Java

## Approach: Reverse Greedy + Dependency Graph

Instead of constructing `target` from a string of question marks, reverse the process. Start with `target` and repeatedly erase a window that matches `stamp` at every position that has not already been erased.

The implementation maintains:

- `mismatchCount[start]`: the number of un-erased positions in a window that do not match the corresponding stamp character.
- `waitingByPosition[position]`: the windows whose mismatch depends on that target position.
- A queue of windows whose mismatch count has reached zero.
- `erased[position]`: whether a target position has already been erased.

Whenever a position is erased, only the windows listed for that position are updated. This avoids rescanning every possible window after each operation. Once all positions are erased, reverse the collected erasure positions to get the forward stamping sequence.

## Java Solution

See [`Solution.java`](./Solution.java).

## Complexity Analysis

Let `n = target.length()` and `m = stamp.length()`.

- **Time:** `O(n * m)` — each window is initialized across at most `m` positions, and each dependency is processed at most once.
- **Space:** `O(n * m)` — the dependency graph stores at most one entry per window-position pair.

## Example

```text
stamp  = "abc"
target = "ababc"
result = [0, 2]
```

The reverse process erases the window at index `2`, then the window at index `0`. Reversing those operations produces the valid forward stamping sequence `[0, 2]`.

## Key Interview Insight

Reverse simulation turns a construction problem into a greedy elimination problem. The dependency graph and queue ensure that only windows affected by a newly erased position are revisited.

## Compile (optional)

```bash
javac Solution.java
```

LeetCode provides the `Solution` class directly, so no `main` method is required.
