
-- ���� �ڷ����� �����͸� ������ ����

SELECT 
	dt
	, ad_id
	
	-- Hive, Redshift, BigQuery, SparkSQL�� ��� 
	-- ������ ���� ���� �ڵ������� �Ǽ��� ��ȯ
	-- , clicks / impressions AS ctr
	-- PostgreSQL�� ��� ������ ������ �Ҽ����� �޶����Ƿ� ��������� �ڷ��� ��ȯ
	, CAST(clicks AS double precision) / impressions AS ctr
	-- �Ǽ��� ����� �տ� �ΰ� ����ϸ� �Ϲ������� �ڷ��� ��ȯ�� �Ͼ
	, 100.0 * clicks / impressions AS ctr_as_percent
FROM 
	advertising_stats AS ads
WHERE
	dt = '2017-04-01'
ORDER BY
	dt, ad_id
;
