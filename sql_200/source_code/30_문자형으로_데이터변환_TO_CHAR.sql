SELECT ename, TO_CHAR(hiredate, 'DAY') as ����, TO_CHAR(sal, '999,999') as ����
   FROM emp
   WHERE ename = 'SCOTT';
   
SELECT hiredate, TO_CHAR(hiredate, 'RRRR') as ����, TO_CHAR(hiredate, 'MM') as ��, 
                          TO_CHAR(hiredate, 'DD') as ��, TO_CHAR(hiredate, 'DAY') as ����
   FROM emp
   WHERE ename = 'KING';
   
SELECT ename, hiredate
   FROM emp
   WHERE TO_CHAR(hiredate, 'RRRR') = '1981';
   
SELECT ename as �̸�, EXTRACT(year from hiredate) as ����,
                                  EXTRACT(MONTH from hiredate) as ��,
                                  EXTRACT(day from hiredate) as ����
   FROM emp;
   
   
SELECT ename as �̸�, TO_CHAR(sal, '999,999') as ����
   FROM emp;
   
SELECT ename as �̸�, TO_CHAR(sal*200, '999,999,999') as ����
   FROM emp;
   
-- ��ȭ��
SELECT ename as �̸�, TO_CHAR(sal*200, 'L999,999,999') as ����
   FROM emp;