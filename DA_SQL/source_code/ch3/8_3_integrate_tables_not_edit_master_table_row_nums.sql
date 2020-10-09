SELECT 
	m.category_id
	, m.name
	, s.sales
	, r.product_id AS top_sale_product
FROM 
	MST_CATEGORIES AS m
	-- LEFT JOIN 사용하여 결합한 레코드를 남김
LEFT JOIN 
	-- 카테고리별 매출액 결합
	CATEGORY_SALES AS s 
	ON m.CATEGORY_ID = s.CATEGORY_ID 
-- ELFT JOIN을 사용하여 결합하지 못한 레코드를 남김
LEFT JOIN 
	-- 카테고리별 최고 매출 상품 하나만 추출해서 결합
	PRODUCT_SALE_RANKING AS r
	ON m.CATEGORY_ID = r.CATEGORY_ID 
	AND r.RANK = 1;