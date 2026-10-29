# LeetCode 1408 — String Matching in an Array

- **Difficulty:** Easy
- **Language:** Java
- **Topics:** Arrays, Strings, Substring Search
- **LeetCode:** https://leetcode.com/problems/string-matching-in-an-array/

## Problem Explanation

You are given an array of **unique strings** named `words`. Return every string that appears as a **substring** of at least one *other* string in the array. The answer can be returned in any order.

A substring is a continuous sequence of characters within a string. For example, `"as"` is a substring of `"mass"`, and `"hero"` is a substring of `"superhero"`.

### Examples

**Example 1**

```text
Input:  words = ["mass", "as", "hero", "superhero"]
Output: ["as", "hero"]
```

- `"as"` occurs inside `"mass"`.
- `"hero"` occurs inside `"superhero"`.
- `"mass"` and `"superhero"` are not substrings of any other word in this input.

**Example 2**

```text
Input:  words = ["leetcode", "et", "code"]
Output: ["et", "code"]
```

Both `"et"` and `"code"` occur inside `"leetcode"`.

**Example 3**

```text
Input:  words = ["blue", "green", "bu"]
Output: []
```

None of the strings occurs inside another string.

## Solution Logic

The input is small (`words.length <= 100` and each word has at most 30 characters), so checking every pair of words is simple and efficient enough.

1. Treat each word as a candidate that might be a substring.
2. Compare it against every word in the array.
3. Skip words whose length is less than or equal to the candidate's length. Since all input strings are unique, another word containing the candidate must be strictly longer.
4. Use Java's `String.contains()` to check whether the longer word includes the candidate as a substring.
5. As soon as a match is found, add the candidate to the result and `break` out of the inner loop. This avoids duplicate additions and unnecessary comparisons.
6. Return the result list.

## Why This Works

For each candidate, the algorithm examines all possible containing words that could be longer than it. If one contains the candidate, the candidate is added exactly once. If no longer word contains it, the candidate is not added. Therefore, every returned word meets the requirement, and every word that meets the requirement is returned.

## Complexity Analysis

Let:

- `n` be the number of words.
- `L` be the maximum length of any word.

**Time complexity: `O(n² × L²)` worst case.** There are at most `n²` candidate/container pairs. A substring search with `String.contains()` can take up to `O(L²)` time in the general worst-case model when both strings have length at most `L`.

**Auxiliary space: `O(1)`**, excluding the result list, because the algorithm uses only a fixed number of extra variables.

**Output space: `O(n)`** in the worst case, for the returned list.

Given `n <= 100` and `L <= 30`, this approach is practical for the stated constraints.

## Why Not Use a Trie or More Complex Algorithm?

A Trie or a specialized string-matching algorithm would add implementation and maintenance complexity without a meaningful benefit for these small limits. The pairwise solution is straightforward, easy to validate, and interview-friendly. The length check and early `break` remove avoidable work while keeping the code readable.

## Code

See [`Solution.java`](Solution.java). It uses the required LeetCode method signature:

```java
public List<String> stringMatching(String[] words)
```

## Suggested Commit Message

```text
Add Java solution for LeetCode 1408 String Matching in an Array
```
