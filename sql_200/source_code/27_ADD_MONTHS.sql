SELECT ADD_MONTHS(TO_DATE('2019-05-01', 'RRRR-MM-DD'), 100)
   FROM dual;
   
-- 100�� ��
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + 100
   FROM dual;
   
-- 100���� ��
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + interval '100' month
   FROM dual;
   
-- 1�� 3���� ��
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + interval '1-3' year(1) to month
   FROM dual;

SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + interval '3' year
   FROM dual;
   
-- 3�� 5������
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + TO_YMINTERVAL('03-05') as ��¥
   FROM dual;