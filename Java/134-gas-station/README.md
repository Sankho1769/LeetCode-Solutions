# 134. Gas Station

- **Platform:** LeetCode
- **Difficulty:** Medium
- **Topics:** Array, Greedy
- **Language:** Java

## Problem

There are `n` gas stations arranged in a circle. `gas[i]` is the amount of gas available at station `i`, and `cost[i]` is the gas required to travel from station `i` to the next station.

Return the starting station's index if it is possible to complete one full circuit. Otherwise, return `-1`.

## Approach: Greedy (Single Pass)

For each station, calculate its net gas balance:

```text
balance = gas[i] - cost[i]
```

Maintain three variables:

- `total`: The net gas balance across the entire circuit. If it is negative, completing the circuit is impossible.
- `tank`: The running balance from the current candidate starting station.
- `start`: The current candidate starting station.

When `tank` becomes negative at station `i`, the current candidate and every station between that candidate and `i` can be ruled out as starting points. Set the next candidate to `i + 1` and reset `tank` to zero.

After one traversal, return `start` if `total >= 0`; otherwise, return `-1`.

## Java Solution

See [`Solution.java`](Solution.java).

## Complexity Analysis

- **Time Complexity:** `O(n)` — each station is processed exactly once.
- **Auxiliary Space Complexity:** `O(1)` — only a fixed number of variables are used.

## Example

```text
Input:  gas = [1, 2, 3, 4, 5]
        cost = [3, 4, 5, 1, 2]
Output: 3
```

## Key Interview Insight

If the running gas balance becomes negative at station `i`, none of the stations from the current candidate start through `i` can be a valid starting point. This allows the algorithm to skip all those candidates in constant time and continue with `i + 1`.

## Commit Message

```text
Add LeetCode 134 Gas Station greedy solution
```
