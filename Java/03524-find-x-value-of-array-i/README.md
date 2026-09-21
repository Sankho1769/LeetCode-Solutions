3524. Find X Value of Array I

Difficulty: Medium
Topics: Dynamic Programming, Subarrays, Modular Arithmetic

LeetCode

Problem

Each valid operation leaves a non-empty contiguous subarray.

For every remainder x from 0 to k - 1, count how many subarrays have:

(product of elements) % k == x

Key Observation

A prefix/suffix removal is equivalent to choosing a non-empty subarray.

Since k <= 5, there are only k possible product remainders. I can therefore track the number of subarrays ending at the current index by their remainder.

DP State

freq[r] = number of subarrays ending at the previous index
          whose product % k == r

Transition

For the current value:

n = nums[i] % k

Start a new subarray:

cur[n] = 1

Extend every previous subarray:

cur[(r * n) % k] += freq[r]

Then:

freq = cur

and add freq to the final answer.

Why It Works

Every subarray ending at index i is either:

The single-element subarray [nums[i]], or

A subarray ending at i - 1 extended by nums[i].

So every non-empty subarray is counted exactly once.

Complexity

Time:  O(n * k)
Space: O(k)

Because k <= 5, the solution is effectively linear in n.

Common Mistakes

Forgetting cur[n] = 1

Updating freq in-place

Calculating the full product instead of using modulo

Using int[] for the final answer

Revision Note

The pattern I want to remember:

When a subarray problem has a small number of possible states, track the states of all subarrays ending at the current index.

Solution

See Solution.java.