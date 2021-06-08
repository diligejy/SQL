SELECT UPPER(ename), LOWER(ename), INITCAP(ename)
   FROM emp;
   
SELECT ename, sal
   FROM emp
   WHERE LOWER(ename) = 'scott';