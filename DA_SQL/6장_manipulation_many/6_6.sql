
-- NULL이 아닌 컬럼만을 사용해서 평균값을 구하는 쿼리
 SELECT
	year ,
	(COALESCE(q1, 0) + COALESCE(q2, 0) + COALESCE(q3, 0) + COALESCE(q4, 0)) / SIGN(COALESCE(q1, 0)) + SIGN(COALESCE(q2, 0)) + SIGN(COALESCE(q3, 0)) + SIGN(COALESCE(q4, 0)) AS average
FROM
	quarterly_sales
ORDER BY
	year;