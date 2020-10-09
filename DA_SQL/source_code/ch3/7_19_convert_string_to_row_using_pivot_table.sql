SELECT 
	l.purchase_id
	, l.product_ids
	-- 상품 수 만큼 순번 붙이기
	, p.idx
	-- 문자열을 쉼표로 구분해서 분할하고 idx번째 요소 추출하기
	, split_part(l.product_ids, ',', p.idx) AS product_id
FROM 
	purchase_log AS l 
	JOIN
	(
			SELECT 1 AS idx 
	UNION ALL SELECT 2 AS IDX 
	UNION ALL SELECT 3 AS idx 
	) AS p 
	-- 피벗 테이블의 id가 상품 수 이하의 경우 결합
	ON p.idx <= 
		(1 + char_length(l.product_ids)
			- char_length(REPLACE(l.product_ids, ',', '')))	