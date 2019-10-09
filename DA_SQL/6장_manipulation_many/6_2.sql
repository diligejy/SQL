
-- q1, q2 �÷��� ���ϴ� ����
SELECT
	year
	, q1
	, q2
	-- Q1�� Q2�� ���� ��ȭ ���ϱ�
	, CASE
	WHEN q1 < q2 THEN '+'
	WHEN q1 = q2 THEN ' '
	ELSE '-'
	END AS judge_q1_q2
	-- Q1�� Q2�� ������� ���� ����ϱ�
	, q2 - q1 AS diff_q2_q1
	-- Q1�� Q2�� ���� ��ȭ�� 1, 0, -1�� ǥ���ϱ�
	, SIGN(q2 - q1) AS sign_q2_q1
FROM
	quarterly_sales
ORDER BY
	year;