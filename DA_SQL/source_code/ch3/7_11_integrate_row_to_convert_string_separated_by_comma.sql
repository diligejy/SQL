SELECT 	
	purchase_id
	
	-- 상품 ID를 배열에 집약하고 쉼표로 구분된 문자열로 변환
	-- PostgreSQL, BigQuery의 경우 string_agg 사용
	, string_agg(product_id, ',') AS product_ids
	
	-- RedShift의 경우에는 listagg 사용하기
	--, listagg(product_id, ',) AS product_ids
	
	-- Hive, SparkSQL의 경우 collect_list와 concat_ws 사용하기
	-- , concat-ws(',), collect_list(product_id)) AS product_ids
	, sum(price) AS amount
FROM PURCHASE_DETAIL_LOG PDL 
GROUP BY PURCHASE_ID 
ORDER BY PURCHASE_ID 
;