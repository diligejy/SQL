SELECT ename, sal*12 as "����"
  FROM emp
  WHERE sal*12 >= 36000;
  
SELECT ename, sal, comm, sal + comm
  FROM emp
  WHERE deptno = 10;
  
-- COALESCE ->�÷����� 
SELECT ename, sal, COALESCE(comm, 0)
   FROM emp
   WHERE ename = 'KING';