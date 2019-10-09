
-- 0���� ������ ���� ���� CTR�� ����ϴ� ����
SELECT 
	dt
	, ad_id
	-- CASE ������ �и� 0�� ��츦 �б��ؼ�, 0���� ������ �ʰ� ����� ��� 
	, CASE 
		WHEN impressions > 0 THEN 100.0 * clicks / impressions
	END AS ctr_as_percent_by_case
	
	-- �и� 0�̶�� NULL�� ��ȯ�ؼ� 0���� ������ �ʰ� ����� ���
	-- PostgreSQL, Redshift, BigQuery, SparkSQL�� ��� NULLIF �Լ� ����ϱ�
	, 100.0 * clicks / NULLIF(impressions, 0) AS ctr_as_percent_by_null
	-- Hive�� ��� NULLIF ��� CASE �� ����ϱ�
	-- , 100.0 * clicks
	-- / CASE WHEN impression = 0 THEN NULL ELSE impressions END
	-- AS ctr_as_percent_by_null
FROM 
	advertising_stats
ORDER BY 
	dt, ad_id;