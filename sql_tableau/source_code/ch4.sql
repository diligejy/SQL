USE EDU 

SELECT * 
	, CASE WHEN ageband BETWEEN 20 AND 30 THEN '2030����'
		   WHEN ageband BETWEEN 40 AND 50 THEN '4050����'
		   END AS ageband_seg
FROM [member]

SELECT * 
	, CASE WHEN ageband BETWEEN 20 AND 30 THEN '2030����'
		   WHEN ageband BETWEEN 40 AND 50 THEN '4050����'
		   ELSE 'OTHER����' END AS ageband_seg
FROM [member]

