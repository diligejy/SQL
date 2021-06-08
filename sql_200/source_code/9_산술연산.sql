SELECT ename, sal*12 as "연봉"
  FROM emp
  WHERE sal*12 >= 36000;
  
SELECT ename, sal, comm, sal + comm
  FROM emp
  WHERE deptno = 10;
  
-- COALESCE ->컬러레스 
SELECT ename, sal, COALESCE(comm, 0)
   FROM emp
   WHERE ename = 'KING';