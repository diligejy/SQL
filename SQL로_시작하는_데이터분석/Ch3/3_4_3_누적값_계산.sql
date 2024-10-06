SELECT 
	sales_month
	, sales 
	, sum(sales) OVER (PARTITION BY date_part('year', sales_month) ORDER BY sales_month) AS sales_ytd 
FROM us_retail_sales 
WHERE kind_of_business = 'Women''s clothing stores';