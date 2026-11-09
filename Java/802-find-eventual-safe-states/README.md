# 802. Find Eventual Safe States

- **Difficulty:** Medium
- **LeetCode:** [Find Eventual Safe States](https://leetcode.com/problems/find-eventual-safe-states/)
- **Solution file:** `Solution.java`

## Approach

Build the reversed graph and count each node’s outgoing edges as its original outdegree. Start with terminal nodes (outdegree zero). Remove them with a queue and decrement the outdegree of their predecessors. Nodes whose outdegree becomes zero are safe. Scanning node IDs in order keeps the result sorted.

## Complexity

- **Time:** O(V + E)
- **Space:** O(V + E)

## Submission

Copy `Solution.java` into the LeetCode Java editor. The file contains the `Solution` class and uses the standard method signature for this problem. For problem 988, LeetCode provides the `TreeNode` definition.
