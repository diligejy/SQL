
-- q1, q2 컬럼을 비교하는 쿼리
SELECT
	year
	, q1
	, q2
	-- Q1과 Q2의 매출 변화 평가하기
	, CASE
	WHEN q1 < q2 THEN '+'
	WHEN q1 = q2 THEN ' '
	ELSE '-'
	END AS judge_q1_q2
	-- Q1과 Q2의 매출액의 차이 계산하기
	, q2 - q1 AS diff_q2_q1
	-- Q1과 Q2의 매출 변화율 1, 0, -1로 표현하기
	, SIGN(q2 - q1) AS sign_q2_q1
FROM
	quarterly_sales
ORDER BY
	year;