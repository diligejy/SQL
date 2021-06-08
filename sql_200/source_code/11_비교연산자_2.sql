SELECT ename, sal
   FROM emp
   WHERE sal BETWEEN 1000 AND 3000;
   
SELECT ename, sal
    FROM emp
    WHERE (sal >= 1000 AND sal <= 3000);
    
SELECT ename, sal
   FROM emp
   WHERE sal NOT BETWEEN 1000 AND 3000;
   
SELECT ename, sal
   FROM emp
   WHERE (sal < 1000 OR sal > 3000);
   
SELECT ename, hiredate
   FROM emp
   WHERE hiredate BETWEEN '1982/01/01' and '1982/12/31';