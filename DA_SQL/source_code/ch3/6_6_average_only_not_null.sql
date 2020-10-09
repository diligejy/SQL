SELECT 
	REPLACE(CAST(YEAR AS TEXT), ',', '') AS year
	, 
	(COALESCE(q1, 0) + COALESCE(q2, 0) + COALESCE(q3, 0) + COALESCE(q4, 0)) 
	/ (sign(COALESCE(q1, 0)) + sign(COALESCE(q2, 0)) + sign(COALESCE(q3, 0)) + sign(COALESCE(q4, 0)))
FROM 
	quarterly_sales
ORDER BY 
	YEAR;