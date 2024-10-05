SELECT date_part('year', sales_month) AS sales_year 
	, kind_of_business
	, sum(sales) AS sales
FROM us_retail_sales 
WHERE kind_of_business IN ('Book stores', 'Sporting goods stores', 'Hobby, toy, and game stores')
GROUP BY 1, 2
ORDER BY 1, 2;

SELECT sales_month
	, kind_of_business
	, sales
FROM us_retail_sales
WHERE kind_of_business IN ('Men''s clothing stores', 'Women''s clothing stores')
ORDER BY 1, 2;

SELECT date_part('year', sales_month) AS sales_year 
	, kind_of_business
	, sum(sales) AS sales
FROM us_retail_sales 
WHERE kind_of_business IN ('Men''s clothing stores', 'Women''s clothing stores')
GROUP BY 1, 2
ORDER BY 1, 2;

SELECT date_part('year', sales_month) AS sales_year
	, sum(CASE WHEN kind_of_business = 'Women''s clothing stores'
			THEN sales end) AS womens_sales
	, sum(CASE WHEN kind_of_business = 'Men''s clothing stores'
			THEN sales end) AS mens_sales
FROM us_retail_sales 
WHERE kind_of_business IN ('Men''s clothing stores', 'Women''s clothing stores')
GROUP BY 1
ORDER BY 1;

SELECT 
	sales_year 
	, womens_sales - mens_sales AS womens_minus_mens
	, mens_sales - womens_sales AS mens_minus_womens
FROM 
(SELECT date_part('year', sales_month) AS sales_year
	, sum(CASE WHEN kind_of_business = 'Women''s clothing stores'
			THEN sales end) AS womens_sales
	, sum(CASE WHEN kind_of_business = 'Men''s clothing stores'
			THEN sales end) AS mens_sales
FROM us_retail_sales 
WHERE kind_of_business IN ('Men''s clothing stores', 'Women''s clothing stores')
AND sales_month <= '2019-12-01'
GROUP BY 1) AS t
ORDER BY 1;

SELECT date_part('year', sales_month) AS sales_year
	, sum(CASE WHEN kind_of_business = 'Women''s clothing stores'
			THEN sales end)  - sum(CASE WHEN kind_of_business = 'Men''s clothing stores'
			THEN sales end) AS womens_minus_mens
FROM us_retail_sales 
WHERE kind_of_business IN ('Men''s clothing stores', 'Women''s clothing stores')
AND sales_month <= '2019-12-01'
GROUP BY 1
ORDER BY 1; 

SELECT
	sales_year 
	, womens_sales / CAST(mens_sales AS decimal) AS womens_times_of_mens
FROM 
(SELECT date_part('year', sales_month) AS sales_year
	, sum(CASE WHEN kind_of_business = 'Women''s clothing stores'
			THEN sales end) AS womens_sales
	, sum(CASE WHEN kind_of_business = 'Men''s clothing stores'
			THEN sales end) AS mens_sales
FROM us_retail_sales 
WHERE kind_of_business IN ('Men''s clothing stores', 'Women''s clothing stores')
AND sales_month <= '2019-12-01'
GROUP BY 1) AS t 
ORDER BY 1;


SELECT
	sales_year 
	, (womens_sales / CAST(mens_sales AS decimal) - 1) * 100 AS womens_pct_of_mens
FROM 
(SELECT date_part('year', sales_month) AS sales_year
	, sum(CASE WHEN kind_of_business = 'Women''s clothing stores'
			THEN sales end) AS womens_sales
	, sum(CASE WHEN kind_of_business = 'Men''s clothing stores'
			THEN sales end) AS mens_sales
FROM us_retail_sales 
WHERE kind_of_business IN ('Men''s clothing stores', 'Women''s clothing stores')
AND sales_month <= '2019-12-01'
GROUP BY 1) AS t 
ORDER BY 1;