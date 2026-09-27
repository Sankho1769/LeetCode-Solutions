# 1807. Evaluate the Bracket Pairs of a String

**Difficulty:** Medium  
**Problem:** [LeetCode 1807 - Evaluate the Bracket Pairs of a String](https://leetcode.com/problems/evaluate-the-bracket-pairs-of-a-string/)

## Problem Description

You are given:

- A string `s` containing lowercase English letters and bracket pairs.
- A 2D array `knowledge`, where each pair contains a key and its corresponding value.

For every bracket pair `(key)` in `s`:

- Replace it with the value associated with `key`.
- If the key does not exist in `knowledge`, replace it with `?`.

Return the resulting string.

## Approach

We use a `HashMap` to store each key and its corresponding value.

Then we scan the string from left to right.

### Step 1: Build the HashMap

Each entry in `knowledge` is stored as:

```text
key -> value