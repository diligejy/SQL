SELECT ename, TO_CHAR(hiredate, 'DAY') as 요일, TO_CHAR(sal, '999,999') as 월급
   FROM emp
   WHERE ename = 'SCOTT';
   
SELECT hiredate, TO_CHAR(hiredate, 'RRRR') as 연도, TO_CHAR(hiredate, 'MM') as 달, 
                          TO_CHAR(hiredate, 'DD') as 일, TO_CHAR(hiredate, 'DAY') as 요일
   FROM emp
   WHERE ename = 'KING';
   
SELECT ename, hiredate
   FROM emp
   WHERE TO_CHAR(hiredate, 'RRRR') = '1981';
   
SELECT ename as 이름, EXTRACT(year from hiredate) as 연도,
                                  EXTRACT(MONTH from hiredate) as 달,
                                  EXTRACT(day from hiredate) as 요일
   FROM emp;
   
   
SELECT ename as 이름, TO_CHAR(sal, '999,999') as 월급
   FROM emp;
   
SELECT ename as 이름, TO_CHAR(sal*200, '999,999,999') as 월급
   FROM emp;
   
-- 원화로
SELECT ename as 이름, TO_CHAR(sal*200, 'L999,999,999') as 월급
   FROM emp;