# LeetCode 238 — Product of Array Except Self

- **Difficulty:** Medium
- **Topics:** Array, Prefix Product, Suffix Product
- **Language:** Java

## Problem Explanation

Given an integer array `nums`, return an array `answer` where `answer[i]` is the product of every element in `nums` except `nums[i]`.

The solution must run in **O(n)** time and must **not use division**. The follow-up asks for **O(1) extra space**, excluding the output array.

### Example 1

**Input**

```text
nums = [1, 2, 3, 4]
```

**Output**

```text
[24, 12, 8, 6]
```

For example, `answer[1] = 1 * 3 * 4 = 12` because the element at index `1` (the value `2`) is excluded.

### Example 2

**Input**

```text
nums = [-1, 1, 0, -3, 3]
```

**Output**

```text
[0, 0, 9, 0, 0]
```

The algorithm handles zero and negative values naturally, without special-case logic.

## Solution Logic

For each index `i`, the result is the product of all values to its left multiplied by the product of all values to its right:

```text
answer[i] = leftProduct(i) * rightProduct(i)
```

We calculate these products in two passes and reuse the output array so no separate prefix or suffix arrays are needed.

### Pass 1: Prefix products

Move from left to right. Set `answer[0] = 1`, because there are no elements to the left of index `0`.

For each later index:

```java
answer[i] = answer[i - 1] * nums[i - 1];
```

After this pass, `answer[i]` contains the product of all elements strictly to the left of `i`.

For `nums = [1, 2, 3, 4]`, the intermediate array is:

```text
answer = [1, 1, 2, 6]
```

### Pass 2: Suffix products

Move from right to left with a running variable `suffixProduct`, initially `1`.

At each index:

1. Multiply `answer[i]` by `suffixProduct`. This combines the left product with the product of elements to the right.
2. Update `suffixProduct *= nums[i]` so it includes the current value for the next index.

For the same input, the final result is:

```text
[24, 12, 8, 6]
```

**Important:** Update `answer[i]` before multiplying `nums[i]` into `suffixProduct`; otherwise the current element would incorrectly be included in its own answer.

## Java Implementation

See [`solution.java`](solution.java). The code uses LeetCode's expected `class Solution` format and can be submitted directly.

## Correctness

After the first pass, each `answer[i]` equals the product of every element strictly to the left of index `i`. During the second pass, `suffixProduct` equals the product of every element strictly to the right of the current index. Multiplying them gives the product of all elements except `nums[i]`. Therefore, every output element is correct.

## Complexity Analysis

- **Time:** `O(n)` — two linear passes through the array.
- **Auxiliary space:** `O(1)` — only a constant number of variables are used apart from the output array.
- **Output space:** `O(n)` — required to return the answer.

## Interview Takeaway

The key optimization is to store prefix products directly in the output array, then combine them with a single running suffix product. This avoids division and avoids allocating extra prefix and suffix arrays.
