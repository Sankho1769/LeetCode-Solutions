# 3331. Find Subtree Sizes After Changes

**Difficulty:** Medium  
**Problem:** [LeetCode 3331 - Find Subtree Sizes After Changes](https://leetcode.com/problems/find-subtree-sizes-after-changes/)

## Problem Description

You are given a tree rooted at node `0`, represented by a `parent` array, and a string `s` that assigns a lowercase letter to each node.

For every node other than the root, simultaneously change its parent to the closest ancestor that has the same character, if such an ancestor exists. Otherwise, keep its original parent.

Return the size of the subtree rooted at every node in the resulting tree.

## Approach

We use an iterative depth-first traversal to identify each node's nearest ancestor with the same character, then calculate subtree sizes in postorder.

### 1. Build the Original Tree

Convert the `parent` array into a child adjacency list. This lets us traverse the original tree from the root.

### 2. Track the Nearest Matching Ancestor

The `last` array stores the deepest node currently on the root-to-current-node path for each of the 26 lowercase letters.

When entering node `x`:

- Let `c = s.charAt(x) - 'a'`.
- Store `last[c]` in `above[x]`. This is the closest ancestor with the same character, or `-1` if none exists.
- Set `last[c] = x` while traversing this node's descendants.

When leaving node `x`, restore `last[c]` to `above[x]`. This makes the character state correct when traversal moves to another branch.

### 3. Use Iterative Postorder

The stack stores a node when entering it and its bitwise-complement marker (`~x`) when leaving it. This simulates recursive DFS without risking a call-stack overflow on a tree that is a long chain.

Each node's `size` starts at `1`. When leaving a non-root node, add its accumulated subtree size to its final parent:

- Use `above[x]` if a matching ancestor exists.
- Otherwise, use the original `parent[x]`.

Because a matching ancestor is above the node in the original tree, it is processed after the node's descendants. Its size therefore receives the node's contribution before it is itself finalized.

## Java Solution

```java
import java.util.*;

class Solution {
    public int[] findSubtreeSizes(int[] parent, String s) {
        int n = parent.length;
        List<List<Integer>> children = new ArrayList<>();
        for (int x = 0; x < n; x++)
            children.add(new ArrayList<>());
        for (int x = 1; x < n; x++)
            children.get(parent[x]).add(x);
        int[] size = new int[n], above = new int[n], last = new int[26];
        Arrays.fill(size, 1);
        Arrays.fill(last, -1);
        Deque<Integer> stack = new ArrayDeque<>(List.of(0));
        while (!stack.isEmpty()) {
            int x = stack.pop();
            if (x >= 0) {
                int c = s.charAt(x) - 'a';
                above[x] = last[c];
                last[c] = x;
                stack.push(~x);
                for (int child : children.get(x))
                    stack.push(child);
            } else {
                x = ~x;
                last[s.charAt(x) - 'a'] = above[x];
                if (x > 0)
                    size[above[x] >= 0 ? above[x] : parent[x]] += size[x];
            }
        }
        return size;
    }
}
```

## Examples

### Example 1

**Input:**

```text
parent = [-1, 0, 0, 1, 1, 1]
s = "abaabc"
```

Node `3` has character `'a'`. Its closest ancestor with the same character is node `0`, so its parent changes from `1` to `0`.

**Output:**

```text
[6, 3, 1, 1, 1, 1]
```

### Example 2

**Input:**

```text
parent = [-1, 0, 4, 0, 1]
s = "abbba"
```

The parent changes are applied simultaneously using ancestors in the original tree:

- Node `4` moves under node `0`.
- Node `2` moves under node `1`.

**Output:**

```text
[5, 2, 1, 1, 1]
```

## Complexity Analysis

Let `n` be the number of nodes.

- **Time Complexity:** `O(n)`. Each node and each tree edge is processed a constant number of times. The character lookup takes `O(1)` because there are only 26 lowercase letters.
- **Space Complexity:** `O(n)`. The adjacency list, traversal stack, and auxiliary arrays all require linear space.

## Key Concepts

- Tree Traversal
- Iterative Depth-First Search
- Postorder Processing
- Ancestor Tracking
- Subtree Size Aggregation
- Stack-Based Recursion Simulation
