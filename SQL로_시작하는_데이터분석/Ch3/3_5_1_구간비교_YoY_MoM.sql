SELECT 
	kind_of_business
	, sales_month 
	,  sales 
	, lag(sales_month) OVER (PARTITION BY kind_of_business ORDER BY sales_month) AS prev_month
	, lag(sales) OVER (PARTITION BY kind_of_business ORDER BY sales_month) AS prev_month_sales
FROM us_retail_sales 
WHERE kind_of_business = 'Book stores';

SELECT 
	kind_of_business
	, sales_month
	, sales 
	, (CAST(sales AS decimal) / LAG(sales) OVER (PARTITION BY kind_of_business ORDER BY sales_month) - 1) * 100 AS pct_growth_from_previous
FROM us_retail_sales 
WHERE kind_of_business = 'Book stores';

