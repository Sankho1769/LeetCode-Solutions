# 3686. Number of Stable Subsequences

- **Difficulty:** Hard
- **LeetCode:** [Number of Stable Subsequences](https://leetcode.com/problems/number-of-stable-subsequences/)
- **Solution file:** `Solution.java`

## Approach

Maintain the number of valid non-empty subsequences by their final parity and the length (one or two) of their current equal-parity suffix. Appending a value can start a new subsequence, extend an opposite-parity suffix to length one, or extend a same-parity suffix of length one to length two. A suffix of length two cannot be extended with the same parity.

## Complexity

- **Time:** O(n)
- **Space:** O(1)

## Submission

Copy `Solution.java` into the LeetCode Java editor. The file contains the `Solution` class and uses the standard method signature for this problem. For problem 988, LeetCode provides the `TreeNode` definition.
