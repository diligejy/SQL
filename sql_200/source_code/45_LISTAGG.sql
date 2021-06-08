SELECT deptno, LISTAGG(ename, ',') within group (order by ename) as EMPLOYEE
   FROM emp
   GROUP BY deptno;
   
SELECT job, LISTAGG(ename, ',') within group (ORDER BY ename asc) as EMPLOYEE
   FROM emp
   GROUP BY job;
   
SELECT job, LISTAGG(ename||'('||sal||')',',') within group (ORDER BY ename asc) as EMPLOYEE
   FROM emp
   GROUP BY job;