# 716. Max Stack

**Difficulty:** Hard  
**Problem:** [LeetCode 716 - Max Stack](https://leetcode.com/problems/max-stack/)

## Problem Description

Design a stack that supports these operations:

- `push(x)`: push `x` onto the stack.
- `pop()`: remove and return the top element.
- `top()`: return the top element.
- `peekMax()`: return the largest element currently in the stack.
- `popMax()`: remove and return the largest element. If the maximum occurs more than once, remove the one closest to the top.

## Approach: Doubly Linked List + Ordered Map

This solution combines two data structures:

1. **Doubly linked list:** keeps stack order, allowing any node to be removed in O(1) once its node reference is known.
2. **TreeMap + TreeSet:** indexes nodes by value. The `TreeMap` finds the maximum value, while each value's `TreeSet` orders its nodes by insertion ID.

Every push receives a unique, increasing ID. For equal maximum values, the node with the largest ID is the most recently pushed one that is still present, which is the occurrence closest to the top. This makes `popMax()` remove the correct duplicate.

Sentinel nodes (`head` and `tail`) simplify insertion and deletion at the ends of the linked list.

## Java Solution

```java
import java.util.TreeMap;
import java.util.TreeSet;

class MaxStack {
    private static class Node implements Comparable<Node> {
        int val;
        long id;
        Node prev;
        Node next;

        Node(int val, long id) {
            this.val = val;
            this.id = id;
        }

        @Override
        public int compareTo(Node other) {
            return Long.compare(this.id, other.id);
        }
    }

    private final Node head = new Node(0, -1);
    private final Node tail = new Node(0, -1);
    private final TreeMap<Integer, TreeSet<Node>> nodesByValue = new TreeMap<>();
    private long nextId = 0;

    public MaxStack() {
        head.next = tail;
        tail.prev = head;
    }

    public void push(int x) {
        Node node = new Node(x, nextId++);
        addToTop(node);
        nodesByValue.computeIfAbsent(x, key -> new TreeSet<>()).add(node);
    }

    public int pop() {
        Node node = head.next;
        unlink(node);
        removeFromValueIndex(node);
        return node.val;
    }

    public int top() {
        return head.next.val;
    }

    public int peekMax() {
        return nodesByValue.lastKey();
    }

    public int popMax() {
        Node node = nodesByValue.lastEntry().getValue().last();
        unlink(node);
        removeFromValueIndex(node);
        return node.val;
    }

    private void addToTop(Node node) {
        node.next = head.next;
        node.prev = head;
        head.next.prev = node;
        head.next = node;
    }

    private void unlink(Node node) {
        node.prev.next = node.next;
        node.next.prev = node.prev;
    }

    private void removeFromValueIndex(Node node) {
        TreeSet<Node> sameValue = nodesByValue.get(node.val);
        sameValue.remove(node);
        if (sameValue.isEmpty()) {
            nodesByValue.remove(node.val);
        }
    }
}
```

## Example

```text
push(5)
push(1)
push(5)
top()      -> 5
popMax()   -> 5   // Removes the topmost occurrence of the maximum
 top()     -> 1
peekMax()  -> 5
pop()      -> 1
top()      -> 5
```

## Complexity

Let `n` be the number of elements in the stack.

| Operation | Time Complexity |
|---|---:|
| `push(x)` | O(log n) |
| `pop()` | O(log n) |
| `top()` | O(1) |
| `peekMax()` | O(log n) |
| `popMax()` | O(log n) |

**Space:** O(n) for the linked-list nodes and ordered indexes.

## Key Concepts

- Stack design
- Doubly linked list
- TreeMap
- TreeSet
- Removing a maximum element with duplicate values
