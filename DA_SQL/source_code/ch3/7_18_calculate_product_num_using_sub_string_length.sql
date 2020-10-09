SELECT 
	purchase_id
	, product_ids
	-- 상품 ID 문자열을 기반으로 쉼표를 제거하고,
	-- 문자 수의 차이를 계산해서 상품 수 구하기
	, 1 + CHAR_LENGTH(product_ids)
		- char_length(REPLACE(product_ids, ',', ''))
	AS product_num
FROM 
	PURCHASE_LOG;