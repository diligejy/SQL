SELECT sales_month
	, sales 
	, lag(sales_month) OVER (PARTITION BY date_part('month', sales_month) ORDER BY sales_month) AS prev_year_month
	, lag(sales) OVER (PARTITION BY date_part('month', sales_month) ORDER BY sales_month) AS prev_year_sales
FROM us_retail_sales
WHERE kind_of_business = 'Book stores';

SELECT 
	sales_month 
	, sales - lag(sales) OVER (PARTITION BY date_part('month', sales_month) ORDER BY sales_month) AS absolute_diff
	, (CAST(sales AS decimal) / lag(sales) OVER (PARTITION BY date_part('month', sales_month) ORDER BY sales_month) -1) * 100 AS pct_diff 
FROM us_retail_sales 
WHERE kind_of_business = 'Book stores';

SELECT date_part('month', sales_month) AS month_number
	, to_char(sales_month, 'Month') AS month_name
	, max(CASE WHEN date_part('year', sales_month) = 1992 THEN sales END) AS sales_1992
	, max(CASE WHEN date_part('year', sales_month) = 1993 THEN sales END) AS sales_1993
	, max(CASE WHEN date_part('year', sales_month) = 1994 THEN sales END) AS sales_1994
FROM us_retail_sales 
WHERE kind_of_business = 'Book stores'
AND sales_month BETWEEN '1992-01-01' AND '1994-12-01'
GROUP BY 1, 2;