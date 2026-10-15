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
