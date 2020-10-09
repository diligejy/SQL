SELECT 
	YEAR
	, q1
	, q2
	-- Q1과 Q2의 매출 변화 평가
	, CASE 
		WHEN q1 < q2 THEN '+'
		WHEN q1 = q2 THEN ' '
		ELSE '-'
	END AS judge_q1_q2
	-- Q1과 Q2의 매출액의 차이 계산하기
	, q2 - q1 AS diff_q2_q1
	-- Q1과 Q2의 매출 변화를 1, 0, -1로 표현하기
	, SIGN(q2 -q1) AS sign_q2_q1
FROM 
	quarterly_sales
ORDER BY
	YEAR;