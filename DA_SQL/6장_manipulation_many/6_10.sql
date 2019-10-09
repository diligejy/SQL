
-- 이차원 테이블에 대해 제곱 평균 제곱근(유클리드 거리)를 구하는 쿼리

SELECT 
	-- sqrt(power(x1 - x2, 2) + power(y1 - y2, 2)) AS dist
	-- PostgreSQL의 경우는 point 자료형과 거리 연산자 <-> 사용하기
	point(x1, y1) <-> point(x2, y2) AS dist
FROM location_2d
;

SELECT * from location_2d;