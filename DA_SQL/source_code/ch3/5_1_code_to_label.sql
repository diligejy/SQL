select 
	USER_ID
	, case 
	when REGISTER_DEVICE = 1 then '����ũ��'
	WHEN REGISTER_DEVICE = 2 THEN '����Ʈ��'
	WHEN REGISTER_DEVICE = 3 THEN '���ø����̼�'
	-- ����Ʈ ���� ������ ��� ELSE ������ ���
	-- ELSE ''
	END AS DEVICE_NAME
FROM MST_USERS;

SELECT * FROM MST_USERS;