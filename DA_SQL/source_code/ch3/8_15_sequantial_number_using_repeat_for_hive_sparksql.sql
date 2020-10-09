SELECT 
	row_number() over(ORDER BY x) AS idx
FROM 
	-- repeat 함수와 split함수를 조합해서 임의의 길이를 가진 배열을 생성하고
	-- explode로 전개하기
	(SELECT explode(split(repeat('x', 5, -1), 'x')) AS x) AS t
;