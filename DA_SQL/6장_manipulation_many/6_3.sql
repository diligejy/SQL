
-- ���� �ִ�/�ּ� 4�б� ������ ã�� ����
SELECT 
	year
	-- Q1-Q4�� �ִ� ���� ���ϱ�
	,GREATEST(Q1, Q2, Q3, Q4) AS greatest_sales
	-- Q1-Q4�� �ּ� ���� ���ϱ�
	, LEAST(Q1, Q2, Q3, Q4) AS least_sales
FROM 
	quarterly_sales
ORDER BY 
	year;