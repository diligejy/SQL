SELECT 
	product_id
	, score
	
	-- 점수 순서로 유일한 순위를 붙임
	, row_number() OVER(ORDER BY score desc) AS ROW
	-- 같은 순위를 허용해서 순위를 붙임
	, rank() over(ORDER BY score desc) AS RANK 
	-- 같은 순위가 있을 때 같은 순위 다음에 있는 순위를 건너뛰고 순위를 붙임
	, dense_rank() OVER(ORDER BY score desc) AS DENSE_RANK
	
	-- 현재 행보다 앞에 있는 행의 값 추출하기
	,lag(product_id) over(ORDER BY score desc) AS lag1
	, lag(product_id, 2) over(ORDER BY score desc) AS lag2
	
	-- 현재 행보다 뒤에 있는 행의 값 추출하기
	, lead(product_id) OVER(ORDER BY score desc) AS lead1
	, lead(product_id, 2) over(ORDER BY score desc) AS lead2
FROM POPULAR_PRODUCTS 
ORDER BY ROW;