SELECT '2019/05/22' as ��¥, LAST_DAY('2019/05/22') as "������ ��¥"
   FROM dual;
   
SELECT LAST_DAY(SYSDATE) - SYSDATE as "���� ��¥"
   FROM dual;
   
SELECT ename, hiredate, LAST_DAY(hiredate)
   FROM emp
   WHERE ename = 'KING';