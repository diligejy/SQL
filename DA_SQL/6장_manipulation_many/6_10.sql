
-- ������ ���̺� ���� ���� ��� ������(��Ŭ���� �Ÿ�)�� ���ϴ� ����

SELECT 
	-- sqrt(power(x1 - x2, 2) + power(y1 - y2, 2)) AS dist
	-- PostgreSQL�� ���� point �ڷ����� �Ÿ� ������ <-> ����ϱ�
	point(x1, y1) <-> point(x2, y2) AS dist
FROM location_2d
;

SELECT * from location_2d;