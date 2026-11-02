# 225. Implement Stack using Queues

**Platform:** LeetCode  
**Difficulty:** Easy  
**Topics:** Stack, Queue, Design  
**Language:** Java  
**Approach:** One Queue with Rotation

## Problem Summary

Implement a stack that follows **Last In, First Out (LIFO)** using only standard queue operations. The implementation must support:

- `push(int x)` — insert `x` at the top of the stack.
- `pop()` — remove and return the top element.
- `top()` — return the top element without removing it.
- `empty()` — report whether the stack is empty.

This implementation also satisfies the follow-up requirement: **use only one queue**.

## Solution

The solution is in [`MyStack.java`](./MyStack.java). It uses Java's `Queue` interface backed by `ArrayDeque`.

### Core Idea

A queue is FIFO, while a stack is LIFO. Keep the queue ordered so that its **front always represents the stack's top**.

When `push(x)` is called:

1. Record the queue's current size.
2. Add the new element to the rear.
3. Move each element that was already in the queue from the front to the rear.

After the rotation, the newly added element is at the front. Therefore, `pop()` and `top()` can operate directly on the front of the queue.

### Example Walkthrough

Operations:

```text
push(1)
push(2)
push(3)
top()   -> 3
pop()   -> 3
top()   -> 2
empty() -> false
```

Queue order after each insertion (front to rear):

| Operation | Queue |
|---|---|
| `push(1)` | `[1]` |
| `push(2)` | `[2, 1]` |
| `push(3)` | `[3, 2, 1]` |

The front is always the current stack top.

## Complexity Analysis

Let `n` be the number of elements in the stack before an operation.

| Operation | Time Complexity | Reason |
|---|---:|---|
| `push(x)` | `O(n)` | Rotates all previously stored elements. |
| `pop()` | `O(1)` | Removes the front element. |
| `top()` | `O(1)` | Reads the front element. |
| `empty()` | `O(1)` | Checks whether the queue is empty. |

**Auxiliary space:** `O(n)` for storing the `n` stack elements. Each element is stored exactly once.

## Correctness Invariant

After every completed `push`, the front of the queue contains the most recently pushed element that has not yet been popped.

- Initially, the queue is empty, so the invariant holds.
- On `push(x)`, adding `x` and rotating all older elements places `x` at the front, preserving the invariant.
- `pop()` removes that front element, which is the stack's most recently pushed remaining element.
- `top()` reads the same element without changing the queue.

Thus, the queue exposes the same `push`, `pop`, and `top` behavior as a LIFO stack.

## LeetCode Submission

1. Open [LeetCode 225 — Implement Stack using Queues](https://leetcode.com/problems/implement-stack-using-queues/).
2. Select **Java**.
3. Paste the contents of `MyStack.java` into the editor.
4. Submit. LeetCode provides the test harness, so no `main()` method is required.

The class name and public method signatures match LeetCode's required interface.

## Interview Discussion

The design deliberately makes `push` the expensive operation so that `pop` and `top` remain constant-time. This is a useful trade-off when reads/removals from the top are expected to be frequent and insertion can tolerate linear work.

A concise interview explanation:

> I use one queue and maintain the invariant that its front is always the stack's top. When a value is pushed, I enqueue it and rotate all previously stored values behind it. This preserves LIFO order while keeping `pop` and `top` at `O(1)`. The cost is `O(n)` per push, with `O(n)` space overall.

## Commit Message

```bash
git add 225-implement-stack-using-queues
git commit -m "Solve LeetCode 225: Implement Stack using Queues"
```
