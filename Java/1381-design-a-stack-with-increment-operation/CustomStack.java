class CustomStack {

    private final int[] stack;
    private final int[] increment;
    private int size;

    public CustomStack(int maxSize) {
        stack = new int[maxSize];
        increment = new int[maxSize];
        size = 0;
    }

    public void push(int x) {
        if (size == stack.length) {
            return;
        }

        stack[size] = x;
        increment[size] = 0;
        size++;
    }

    public int pop() {
        if (size == 0) {
            return -1;
        }

        int index = --size;
        int result = stack[index] + increment[index];

        if (index > 0) {
            increment[index - 1] += increment[index];
        }

        increment[index] = 0;

        return result;
    }

    public void increment(int k, int val) {
        int index = Math.min(k, size) - 1;

        if (index >= 0) {
            increment[index] += val;
        }
    }
}
