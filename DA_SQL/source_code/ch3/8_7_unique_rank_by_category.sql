WITH 
product_sale_ranking AS (
	SELECT 
		category_name
		, product_id
		, sales
		, row_number() over(PARTITION BY category_name ORDER BY sales desc) AS RANK 
	FROM 
		product_sales
)
, mst_rank AS(
	SELECT DISTINCT(RANK) 
	FROM PRODUCT_SALE_RANKING
)
SELECT * 
FROM mst_rank
ORDER BY RANK asc;