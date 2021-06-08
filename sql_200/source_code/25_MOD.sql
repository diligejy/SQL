-- 나머지 = MOD
SELECT MOD(10, 3)
   FROM dual;
   
SELECT empno, MOD(empno, 2)
   FROM emp;
   
-- 사원번호가 짝수인 사원들만
SELECT empno, ename
   FROM emp
   WHERE MOD(empno, 2) = 0;
   
-- 10을 3으로 나눈 몫의 최상단
SELECT FLOOR(10/3)
   FROM dual;