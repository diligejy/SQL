SELECT a.date, b.sales_month, b.sales
FROM date_dim a
JOIN
(
    SELECT sales_month, sales
    FROM us_retail_sales urs 
    WHERE kind_of_business = 'Women''s clothing stores'
     and date_part('month',sales_month) in (1,7)
) b on b.sales_month between a.date - interval '11 months' and a.date
WHERE a.date = a.first_day_of_month
 and a.date between '1993-01-01' and '2020-12-01'
ORDER BY 1,2;


SELECT
	a.date 
	, avg(b.sales) AS moving_avg
	, count(b.sales) AS records
FROM date_dim a 
JOIN (
SELECT 
	sales_month
	, sales 
FROM us_retail_sales
WHERE kind_of_business = 'Women''s clothing stores'
AND date_part('month', sales_month) IN (1, 7)
) AS b 
ON b.sales_month BETWEEN a.date - INTERVAL '11 months' AND a.date 
WHERE a.date = a.first_day_of_month 
AND a.date BETWEEN '1993-01-01' AND '2020-12-01'
GROUP BY 1
ORDER BY 1;

SELECT 
	a.sales_month
	, avg(b.sales) AS moving_avg
FROM 
(SELECT DISTINCT sales_month
FROM us_retail_sales 
WHERE sales_month BETWEEN '1993-01-01' AND '2020-12-01'
) AS a  
JOIN us_retail_sales b 
ON b.sales_month BETWEEN a.sales_month - INTERVAL '11 months' AND a.sales_month
AND kind_of_business = 'Women''s clothing stores'
GROUP BY 1
ORDER BY 1
