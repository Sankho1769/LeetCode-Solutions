# 1212. Team Scores in Football Tournament

**LeetCode:** [1212. Team Scores in Football Tournament](https://leetcode.com/problems/team-scores-in-football-tournament/)  
**Difficulty:** Medium  
**SQL dialect:** MySQL 8.0  
**Status:** Drafted; not runtime-verified in this package

## Problem summary

Write a MySQL query that satisfies the requirements of **Team Scores in Football Tournament**. See the official statement for the exact schema and output specification.

The input file provided the title and difficulty. Refer to the official statement linked above for the complete schema, exact output columns, and constraints.

## Approach

Use the official problem requirements to select the appropriate joins, filters, aggregates, and window functions.

## SQL solution

```sql
WITH scores AS (
    SELECT t.team_id, t.team_name,
           SUM(CASE WHEN m.host_team = t.team_id THEN m.host_goals
                    WHEN m.guest_team = t.team_id THEN m.guest_goals ELSE 0 END) AS scored,
           SUM(CASE WHEN m.host_team = t.team_id THEN m.guest_goals
                    WHEN m.guest_team = t.team_id THEN m.host_goals ELSE 0 END) AS conceded,
           SUM(CASE WHEN (m.host_team = t.team_id AND m.host_goals > m.guest_goals)
                         OR (m.guest_team = t.team_id AND m.guest_goals > m.host_goals) THEN 3
                    WHEN m.host_goals = m.guest_goals THEN 1 ELSE 0 END) AS points
    FROM Teams t LEFT JOIN Matches m ON t.team_id IN (m.host_team, m.guest_team)
    GROUP BY t.team_id, t.team_name
)
SELECT team_id, team_name, points, COUNT(*) AS matches_played,
       SUM(scored) AS goal_for, SUM(conceded) AS goal_against
FROM scores GROUP BY team_id, team_name, points;
```

## Review notes

This query was drafted from the problem title and known LeetCode SQL patterns. It has not been executed against the official test cases in this environment. Verify the official schema, output aliases, ordering requirements, and edge cases before treating it as accepted.
