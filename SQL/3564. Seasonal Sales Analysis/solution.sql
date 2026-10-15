SELECT YEAR(sale_date) AS year, QUARTER(sale_date) AS quarter,
       SUM(sales_amount) AS total_sales
FROM Sales GROUP BY YEAR(sale_date), QUARTER(sale_date)
ORDER BY year, quarter;
