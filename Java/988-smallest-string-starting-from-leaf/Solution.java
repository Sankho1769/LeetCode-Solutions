import java.util.ArrayDeque;
import java.util.Deque;

class Solution {
    private static class Frame {
        final TreeNode node;
        int state;

        Frame(TreeNode node) {
            this.node = node;
        }
    }

    public String smallestFromLeaf(TreeNode root) {
        if (root == null) {
            return "";
        }

        String best = null;
        StringBuilder path = new StringBuilder();
        Deque<Frame> stack = new ArrayDeque<>();
        stack.push(new Frame(root));

        // Iterative DFS avoids recursion-depth issues on a skewed tree.
        while (!stack.isEmpty()) {
            Frame frame = stack.peek();
            TreeNode node = frame.node;

            if (frame.state == 0) {
                path.append((char) ('a' + node.val));

                if (node.left == null && node.right == null) {
                    String candidate = new StringBuilder(path).reverse().toString();
                    if (best == null || candidate.compareTo(best) < 0) {
                        best = candidate;
                    }
                    frame.state = 3;
                } else {
                    frame.state = 1;
                }
            } else if (frame.state == 1) {
                frame.state = 2;
                if (node.left != null) {
                    stack.push(new Frame(node.left));
                }
            } else if (frame.state == 2) {
                frame.state = 3;
                if (node.right != null) {
                    stack.push(new Frame(node.right));
                }
            } else {
                path.deleteCharAt(path.length() - 1);
                stack.pop();
            }
        }

        return best;
    }
}
