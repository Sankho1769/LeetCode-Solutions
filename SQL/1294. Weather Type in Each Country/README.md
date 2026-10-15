# 1294. Weather Type in Each Country

**LeetCode:** [1294. Weather Type in Each Country](https://leetcode.com/problems/weather-type-in-each-country/)  
**Difficulty:** Easy  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Aggregate the relevant records to calculate the count, percentage, or rate described by **Weather Type in Each Country**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use `GROUP BY` and aggregate functions; add conditional aggregation for category-specific metrics.

## SQL solution

```sql
SELECT c.country_name,
       CASE WHEN AVG(w.weather_state) <= 15 THEN 'Cold'
            WHEN AVG(w.weather_state) >= 25 THEN 'Hot'
            ELSE 'Warm' END AS weather_type
FROM Countries c JOIN Weather w ON w.country_id = c.country_id
WHERE w.day >= '2019-11-01' AND w.day < '2019-12-01'
GROUP BY c.country_id, c.country_name;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
