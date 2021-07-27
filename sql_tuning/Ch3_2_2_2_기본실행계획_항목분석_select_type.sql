
-- SELECT_TYPE 
-- SELECT문의 유형을 출력

-- 1. Simple : UNION이나 내부 쿼리가 없는 SELECT문
EXPLAIN
SELECT * 
  FROM 사원 
 WHERE 사원번호 = 100000;

EXPLAIN
SELECT 사원.사원번호
	 , 사원.이름 
	 , 사원.성 
	 , 급여.연봉 
  FROM 사원
  	 , (SELECT 사원번호, 연봉
  	      FROM 급여
  	     WHERE 연봉 > 80000) AS 급여
 WHERE 사원.사원번호 = 급여.사원번호 
   AND 사원.사원번호 BETWEEN 10001 AND 10010;
  
-- 2. Primary : 서브쿼리가 포함된 SQL문이 있을 때 첫 번째 SELECT문에 해당하는 구문 
EXPLAIN
SELECT 사원.사원번호
	 , 사원.이름
  	 , 사원.성 
  	 , (SELECT MAX(부서번호)
  	 	  FROM 부서사원_매핑 AS 매핑
  	 	 WHERE 매핑.사원번호 = 사원.사원번호) 카운트
  FROM 사원
 WHERE 사원.사원번호 = 100001;

EXPLAIN
SELECT 사원1.사원번호
	 , 사원1.이름
	 , 사원1.성
  FROM 사원 AS 사원1
 WHERE 사원1.사원번호 = 100001 
UNION ALL 
SELECT 사원2.사원번호
	 , 사원2.이름
	 , 사원2.성
  FROM 사원 AS 사원2
 WHERE 사원2.사원번호 = 100002;

-- 3. SUBQUERY
-- 독립적으로 수행되는 서브쿼리를 의미
EXPLAIN
SELECT (SELECT COUNT(*)
		  FROM 부서사원_매핑 AS 매핑
		 ) AS 카운트,
		(SELECT MAX(연봉)
		   FROM 급여
		) AS 급여;
		
-- 4. DERIVED
-- FROM 절에 작성된 서브쿼리 (FROM 절의 인라인 뷰)
EXPLAIN
SELECT 사원.사원번호 
	 , 급여.연봉 
  FROM 사원
  	 , (SELECT 사원번호
  	 		 , MAX(연봉) AS 연봉
  	 	  FROM 급여
  	 	 WHERE 사원번호 BETWEEN 10001 AND 20000) AS 급여
 WHERE 사원.사원번호 = 급여.사원번호;
 
-- 5. UNION
-- UNION 및 UNION ALL 구문으로 합쳐진 SELECT 문에서 첫 번째 SELECT 구문을 제외한 이후의 SELECT 구문
EXPLAIN
SELECT 'M' AS 성별
	 , MAX(입사일자) AS 입사일자
  FROM 사원 AS 사원1
 WHERE 성별 = 'M'
 UNION ALL
SELECT 'F' AS 성별 
	 , MIN(입사일자) AS 입사일자
  FROM 사원 AS 사원2
 WHERE 성별 = 'F';
 
-- 6. UNION RESULT
-- UNION ALL이 아닌 UNION으로 SELECT절을 결합했을 때 출력
-- UNION은 출력 결과에 중복이 없는 유일한(Uniqueness) 속성을 가지므로 
-- 각 SELECT 절에서 데이터를 가져와 정렬하여 중복 체크하는 과정을 거침
-- UNION RESULT는 별도의 메모리 또는 디스크에 임시 테이블을 만들어 중복을 제거하겠다는 의미
EXPLAIN
SELECT 사원_통합.*
  FROM (
  		SELECT MAX(입사일자) AS 입사일자
  		  FROM 사원 AS 사원1
  		 WHERE 성별 = 'M'
  		 UNION 
  		SELECT MIN(입사일자) AS 입사일자
  		  FROM 사원 AS 사원2
  		 WHERE 성별 = 'M'
  ) AS 사원_통합;
  
 -- 7. DEPENDENT SUBQUERY
 -- UNION 또는 UNION ALL을 사용하는 서브쿼리가 메인 테이블의 영향을 받는 경우
 -- UNION으로 연결되는 첫 번째 단위 쿼리가 독립적으로 수행하지 못하고 메인 테이블로부터 값을 하나씩 공급받는 구조
 EXPLAIN
 SELECT 관리자.부서번호
 	 , ( SELECT 사원1.이름
 	 	   FROM 사원 AS 사원1
 	 	  WHERE 성별 = 'F'
 	 	    AND 사원1.사원번호 = 관리자.사원번호
 	 	  UNION ALL 	 	  
 	 	 SELECT 사원2.이름
 	 	   FROM 사원 AS 사원2
 	 	  WHERE 성별 = 'M'
 	 	    AND 사원2.사원번호 = 관리자.사원번호
 	 	) AS 이름
 FROM 부서관리자 AS 관리자;
 
-- 8. DEPENDENT UNION
-- UNION 또는 UNION ALL 을 사용하는 서브쿼리가 메인 테이블의 영향을 받는 경우
-- UNION으로 연결된 단위 쿼리 중 첫 번째 단위 쿼리를 제외하고 두 번째 단위쿼리에 해당하는 경우
EXPLAIN
SELECT 관리자.부서번호
	 , (SELECT 사원1.이름
	 	  FROM 사원 AS 사원1
	 	 WHERE 성별 = 'F'
	 	   AND 사원1.사원번호 = 관리자.사원번호
	 	 UNION ALL 
	 	SELECT 사원2.이름
	 	  FROM 사원 AS 사원2
	 	 WHERE 성별 = 'M'
	 	   AND 사원2.사원번호 = 관리자.사원번호) AS 이름
FROM 부서관리자 AS 관리자;

-- 9. UNCACHEABLE SUBQUERY
-- 메모리에 상주하여 재활용되어야 할 서브쿼리가 재사용되지 못할 때 출력되는 유형
-- 1) 해당 서브쿼리 안에 사용자 정의함수나 사용자 변수가 포함
-- 2) RAND(), UUID() 함수 등을 사용하여 매번 조회시마다 결과가 달라지는 경우
EXPLAIN 
SELECT * 
FROM 사원
 WHERE 사원번호 = (SELECT ROUND(RAND() * 1000000));
 
-- 10. MATERIALIZED
-- IN 절 구문에 연결된 서브쿼리가 임시 테이블을 생성한 뒤, 
-- 조인이나 가공작업을 수행할 때 출력되는 유형
EXPLAIN
SELECT * 
  FROM 사원
 WHERE 사원번호 IN (SELECT 사원번호 FROM 급여 WHERE 시작일자 > '2020-01-01');