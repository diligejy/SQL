SELECT 
	m.category_id
	, m.name
	-- 상관 서브 쿼리를 사용해 카테고리별로 매출액 추출
	, (
		SELECT s.sales
		FROM CATEGORY_SALES AS s 
		WHERE m.category_id = s.category_id
	) AS sales 
	-- 상관 서브 쿼리를 사용해 카테고리별로 최고 매출 상품 하나 추출 (순위 따로 압축하지 않아도 됨)
	, (
		SELECT r.product_id
		FROM PRODUCT_SALE_RANKING AS r
		WHERE m.CATEGORY_ID = r.CATEGORY_ID 
		ORDER BY sales DESC
		LIMIT 1
	) AS top_sale_product
FROM 
	MST_CATEGORIES AS m;