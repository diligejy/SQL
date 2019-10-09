
-- 단순한 연산으로 평균 4분기 매출을 구하는 쿼리
SELECT 
	year
	, (q1 + q2 + q3 + q4) / 4 AS average
FROM 
	quarterly_sales
ORDER BY 
	year;