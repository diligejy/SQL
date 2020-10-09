SELECT 
	q.YEAR
	-- Q1에서 Q4까지의 레이블 이름 출력
	, CASE 
		WHEN p.idx = 1 THEN 'q1'
		WHEN p.idx = 2 THEN 'q2'
		WHEN p.idx = 3 THEN 'q3'
		WHEN p.idx = 4 THEN 'q4'
	END AS quarter
	-- Q1에서 Q4까지의 매출 출력하기
	, CASE 
		WHEN p.idx = 1 THEN q.q1
		WHEN p.idx = 2 THEN q.q2
		WHEN p.idx = 3 THEN q.q3
		WHEN p.idx = 4 THEN q.q4
	END AS sales
FROM 
	QUARTERLY_SALES AS q
	CROSS JOIN
	-- 행으로 전개하고 싶은 열의 수만큼 순번 테이블 만들기
	(
			SELECT 1 AS idx
	UNION ALL SELECT 2 AS idx
	UNION ALL SELECT 3 AS idx
	UNION ALL SELECT 4 AS idx
	) AS p;