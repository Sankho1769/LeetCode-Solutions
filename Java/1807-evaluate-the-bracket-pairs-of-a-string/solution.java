import java.util.*;

class Solution {

    public String evaluate(String s, List<List<String>> knowledge) {

        StringBuilder res = new StringBuilder();

        HashMap<String, String> map = new HashMap<>();

        for (List<String> pair : knowledge) {
            map.put(pair.get(0), pair.get(1));
        }

        for (int i = 0; i < s.length(); i++) {

            if (s.charAt(i) == '(') {

                int closingIndex = s.indexOf(')', i + 1);
                String key = s.substring(i + 1, closingIndex);

                res.append(map.getOrDefault(key, "?"));

                i = closingIndex;
            } else {
                res.append(s.charAt(i));
            }
        }

        return res.toString();
    }
}