# 988. Smallest String Starting From Leaf

- **Difficulty:** Medium
- **LeetCode:** [Smallest String Starting From Leaf](https://leetcode.com/problems/smallest-string-starting-from-leaf/)
- **Solution file:** `Solution.java`

## Approach

Run DFS from the root while building the root-to-current path. At each leaf, reverse that path to obtain the required leaf-to-root string and keep the lexicographically smallest candidate.

## Complexity

- **Time:** O(n · h) in the worst case
- **Space:** O(h) auxiliary space, excluding the path string comparisons

## Submission

Copy `Solution.java` into the LeetCode Java editor. The file contains the `Solution` class and uses the standard method signature for this problem. For problem 988, LeetCode provides the `TreeNode` definition.
