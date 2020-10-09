SELECT 
	m.category_id
	, m.name
	, s.sales
	, r.product_id AS sale_product
FROM 
	MST_CATEGORIES AS m
	JOIN 
	-- 카테고리별로 매출액 결합
	category_sales AS s 
	ON m.category_id = s.CATEGORY_ID 
	JOIN 
	-- 카테고리별로 상품 결합하기
	PRODUCT_SALE_RANKING AS r 
	ON m.category_id = r.CATEGORY_ID 
;