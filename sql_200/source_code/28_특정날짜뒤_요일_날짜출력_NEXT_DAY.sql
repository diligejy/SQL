-- Ư�� ��¥ �ڿ� ���� ���� ��¥ ���
SELECT '20019/05/22' as ��¥, NEXT_DAY('2019/05/22', '������')
   FROM dual;
   
SELECT SYSDATE as "���� ��¥"
   FROM dual;
   
SELECT NEXT_DAY(SYSDATE, 'ȭ����') as "���� ��¥"
   FROM dual;
   
-- 100���� �� ȭ���� ��¥
SELECT NEXT_DAY(ADD_MONTHS('2019/05/22', 100), 'ȭ����') as "���� ��¥"
   FROM dual;

SELECT NEXT_DAY(ADD_MONTHS(sysdate, 100), '������') as "���� ��¥"
   FROM dual;