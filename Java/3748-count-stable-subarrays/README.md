# 3748. Count Stable Subarrays

- **Difficulty:** Hard
- **LeetCode:** [Count Stable Subarrays](https://leetcode.com/problems/count-stable-subarrays/)
- **Solution file:** `Solution.java`

## Approach

A stable subarray is non-decreasing, so the array splits into maximal non-decreasing runs. Each run of length L contributes L(L+1)/2 stable subarrays. Store run IDs, run boundaries, and prefix sums of these run totals. A query is answered by counting the left and right partial runs plus all complete runs between them.

## Complexity

- **Time:** O(n + q)
- **Space:** O(n)

## Submission

Copy `Solution.java` into the LeetCode Java editor. The file contains the `Solution` class and uses the standard method signature for this problem. For problem 988, LeetCode provides the `TreeNode` definition.
