import java.util.ArrayList;
import java.util.List;

class Solution {
    public List<String> stringMatching(String[] words) {
        int n = words.length;
        List<String> result = new ArrayList<>();

        for (int i = 0; i < n; i++) {
            String word = words[i];

            for (int j = 0; j < n; j++) {
                // All words are unique, so a containing word must be longer.
                if (words[j].length() > word.length()
                        && words[j].contains(word)) {
                    result.add(word);
                    break; // Add this word only once.
                }
            }
        }

        return result;
    }
}
