
-- 연간 최대/최소 4분기 매출을 찾는 쿼리
SELECT 
	year
	-- Q1-Q4의 최대 매출 구하기
	,GREATEST(Q1, Q2, Q3, Q4) AS greatest_sales
	-- Q1-Q4의 최소 매출 구하기
	, LEAST(Q1, Q2, Q3, Q4) AS least_sales
FROM 
	quarterly_sales
ORDER BY 
	year;