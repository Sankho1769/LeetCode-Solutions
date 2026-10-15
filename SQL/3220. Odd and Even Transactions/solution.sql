SELECT user_id,
       SUM(CASE WHEN amount % 2 = 1 THEN amount ELSE 0 END) AS odd_sum,
       SUM(CASE WHEN amount % 2 = 0 THEN amount ELSE 0 END) AS even_sum
FROM Transactions GROUP BY user_id;
