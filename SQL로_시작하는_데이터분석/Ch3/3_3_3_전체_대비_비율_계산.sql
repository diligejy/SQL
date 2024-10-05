SELECT
	sales_month
	, kind_of_business
	, CAST(sales AS decimal) * 100 / total_sales AS pct_total_sales
FROM  
(
SELECT
	a.sales_month 
	, a.kind_of_business 
	, a.sales
	, sum(b.sales) AS total_sales
FROM us_retail_sales a 
JOIN us_retail_sales b 
ON a.sales_month = b.sales_month AND b.kind_of_business IN ('Men''s clothing stores', 'Women''s clothing stores')
WHERE a.kind_of_business IN ('Men''s clothing stores', 'Women''s clothing stores')
GROUP BY 1, 2, 3
) AS aa
ORDER BY 1, 2;

SELECT sales_month 
	, kind_of_business 
	, sales
	, sum(sales) OVER (PARTITION BY sales_month) AS total_sales
	, CAST(sales AS decimal) * 100 / sum(sales) OVER (PARTITION BY sales_month) pct_total
FROM us_retail_sales 
WHERE kind_of_business IN ('Men''s clothing stores', 'Women''s clothing stores')
ORDER BY 1, 2;