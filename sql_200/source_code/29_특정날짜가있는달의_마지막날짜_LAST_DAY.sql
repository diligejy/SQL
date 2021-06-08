SELECT '2019/05/22' as 날짜, LAST_DAY('2019/05/22') as "마지막 날짜"
   FROM dual;
   
SELECT LAST_DAY(SYSDATE) - SYSDATE as "남은 날짜"
   FROM dual;
   
SELECT ename, hiredate, LAST_DAY(hiredate)
   FROM emp
   WHERE ename = 'KING';