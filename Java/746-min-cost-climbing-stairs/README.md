# 746. Min Cost Climbing Stairs

- **Difficulty:** Easy
- **LeetCode:** [Min Cost Climbing Stairs](https://leetcode.com/problems/min-cost-climbing-stairs/)
- **Solution file:** `Solution.java`

## Approach

Let dp[i] be the minimum cost to reach position i, where position n is the top. The first two positions can be reached for free. For every later position, take the cheaper of arriving from one or two steps below.

## Complexity

- **Time:** O(n)
- **Space:** O(n)

## Submission

Copy `Solution.java` into the LeetCode Java editor. The file contains the `Solution` class and uses the standard method signature for this problem. For problem 988, LeetCode provides the `TreeNode` definition.
