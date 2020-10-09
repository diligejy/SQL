select 
	USER_ID
	, case 
	when REGISTER_DEVICE = 1 then '데스크톱'
	WHEN REGISTER_DEVICE = 2 THEN '스마트폰'
	WHEN REGISTER_DEVICE = 3 THEN '애플리케이션'
	-- 디폴트 값을 지정할 경우 ELSE 구문을 사용
	-- ELSE ''
	END AS DEVICE_NAME
FROM MST_USERS;

SELECT * FROM MST_USERS;