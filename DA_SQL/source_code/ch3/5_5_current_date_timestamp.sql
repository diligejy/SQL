SELECT 
-- PostgreSQL, Hive, BigQuery의 경우
-- CURRENT_DATE 상수와 CURRENT_TIMESTAMP 상수 사용하기
CURRENT_DATE AS dt
, CURRENT_TIMESTAMP AS stamp
-- Hive, BigQuery, SparkSQL의 경우
-- CURRENT_DATE()함수와 CURRENT_TIMESTAMP()함수 사용하기
-- CURRENT_DATE() AS dt
-- CURRENT_TIMESTAMP() AS stamp
-- Redshift의 경우 현재 날짜는 CURRENT_DATE, 현재 타임스탬프는 GENDATE() 사용하기
-- CURRENT_DATE AS dt
-- , GENDATE() AS stamp
-- PostgreSQL의 경우 CURRENT_TIMESTAMP는 타임존이 적용된 타임스탬프
-- 타임존을 적용하고 싶지 않으면 LOCALTIMESTAMP 사용하기
, LOCALTIMESTAMP AS LocalStamp;