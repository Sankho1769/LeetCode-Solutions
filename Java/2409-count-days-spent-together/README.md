# 2409. Count Days Spent Together

**Difficulty:** Easy  
**Problem:** [LeetCode 2409 - Count Days Spent Together](https://leetcode.com/problems/count-days-spent-together/)

## Problem Description

Alice and Bob each have an arrival date and a leaving date in the same non-leap year. Both date ranges are inclusive.

Return the number of days on which Alice and Bob are both in Rome.

## Approach

Find the overlap between the two date ranges:

- The overlap starts at the later of the two arrival dates.
- The overlap ends at the earlier of the two leaving dates.

Because all dates use the fixed-width `MM-DD` format and belong to the same year, lexicographical string comparison correctly compares the dates.

If the overlap starts after it ends, the ranges do not intersect, so return `0`.

Otherwise, convert both dates to their day number within the year and calculate the inclusive interval length:

```text
endDay - startDay + 1
```

The helper method `getDayOfYear` adds the number of days in all preceding months to the date's day.

## Java Solution

```java
class Solution {
    public int countDaysTogether(String arriveAlice, String leaveAlice,
                                 String arriveBob, String leaveBob) {
        String start = arriveAlice.compareTo(arriveBob) > 0
                ? arriveAlice
                : arriveBob;

        String end = leaveAlice.compareTo(leaveBob) < 0
                ? leaveAlice
                : leaveBob;

        if (start.compareTo(end) > 0) {
            return 0;
        }

        int startDay = getDayOfYear(start);
        int endDay = getDayOfYear(end);

        return endDay - startDay + 1;
    }

    private int getDayOfYear(String date) {
        int[] daysInMonth = {
                31, 28, 31, 30, 31, 30,
                31, 31, 30, 31, 30, 31
        };

        int month = Integer.parseInt(date.substring(0, 2));
        int day = Integer.parseInt(date.substring(3, 5));
        int totalDays = day;

        for (int i = 0; i < month - 1; i++) {
            totalDays += daysInMonth[i];
        }

        return totalDays;
    }
}
```

## Example 1

**Input**

```text
arriveAlice = "08-15"
leaveAlice = "08-18"
arriveBob = "08-16"
leaveBob = "08-19"
```

The shared interval is August 16 through August 18, inclusive.

**Output**

```text
3
```

## Example 2

**Input**

```text
arriveAlice = "10-01"
leaveAlice = "10-31"
arriveBob = "11-01"
leaveBob = "12-31"
```

The date ranges do not overlap.

**Output**

```text
0
```

## Complexity Analysis

- **Time Complexity:** `O(1)` — only a fixed number of date comparisons and month calculations are performed.
- **Space Complexity:** `O(1)` — the solution uses a fixed-size month-length array and a constant number of variables.

## Key Concepts

- Interval Intersection
- Date Comparison
- Inclusive Ranges
- String Parsing
