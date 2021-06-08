-- 부서번호 10이면 300, 20이면 400 
SELECT ename, deptno, DECODE(deptno, 10, 300, 20, 400, 0) as 보너스
   FROM emp;
   
SELECT empno, mod(empno, 2), DECODE(mod(empno, 2), 0, '짝수', 1, '홀수') as 보너스
   FROM emp;
   
SELECT ename, job, DECODE(job, 'SALESMAN', 5000, 2000) as 보너스
   FROM emp;