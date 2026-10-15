# 155. Min Stack

**Difficulty:** Medium  
**Problem:** [LeetCode 155 - Min Stack](https://leetcode.com/problems/min-stack/)

## Problem Description

Design a stack that supports `push`, `pop`, `top`, and `getMin`. Each operation must run in **O(1)** time. `getMin()` returns the smallest element currently in the stack.

## Approach: Linked Nodes with a Running Minimum

Each node stores three fields:

- `val`: the value stored at this stack position.
- `min`: the minimum value from this node down through the rest of the stack.
- `next`: the node beneath it.

When pushing `x`, create a new head node. Its minimum is `x` if the stack is empty; otherwise it is `min(x, head.min)`. Moving `head` to the next node implements `pop()` in constant time.

Because the minimum for each stack state is stored in its head node, `top()` and `getMin()` are both O(1).

## Java Solution

```java
class MinStack {
    private Node head;

    public void push(int x) {
        if (head == null) {
            head = new Node(x, x, null);
        } else {
            head = new Node(x, Math.min(x, head.min), head);
        }
    }

    public void pop() {
        head = head.next;
    }

    public int top() {
        return head.val;
    }

    public int getMin() {
        return head.min;
    }

    private class Node {
        int val;
        int min;
        Node next;

        private Node(int val, int min, Node next) {
            this.val = val;
            this.min = min;
            this.next = next;
        }
    }
}
```

## Example

```text
push(-2)
push(0)
push(-3)
getMin()  -> -3
pop()
top()     -> 0
getMin()  -> -2
```

## Complexity

- **Time:** O(1) for `push`, `pop`, `top`, and `getMin`.
- **Space:** O(n), where `n` is the number of stored elements.

## Key Concepts

- Stack design
- Linked list
- Store extra state in each node
- Constant-time minimum retrieval
