
-- Ÿ�ӽ������� ��Ÿ���� ���ڿ����� ��, ��, �� ���� �����ϴ� ����
 SELECT
	stamp
	-- PostgreSQL, Hive, RedShift, SparkSQL������ substring�Լ� ����ϱ�
,
	substring(stamp, 1, 4) AS year ,
	substring(stamp, 6, 2) AS month ,
	substring(stamp, 9, 2) AS day ,
	substring(stamp, 12, 2) AS hour
	-- ���� ���� �Բ� �����ϱ�
,
	substring(stamp, 1, 7) AS year_month
	-- PostgreSQL, Hive, BigQuery, SparkSQL������ substr �Լ� ����ϱ�
	-- , substr(stamp, 1, 4) AS year
	-- , substr(stamp, 6, 2) AS month
	-- , substr(stamp, 9, 2) AS day
	-- , substr(stamp, 12, 2) AS hour
	-- , substr(stamp, 1, 7) year_month

	FROM
	-- PostgreSQL, Redshift�� ��� ���ڿ� �ڷ������� text ����ϱ�
(
	SELECT
		CAST('2016-01-30 12:00:00' AS text) AS stamp) AS t
	-- Hive, BigQuery, SparkSQL�� ��� ���ڿ� �ڷ������� string ����ϱ�
	-- (SELECT CAST('2016-01-30 12:00:00' AS string) AS stamp) AS t