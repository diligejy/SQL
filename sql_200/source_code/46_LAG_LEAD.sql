SELECT empno
	 , ename
	 , sal
	 , LAG(sal, 1) OVER (ORDER BY sal asc) "전 행"
	 , LEAD(sal, 1) OVER (ORDER BY sal ASC) "다음 행"
FROM EMP
WHERE job IN ('ANALYST', 'MANAGER');
		
-- 직업이 ANALYST OR MANAGER인 사원들의 사원 번호, 이름, 입사일
-- 바로 전에 입사한 사원의 입사일, 바로 다음에 입사한 사원의 입사일
SELECT empno
	  , ename
	  , hiredate
	  , LAG(hiredate, 1) OVER (ORDER BY hiredate asc) "전 행"
	  , LEAD(hiredate, 1) OVER (ORDER BY hiredate asc) "다음 행"
FROM EMP 
WHERE job IN ('ANALYST', 'MANAGER')

-- 부서번호, 사원번호, 이름, 입사일, 바로 전에 입사한 사원의 입사일
-- 바로 다음에 입사한 사원의 입사일 
-- 부서 번호 별로 구분해서 출력
SELECT deptno
	 , empno
	 , ename
	 , hiredate
	 , LAG(hiredate, 1) OVER (PARTITION BY deptno ORDER BY hiredate asc) "전 행"
	 , LEAD(hiredate, 1) OVER (PARTITION BY deptno ORDER BY hiredate asc) "다음 행"
FROM EMP 