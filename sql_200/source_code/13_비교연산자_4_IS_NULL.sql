SELECT ename comm
   FROM emp
   WHERE comm is null;
   
SELECT ename, comm
   FROM emp
   WHERE comm is not null;