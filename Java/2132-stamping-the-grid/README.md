# 2132. Stamping the Grid

- **Difficulty:** Hard
- **LeetCode:** [Stamping the Grid](https://leetcode.com/problems/stamping-the-grid/)
- **Solution file:** `Solution.java`

## Approach

Use a 2-D prefix sum to check in O(1) whether a stamp-sized rectangle contains any occupied cell. For every valid empty rectangle, mark its coverage with four corner updates in a 2-D difference array. Rebuild the coverage prefix sums and verify that every empty cell is covered at least once.

## Complexity

- **Time:** O(m · n)
- **Space:** O(m · n)

## Submission

Copy `Solution.java` into the LeetCode Java editor. The file contains the `Solution` class and uses the standard method signature for this problem. For problem 988, LeetCode provides the `TreeNode` definition.
