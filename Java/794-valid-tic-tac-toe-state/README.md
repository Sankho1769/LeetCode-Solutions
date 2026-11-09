# 794. Valid Tic-Tac-Toe State

- **Difficulty:** Medium
- **LeetCode:** [Valid Tic-Tac-Toe State](https://leetcode.com/problems/valid-tic-tac-toe-state/)
- **Solution file:** `Solution.java`

## Approach

Count X and O, then check the only valid turn-count relationships. A winning X line requires exactly one more X than O and no O winning line. A winning O line requires equal counts and no X winning line.

## Complexity

- **Time:** O(1)
- **Space:** O(1)

## Submission

Copy `Solution.java` into the LeetCode Java editor. The file contains the `Solution` class and uses the standard method signature for this problem. For problem 988, LeetCode provides the `TreeNode` definition.
