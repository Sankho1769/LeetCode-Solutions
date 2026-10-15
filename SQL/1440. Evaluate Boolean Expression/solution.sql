SELECT e.left_operand, e.operator, e.right_operand,
       CASE e.operator
         WHEN '>' THEN l.value > r.value
         WHEN '<' THEN l.value < r.value
         ELSE l.value = r.value
       END AS value
FROM Expressions e
JOIN Variables l ON l.name = e.left_operand
JOIN Variables r ON r.name = e.right_operand;
