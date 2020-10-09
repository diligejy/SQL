SELECT 
	USER_ID
	, product_id
	-- 개별 리뷰 함수
	, score
	-- 전체 평균 리뷰 점수
	, round(avg(score) over(), 2) AS avg_score
	-- 사용자의 평균 리뷰 점수
	, round(avg(score) over(PARTITION BY user_id),2) AS user_avg_score
	-- 개별 리뷰 점수와 사용자 평균 리뷰 점수의 차이
	, round(score - avg(score) over(PARTITION BY USER_id),2) AS user_avg_score_diff
FROM 
	review;