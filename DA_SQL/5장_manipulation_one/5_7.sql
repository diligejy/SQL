
-- Ÿ�ӽ����� �ڷ����� �����Ϳ��� ��, ��, �� ���� �����ϴ� ����
SELECT
	stamp
	-- PostgreSQL, Redshift, BigQuery�� ��� EXTRACT �Լ� ����ϱ�
	, EXTRACT(YEAR FROM stamp) AS year
	, EXTRACT(MONTH FROM stamp) AS month
	, EXTRACT(DAY FROM stamp) AS day
	, EXTRACT(HOUR FROM stamp) AS hour
	
	-- Hive, SparkSQL�� ��� EXTRACT �Լ� ��� ������ ���� �Լ� ����ϱ�
	-- , YEAR(stamp) AS year
	-- , MONTH(stamp) AS month
	-- , DAY(stamp) AS day
	-- , HOUR(stamp) AS hour
FROM (SELECT CAST('2016-01-30 12:00:00' AS timestamp) AS stamp) AS t
;