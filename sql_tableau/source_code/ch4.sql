USE EDU 

SELECT * 
	, CASE WHEN ageband BETWEEN 20 AND 30 THEN '2030技措'
		   WHEN ageband BETWEEN 40 AND 50 THEN '4050技措'
		   END AS ageband_seg
FROM [member]

SELECT * 
	, CASE WHEN ageband BETWEEN 20 AND 30 THEN '2030技措'
		   WHEN ageband BETWEEN 40 AND 50 THEN '4050技措'
		   ELSE 'OTHER技措' END AS ageband_seg
FROM [member]

