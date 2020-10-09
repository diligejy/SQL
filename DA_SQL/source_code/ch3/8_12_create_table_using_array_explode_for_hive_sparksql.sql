WITH 
mst_devices AS (
	SELECT 
		-- 배열을 열로 전개하기
		d[0] AS device_id
		, d[1] AS device_name
	FROM 
		-- 배열을 테이블로 전개하기
	(SELECT explode(
		array(
			array('1', 'PC')
			, array('2', 'SP')
			, array('3', '애플리케이션')
		)) d	
	) AS t
)
SELECT * 
FROM mst_devices