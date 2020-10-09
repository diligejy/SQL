-- DISTINCT 구문을 사용해 중복 제거
SELECT DISTINCT 	
	category
	-- 카테고리별로 순위 최상위 상품 ID 추출
	, FIRST_VALUE(product_id)
		over(PARTITION BY category ORDER BY score desc
			ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
		AS product_id
FROM POPULAR_PRODUCTS;