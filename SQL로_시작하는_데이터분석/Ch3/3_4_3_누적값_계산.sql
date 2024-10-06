SELECT 
	sales_month
	, sales 
	, sum(sales) OVER (PARTITION BY date_part('year', sales_month) ORDER BY sales_month) AS sales_ytd 
FROM us_retail_sales 
WHERE kind_of_business = 'Women''s clothing stores';

SELECT 
	a.sales_month
	, a.sales
	, sum(b.sales) AS sales_ytd 
FROM us_retail_sales a 
JOIN us_retail_sales b 
ON date_part('year', a.sales_month) = date_part('year', b.sales_month)
AND b.sales_month <= a.sales_month 
AND b.kind_of_business = 'Women''s clothing stores'
WHERE a.kind_of_business = 'Women''s clothing stores'
GROUP BY 1, 2;