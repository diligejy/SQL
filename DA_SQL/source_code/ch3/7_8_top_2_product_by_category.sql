SELECT *
FROM 
	-- 서브쿼리 내부에서 순위 계산
	(SELECT 
		category
		, product_id
		, score
		-- 카테고리 별로 점수 순서로 유일한 순위를 붙임
		, ROW_number()
			over(PARTITION BY category ORDER BY score desc)
		  AS RANK 
	  FROM POPULAR_PRODUCTS 
	) AS popular_products_with_rank
-- 외부 쿼리에서 순위 활용해 압축하기
WHERE RANK <= 2
ORDER BY category, rank;