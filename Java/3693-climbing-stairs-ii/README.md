# 3693. Climbing Stairs II

- **Difficulty:** Medium
- **LeetCode:** [Climbing Stairs II](https://leetcode.com/problems/climbing-stairs-ii/)
- **Solution file:** `Solution.java`

## Approach

Let dp[i] be the minimum cost to reach step i. From any of the previous one, two, or three steps, add the cost of the destination step and the square of the jump length. The destination step n has no landing cost because it is the top.

## Complexity

- **Time:** O(n)
- **Space:** O(n)

## Submission

Copy `Solution.java` into the LeetCode Java editor. The file contains the `Solution` class and uses the standard method signature for this problem. For problem 988, LeetCode provides the `TreeNode` definition.
