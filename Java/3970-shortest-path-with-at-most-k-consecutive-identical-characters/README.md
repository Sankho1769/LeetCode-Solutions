# 3970. Shortest Path With At Most K Consecutive Identical Characters

**Difficulty:** Medium  
**Problem:** [LeetCode 3970 - Shortest Path With At Most K Consecutive Identical Characters](https://leetcode.com/problems/shortest-path-with-at-most-k-consecutive-identical-characters/)

## Problem Description

You are given a directed weighted graph, a string `labels` assigning one lowercase character to each node, and an integer `k`.

Find the minimum total edge weight of a path from node `0` to node `n - 1` such that the sequence of node labels along the path never contains more than `k` identical consecutive characters. Return `-1` if no valid path exists.

## Approach: Dijkstra on Expanded States

A normal shortest-path state containing only the current node is not sufficient. Whether the next node is allowed also depends on the last character and how many times it has appeared consecutively.

Because the current node determines the last character, we store each state as:

```text
(node, consecutiveCount)
```

`dp[node][count]` stores the minimum cost to reach `node` while the current character has appeared `count` times consecutively at the end of the path.

### State transitions

For an edge from `node` to `nextNode` with weight `weight`:

- If both nodes have the same label, the next count is `count + 1`.
- Otherwise, the next count resets to `1`.
- Skip the transition if the next count exceeds `k`.
- Otherwise, relax the new state using the edge weight.

All edge weights are positive, so Dijkstra's algorithm finds the minimum valid path cost. The priority queue stores `(cost, consecutiveCount, node)`.

The initial state is `(0, 1)` with cost `0`, because the path starts at node `0` and already contains its label once.

When the destination is removed from the priority queue with its current best distance, that cost is the answer. If no destination state is reachable, return `-1`.

## Java Solution

```java
import java.util.*;

class Solution {
    public int shortestPath(int n, int[][] edges, String labels, int k) {
        List<List<int[]>> graph = new ArrayList<>();

        for (int i = 0; i < n; i++) {
            graph.add(new ArrayList<>());
        }

        for (int[] edge : edges) {
            graph.get(edge[0]).add(new int[] {edge[1], edge[2]});
        }

        char[] arr = labels.toCharArray();

        int[][] dp = new int[n][k + 1];
        for (int[] row : dp) {
            Arrays.fill(row, Integer.MAX_VALUE);
        }

        PriorityQueue<int[]> pq = new PriorityQueue<>(
            (a, b) -> Integer.compare(a[0], b[0])
        );

        dp[0][1] = 0;
        pq.offer(new int[] {0, 1, 0});

        while (!pq.isEmpty()) {
            int[] curr = pq.poll();

            int cost = curr[0];
            int freq = curr[1];
            int node = curr[2];

            if (cost > dp[node][freq]) {
                continue;
            }

            if (node == n - 1) {
                return cost;
            }

            for (int[] next : graph.get(node)) {
                int nextNode = next[0];
                int weight = next[1];

                int nextFreq = 1;
                if (arr[node] == arr[nextNode]) {
                    nextFreq += freq;
                }

                if (nextFreq > k) {
                    continue;
                }

                int nextCost = cost + weight;

                if (nextCost < dp[nextNode][nextFreq]) {
                    dp[nextNode][nextFreq] = nextCost;
                    pq.offer(new int[] {nextCost, nextFreq, nextNode});
                }
            }
        }

        return -1;
    }
}
```

## Examples

### Example 1

```text
n = 3
edges = [[0,1,1],[1,2,1],[0,2,3]]
labels = "aab"
k = 1
```

The path `0 -> 1 -> 2` creates `"aab"`, which has two consecutive `a` characters and is invalid for `k = 1`.

The direct path `0 -> 2` creates `"ab"` and costs `3`.

**Output:** `3`

### Example 2

```text
n = 3
edges = [[0,1,1],[1,2,1],[0,2,3]]
labels = "aab"
k = 2
```

The path `0 -> 1 -> 2` creates `"aab"`, which is valid and costs `2`.

**Output:** `2`

### Example 3

```text
n = 3
edges = [[0,1,1],[1,2,1]]
labels = "aaa"
k = 2
```

The only path creates `"aaa"`, which has three consecutive identical characters. No valid path exists.

**Output:** `-1`

## Complexity Analysis

Let `n` be the number of nodes, `E` the number of directed edges, and `k` the maximum allowed consecutive count.

- **Time Complexity:** `O((n * k + E * k) log(n * k))` using Dijkstra over at most `n * k` states and up to `E * k` transitions.
- **Space Complexity:** `O(n * k + E)` for the distance table, priority queue, and adjacency list. The priority queue can contain multiple entries for a state before stale entries are discarded.

## Key Concepts

- Dijkstra's Algorithm
- Priority Queue
- Graph Representation
- Expanded State Graph
- Dynamic State Tracking

## Git Commit Message

```text
feat: add LeetCode 3970 solution
```
