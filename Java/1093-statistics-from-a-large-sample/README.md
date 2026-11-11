# 1093. Statistics from a Large Sample

**Difficulty:** Medium  
**Problem:** [LeetCode 1093 - Statistics from a Large Sample](https://leetcode.com/problems/statistics-from-a-large-sample/)

## Problem Description

The sample is represented by a frequency array `count`, where `count[i]` tells how many times the value `i` appears. The possible values range from `0` to `255`.

Return five statistics in this order:

1. **Minimum** — the smallest value with a non-zero frequency.
2. **Maximum** — the largest value with a non-zero frequency.
3. **Mean** — the weighted average of all values.
4. **Median** — the middle value, or the average of the two middle values when the sample size is even.
5. **Mode** — the value with the highest frequency. The problem guarantees that it is unique.

## Approach

Since the value range is fixed to 256 possible values, we can calculate every statistic by scanning the frequency array. There is no need to expand or sort the sample.

### 1. Minimum, Maximum, Mean, and Mode

For every value with a non-zero frequency:

- The first such value is the minimum.
- The last such value is the maximum.
- Add `value * frequency` to the weighted sum.
- Add the frequency to the total number of elements.
- Track the value with the greatest frequency as the mode.

Use `long` for the total count and weighted sum because the sample can contain up to `10^9` elements.

The mean is:

```text
weighted sum / total count
```

### 2. Median

The median is determined by the one-based positions in the sorted sample.

- First middle position: `(totalCount + 1) / 2`
- Second middle position: `(totalCount + 2) / 2`

For an odd sample size, both positions are the same. For an even sample size, they are the two central positions.

Scan `count` while maintaining a prefix frequency. The value at which the prefix first reaches each target position is the corresponding middle value. Average the two values using `/ 2.0`.

## Java Solution

```java
class Solution {
    public double[] sampleStats(int[] count) {
        double[] result = new double[5];

        int min = -1;
        int max = -1;
        int mode = -1;
        long totalCount = 0;
        long totalSum = 0;
        int maxFrequency = 0;

        for (int value = 0; value < count.length; value++) {
            int frequency = count[value];

            if (frequency == 0) {
                continue;
            }

            if (min == -1) {
                min = value;
            }

            max = value;
            totalCount += frequency;
            totalSum += (long) value * frequency;

            if (frequency > maxFrequency) {
                maxFrequency = frequency;
                mode = value;
            }
        }

        long firstRank = (totalCount + 1) / 2;
        long secondRank = (totalCount + 2) / 2;
        long prefixCount = 0;
        int firstMedian = 0;
        int secondMedian = 0;
        boolean firstFound = false;

        for (int value = 0; value < count.length; value++) {
            prefixCount += count[value];

            if (!firstFound && prefixCount >= firstRank) {
                firstMedian = value;
                firstFound = true;
            }

            if (prefixCount >= secondRank) {
                secondMedian = value;
                break;
            }
        }

        result[0] = min;
        result[1] = max;
        result[2] = (double) totalSum / totalCount;
        result[3] = (firstMedian + secondMedian) / 2.0;
        result[4] = mode;

        return result;
    }
}
```

## Examples

### Example 1

```text
count[1] = 1
count[2] = 3
count[3] = 4
```

The represented sample is `[1, 2, 2, 2, 3, 3, 3, 3]`.

- Minimum: `1`
- Maximum: `3`
- Mean: `19 / 8 = 2.375`
- Median: `(2 + 3) / 2 = 2.5`
- Mode: `3`

**Output:** `[1.0, 3.0, 2.375, 2.5, 3.0]`

### Example 2

The represented sample is `[1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4]`.

- Minimum: `1`
- Maximum: `4`
- Mean: `24 / 11 ≈ 2.18182`
- Median: `2`
- Mode: `1`

**Output:** `[1.0, 4.0, 2.181818..., 2.0, 1.0]`

## Complexity Analysis

Let `R` be the number of possible values. Here, `R = 256`.

- **Time Complexity:** `O(R)` — two scans of the fixed-size frequency array.
- **Space Complexity:** `O(1)` — only a fixed number of variables are used.

## Key Concepts

- Frequency Array
- Weighted Average
- Median by Cumulative Frequency
- Mode
- Long Integer Arithmetic
