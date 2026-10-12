```sql
SELECT DISTINCT
    l1.num AS ConsecutiveNums
FROM Logs AS l1
JOIN Logs AS l2
    ON l2.id = l1.id + 1
   AND l2.num = l1.num
JOIN Logs AS l3
    ON l3.id = l1.id + 2
   AND l3.num = l1.num;
```