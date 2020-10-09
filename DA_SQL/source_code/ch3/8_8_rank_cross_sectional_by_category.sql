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
SELECT 
	m.RANK
	, r1.product_id AS dvd
	, r1.sales AS dvd_sales
	, r2.product_id AS cd
	, r2.sales AS cd_sales
	, r3.product_id AS book
	, r3.sales AS book_sales
FROM 
	mst_rank AS m	
LEFT JOIN 
	product_sale_ranking AS r1
	ON m.RANK = r1.RANK 
	AND r1.category_name = 'dvd'
LEFT JOIN 
	product_sale_ranking AS r2
	ON m.RANK = r2.RANK
	AND r2.category_name = 'cd'
LEFT JOIN 
	product_sale_ranking AS r3
	ON m.RANK = r3.RANK
	AND r3.category_name = 'book'
ORDER BY m.RANK;