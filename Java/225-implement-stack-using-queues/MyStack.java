import java.util.ArrayDeque;
import java.util.Queue;

class MyStack {

    private final Queue<Integer> queue;

    public MyStack() {
        queue = new ArrayDeque<>();
    }

    public void push(int x) {
        int currentSize = queue.size();
        queue.offer(x);

        for (int i = 0; i < currentSize; i++) {
            queue.offer(queue.remove());
        }
    }

    public int pop() {
        return queue.remove();
    }

    public int top() {
        return queue.element();
    }
    public boolean empty() {
        return queue.isEmpty();
    }
}
