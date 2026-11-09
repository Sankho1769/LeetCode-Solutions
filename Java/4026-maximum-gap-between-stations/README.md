# 4026. Maximum Gap Between Stations

- **Difficulty:** Medium
- **LeetCode:** [Maximum Gap Between Stations](https://leetcode.com/problems/maximum-gap-between-stations/)
- **Solution file:** `Solution.java`

## Approach

Greedily match the workers from left to right to find the earliest valid station for each worker. Then match from right to left to find the latest valid station. For the gap between workers i - 1 and i, the best possible value is latest[i] - earliest[i - 1]. Take the maximum over all adjacent workers.

## Complexity

- **Time:** O(n + m)
- **Space:** O(n)

## Submission

Copy `Solution.java` into the LeetCode Java editor. The file contains the `Solution` class and uses the standard method signature for this problem. For problem 988, LeetCode provides the `TreeNode` definition.
