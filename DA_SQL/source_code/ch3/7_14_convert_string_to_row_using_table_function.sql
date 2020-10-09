SELECT 
	purchase_id
	, product_id
FROM 
	purchase_log AS p 
-- string_to_array함수로 문자열을 배열로 변환하고, UNNEST 함수로 테이블로 변환하기
CROSS JOIN unnest(string_to_array(product_id, ',')) AS product_id

-- BigQuery의 경우 문자열 분해에 split함수 사용하기
-- CROSS JOIN unnest(split(product_ids, ',')) AS product_id

-- Hive와 SparkSQL의 경우 LATERAL VIEW explode 사용하기
-- LATERAL VIEW explode(split(product_ids, ',')) e AS product_id;

