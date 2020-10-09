SELECT 
	REPLACE(CAST(YEAR AS TEXT), ',', '') AS year
	-- Q1 ~ Q4의 최대 매출 구하기
	, GREATEST(q1, q2, q3, q4) AS greatest_sales
	-- Q1 ~ Q4의 최소 매출 구하기
	, least(q1, q2, q3, q4) AS least_sales
FROM 
	quarterly_sales
ORDER BY
	YEAR;
	
