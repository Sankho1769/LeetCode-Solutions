# 3600. Maximize Spanning Tree Stability with Upgrades

- **Language:** Java 21 (LeetCode `Solution` class)
- **Problem:** https://leetcode.com/problems/maximize-spanning-tree-stability-with-upgrades/

## Approach

Binary-search the answer (the minimum edge strength in the chosen spanning tree). For a candidate threshold, first add every mandatory edge and reject the threshold if a mandatory edge is too weak or the mandatory edges form a cycle. Then union all optional edges that already meet the threshold. Finally, use eligible optional edges whose doubled strength reaches the threshold, counting one upgrade only when such an edge joins two different components. The threshold is feasible when all vertices become connected using at most k upgrades.

## Complexity

O((n + m) log S) time, where S is twice the maximum edge strength; O(n + m) space.

## File

- `Solution.java` — submission-ready LeetCode solution.

## Commit message

```text
Add solution for 3600 - Maximize Spanning Tree Stability with Upgrades
```
