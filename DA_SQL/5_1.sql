
-- �ڵ带 ���̺�� �����ϴ� ����
SELECT 
	USER_ID
	, CASE
	WHEN REGISTER_DEVICE = 1 THEN '����ũ��'
	WHEN REGISTER_DEVICE = 2 THEN '����Ʈ��'
	WHEN REGISTER_DEVICE = 3 THEN '���ø����̼�'
	-- ����Ʈ ���� ������ ��� ELSE ������ ���
	-- ELSE ''
	END AS device_name
FROM mst_users;