SELECT 	
	category
	, product_id
	, score
	
	-- 카테고리 별로 점수 순서로 정렬하고 유일한 순위를 붙임
	, row_number()
		over(PARTITION BY category ORDER BY score desc)
			AS ROW
			
	-- 카테고리 별로 같은 순위를 허가하고 순위를 붙임
	, rank()
		over(PARTITION BY category ORDER BY score desc)
			AS RANK
			
	-- 카테고리별로 같은 순위가 있을 때
	-- 같은 순위 다음에 있는 순위를 건너 뛰고 순위를 붙임
	, DENSE_RANK()
		over(PARTITION BY category ORDER BY score desc)
			AS DENSE_RANK

FROM POPULAR_PRODUCTS 
ORDER BY category, ROW;