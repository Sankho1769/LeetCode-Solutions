import java.util.ArrayDeque;
import java.util.Queue;

/**
 * LeetCode 225: Implement Stack using Queues
 *
 * Implements a LIFO stack using a single FIFO queue.
 * The queue is rotated after every push so that its front
 * always contains the current stack top.
 */
class MyStack {

    private final Queue<Integer> queue;

    /** Initializes an empty stack. */
    public MyStack() {
        queue = new ArrayDeque<>();
    }

    /**
     * Pushes an element onto the top of the stack.
     * Time: O(n), where n is the number of elements before this operation.
     */
    public void push(int x) {
        int currentSize = queue.size();
        queue.offer(x);

        // Move all older elements behind the newly inserted element.
        for (int i = 0; i < currentSize; i++) {
            queue.offer(queue.remove());
        }
    }

    /**
     * Removes and returns the top element.
     * Time: O(1).
     * LeetCode guarantees that pop() is called only on a non-empty stack.
     */
    public int pop() {
        return queue.remove();
    }

    /**
     * Returns the top element without removing it.
     * Time: O(1).
     * LeetCode guarantees that top() is called only on a non-empty stack.
     */
    public int top() {
        return queue.element();
    }

    /**
     * Returns true if the stack contains no elements.
     * Time: O(1).
     */
    public boolean empty() {
        return queue.isEmpty();
    }
}
