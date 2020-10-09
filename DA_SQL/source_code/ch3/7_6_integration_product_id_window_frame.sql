SELECT 
	product_id
	
	-- 점수 순서로 유일한 순위를 붙임
	, ROW_NUMBER() OVER(ORDER BY score desc) AS ROW
	
	-- 가장 앞 순위부터 가장 뒷 순위까지의 범위를 대상으로 상품 ID집약
	-- PostgreSQL의 경우 array_agg, Hive, SparkSQL의 경우 collect_list 사용
	, array_agg(product_id)
	-- , collect_list(product_id)
	over(ORDER BY score DESC 
			ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED following)
	AS whole_agg
	
	-- 가장 앞 순위부터 현재 순위까지의 범위를 대상으로 상품 ID 집약
	-- PostgreSQL의 경우 array_agg, Hive, SparkSQL의 경우 COLLECT_LIST 사용
	, array_agg(product_id)
	-- , collect_list(product_id)
	over(ORDER BY score DESC 
			ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT row)
	AS cum_agg
	
	-- 순위 하나 앞과 하나 뒤까지의 범위를 대상으로 상품 ID 집약하기
	-- PostgreSQL의 경우 array_agg, hIVE, SparkSQL의 경우 collect_list 사용
	, array_agg(product_id)
	-- , collect_list(product_id)
	over(ORDER BY score DESC 
			ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS local_agg

FROM POPULAR_PRODUCTS 
WHERE category = 'action'
ORDER BY ROW;
	
		