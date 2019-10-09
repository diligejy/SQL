
-- 코드를 레이블로 변경하는 쿼리
SELECT 
	USER_ID
	, CASE
	WHEN REGISTER_DEVICE = 1 THEN '데스크톱'
	WHEN REGISTER_DEVICE = 2 THEN '스마트폰'
	WHEN REGISTER_DEVICE = 3 THEN '애플리케이션'
	-- 디폴트 값을 지정할 경우 ELSE 구문을 사용
	-- ELSE ''
	END AS device_name
FROM mst_users;