SELECT sales_month
	, sales
FROM us_retail_sales 
WHERE kind_of_business = 'Retail and food services sales, total'
ORDER BY 1;

SELECT date_part('year', sales_month) AS sales_year
	, sum(sales) AS sales
FROM us_retail_sales 
WHERE kind_of_business = 'Retail and food services sales, total'
GROUP BY 1
ORDER BY 1;

