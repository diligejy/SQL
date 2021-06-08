SELECT ename, job, sal, RANK() over (ORDER BY sal DESC) AS RANK,
                                   DENSE_RANK() over (ORDER BY sal DESC) AS DENSE_RANK
   FROM emp
   WHERE job in ('ANALYST', 'MANAGER');
   
SELECT job, ename, sal, DENSE_RANK() over (PARTITION BY job ORDER BY sal DESC) 순위
   FROM emp
   WHERE hiredate BETWEEN to_date('1981/01/01', 'RRRR/MM/DD')
                                     AND to_date('1981/12/31', 'RRRR/MM/DD');
                                     
SELECT DENSE_RANK(2975) within group (ORDER BY sal DESC) 순위
   FROM emp;
   
SELECT DENSE_RANK('81/11/17') within group (ORDER BY hiredate ASC) 순위
   FROM emp;
   
