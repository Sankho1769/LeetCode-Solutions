# 3841. Palindromic Path Queries in a Tree

**Difficulty:** Hard  
**Problem:** [LeetCode 3841 - Palindromic Path Queries in a Tree](https://leetcode.com/problems/palindromic-path-queries-in-a-tree/)

## Problem Description

You are given a tree whose nodes each contain a lowercase English letter. Queries either update a node's character or ask whether the letters on the unique path between two nodes can be rearranged into a palindrome.

A string can be rearranged into a palindrome if **at most one character occurs an odd number of times**.

## Approach

This solution combines **Euler Tour**, **Binary Lifting**, **XOR bitmasks**, and a **Fenwick tree (Binary Indexed Tree)**.

### 1. Represent character parity with a bitmask

Each letter maps to one bit: `a` is bit 0, `b` is bit 1, and so on. XOR toggles a bit, so the mask represents which letter counts are odd. A mask is valid for a palindrome rearrangement when it contains at most one set bit:

```java
(mask & (mask - 1)) == 0
```

### 2. Flatten the tree with an Euler Tour

Every node is assigned an entry time `tin` and subtree end time `tout`. A node's subtree becomes a contiguous interval in this ordering.

The traversal is iterative to avoid recursion-depth issues on a tree that is shaped like a long chain. Binary lifting stores ancestors so the lowest common ancestor (LCA) of any two nodes can be found efficiently.

### 3. Track root-to-node masks with a Fenwick tree

For each node, apply its character mask as a range-XOR update over its Euler Tour subtree. The Fenwick tree then answers the XOR mask of the characters on the path from the root to a requested node.

When a node's character changes, XOR its old and new character bits over that node's subtree interval.

### 4. Answer a path query

For nodes `u` and `v`, let `w = LCA(u, v)`. The path mask is:

```text
rootMask(u) XOR rootMask(v) XOR characterMask(w)
```

The LCA's character is included once because it appears in both root paths and would otherwise cancel out. The path can be rearranged into a palindrome if the resulting mask has zero or one set bit.

## Java Solution

See `Solution.java`. It implements the required `palindromePath(int N, int[][] edges, String S, String[] queries)` method.

## Complexity Analysis

Let `n` be the number of nodes and `q` the number of queries.

- **Preprocessing:** `O(n log n)` time for binary lifting, plus `O(n log n)` for initializing subtree XOR updates.
- **Each update:** `O(log n)` time.
- **Each path query:** `O(log n)` time for LCA and Fenwick queries.
- **Total time:** `O((n + q) log n)`.
- **Space complexity:** `O(n log n)` for the ancestor table and `O(n)` for the remaining structures.

## Key Concepts

- Trees and Euler Tour
- Lowest Common Ancestor (LCA)
- Binary Lifting
- XOR Bitmasks
- Fenwick Tree / Binary Indexed Tree
- Online Updates and Queries

## Git Commit Message

```text
feat: add LeetCode 3841 solution
```
