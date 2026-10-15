# 3475. DNA Pattern Recognition

**LeetCode:** [3475. DNA Pattern Recognition](https://leetcode.com/problems/dna-pattern-recognition/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Analyze ordered records to identify the consecutive sequence or pattern required by **DNA Pattern Recognition**.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
SELECT sample_id, dna_sequence, species
FROM Samples
WHERE dna_sequence REGEXP 'ATG';
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
