WITH
mst_devices AS(
	SELECT 
		-- map 자료형의 데이터를 열로 전개
		d['device_id'] AS device_id
		, d['device_name'] AS device_name
	FROM 
		-- 배열을 테이블로 전개하기
		(SELECT explode(
			array(
				map('device_id', '1', 'device_name', 'PC')
				, map('device_id', '2', 'device_name', 'SP')
				, map('device_id', '3', 'device_name', '애플리케이션')
		)) d
	) AS t
)
SELECT * 
FROM mst_devices;