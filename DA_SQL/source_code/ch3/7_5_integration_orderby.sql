SELECT 
	product_id
	, score
	
	-- 점수 순서로 유일한 순위를 붙임
	, ROW_NUMBER() OVER(ORDER BY score DESC) AS ROW 
	
	-- 순위 상위부터의 누계 점수 계산
	, sum(score)
		over(ORDER BY score DESC ROWS 
				BETWEEN UNBOUNDED PRECEDING AND CURRENT row)
	AS cum_score
	
	-- 현재 행과 앞 뒤의 행이 가진 값을 기반으로 평균 점수 계산
	, AVG(score) 
		over(ORDER BY score DESC
				ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
			AS LOCAL_avg
	
	-- 순위가 높은 상품 ID 추출
	, FIRST_VALUE(product_id)
		over(ORDER BY score DESC
			ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
		AS FIRST_VALUE 
	
	-- 순위가 낮은 상품 ID 추출
	, last_value(product_id)
		over(ORDER BY score DESC
				ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED following)
		AS LAST_VALUE
FROM POPULAR_PRODUCTS 
ORDER BY ROW;