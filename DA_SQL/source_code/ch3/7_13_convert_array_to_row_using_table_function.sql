
SELECT array['A001', 'A002', 'A003'];

-- PostgreSQL의 경우 unnest 함수 사용
SELECT unnest(ARRAY['A001', 'A002', 'A003']) AS product_id;

-- BigQuery의 경우도 unnest함수 사용하지만 
-- 테이블 함수는 FROM 구문 내부에서만 사용할 수 있음
-- SELECT * FROM unnest(array['A001', 'A002', 'A003']) AS product_id;

-- Hive, SparkSQL의 경우 explode 함수 사용
-- SELECT explode(array('A001', 'A002', 'A003')) AS product_id;