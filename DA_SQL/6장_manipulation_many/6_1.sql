
-- ���ڿ��� �����ϴ� ����
SELECT 
	user_id
	-- PostgreSQL, Hive, Redshift, BigQuery, SparkSQL ��� CONCAT �Լ� ��� ���� 
	-- �ٸ� Redshift�� ���� �Ű������� 2�� �ۿ� �� ����
	, CONCAT(pref_name, city_name) AS pref_city
	-- PostgreSQL, Redshift�� ���� || �����ڵ� ��밡��
	-- , pref_name || city_name AS pref_city
FROM
	mst_user_location
;