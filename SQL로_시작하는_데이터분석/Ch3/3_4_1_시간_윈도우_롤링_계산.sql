SELECT 
	a.sales_month 
	, a.sales
	, b.sales_month AS rolling_sales_month
	, b.sales AS rolling_sales
FROM us_retail_sales a 
JOIN us_retail_sales b 
ON a.kind_of_business = b.kind_of_business 
AND b.sales_month BETWEEN a.sales_month - INTERVAL '11 months' AND a.sales_month 
AND b.kind_of_business = 'Women''s clothing stores'
WHERE a.kind_of_business = 'Women''s clothing stores'
AND a.sales_month = '2019-12-01';

SELECT
	a.sales_month
	, a.sales
	, avg(b.sales) AS moving_avg
	, count(b.sales) AS records_count
FROM us_retail_sales a
JOIN us_retail_sales b 
ON a.kind_of_business = b.kind_of_business 
AND b.sales_month BETWEEN a.sales_month - INTERVAL '11 months' AND a.sales_month 
AND b.kind_of_business = 'Women''s clothing stores'
WHERE a.kind_of_business = 'Women''s clothing stores'
AND a.sales_month >= '1993-01-01'
GROUP BY 1, 2
ORDER BY 1;

SELECT
	sales_month
	, avg(sales) OVER (ORDER BY sales_month ROWS BETWEEN 11 PRECEDING AND CURRENT row) AS moving_avg
	, count(sales) OVER (ORDER BY sales_month ROWS BETWEEN 11 PRECEDING AND CURRENT row) AS records_count
FROM us_retail_sales
WHERE kind_of_business = 'Women''s clothing stores';