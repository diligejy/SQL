WITH
series AS (
	-- 1부터 5까지의 순번 생성하기
	-- PostgreSQL의 경우 generate_series 사용하기
	SELECT generate_series(1, 5) AS idx 
	-- BigQuery의 경우 generate_array 사용
	-- select idx from unnest(generate_array(1, 5)) as idx
)
SELECT *
FROM series;