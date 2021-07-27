USE TUNING;
SHOW TABLES;

-- id : SQL문이 수행되는 차례를 ID로 표기한 것. 
-- 숫자가 작을수록 먼저 수행된 것. 값이 같다면 조인되었다고 해석
EXPLAIN
SELECT 사원.사원번호
	 , 사원.이름
	 , 사원.성
	 , 급여.연봉  
	 , (SELECT MAX(부서번호)
	 	  FROM 부서사원_매핑 AS 매핑
	 	 WHERE 매핑.사원번호 = 사원.사원번호) 카운트
FROM 사원, 급여
WHERE 사원.사원번호 = 10001 AND 사원.사원번호 = 급여.사원번호;

-- 