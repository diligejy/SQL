SELECT ename, comm, NVL(comm, 0)
   FROM emp;
   
   
SELECT ename, sal, comm, sal+comm
   FROM emp
   WHERE job IN ('SALESMAN', 'ANALYST');
   
SELECT ename, sal, comm, NVL(comm, 0), sal + NVL(comm, 0)
   FROM emp
   WHERE job IN ('SALESMAN', 'ANALYST');
   
SELECT ename, sal, comm, NVL2(comm, sal+comm, sal)
   FROM emp
   WHERE job IN ('SALESMAN', 'ANALYST');