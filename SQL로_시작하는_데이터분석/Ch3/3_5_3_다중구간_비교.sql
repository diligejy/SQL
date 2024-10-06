SELECT 
	sales_month 
	, sales
	, lag(sales, 1) OVER (PARTITION BY date_part('month', sales_month) ORDER BY sales_month) AS prev_sales_1
	, lag(sales, 2) OVER (PARTITION BY date_part('month', sales_month) ORDER BY sales_month) AS prev_sales_2
	, lag(sales, 3) OVER (PARTITION BY date_part('month', sales_month) ORDER BY sales_month) AS prev_sales_3
FROM us_retail_sales 
WHERE kind_of_business = 'Book stores';


-- 최근 3년의 월 매출 평균 대비 올해 월 매출 비율
SELECT
	sales_month 
	, sales_month 
	, CAST(sales AS decimal) / ((prev_sales_1 + prev_sales_2 + prev_sales_3)/ 3) * 100 AS pct_of_3_prev
FROM 
(SELECT 
	sales_month 
	, sales 
	, lag(sales, 1) OVER (PARTITION BY date_part('month', sales_month) ORDER BY sales_month) AS prev_sales_1
	, lag(sales, 2) OVER (PARTITION BY date_part('month', sales_month) ORDER BY sales_month) AS prev_sales_2
	, lag(sales, 3) OVER (PARTITION BY date_part('month', sales_month) ORDER BY sales_month) AS prev_sales_3
FROM us_retail_sales 
WHERE kind_of_business = 'Book stores') AS a ;

SELECT 
	sales_month
	, sales 
	, CAST(sales AS decimal) / avg(sales) OVER (PARTITION BY date_part('month', sales_month) ORDER BY sales_month ROWS BETWEEN 3 PRECEDING AND 1 preceding) * 100 AS pct_of_prev_3
FROM us_retail_sales
WHERE kind_of_business = 'Book stores';