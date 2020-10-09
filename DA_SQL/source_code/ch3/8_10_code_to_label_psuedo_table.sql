WITH
mst_devices AS (
			SELECT 1 AS device_id, 'PC' AS device_name
	UNION ALL SELECT 2 AS device_id, 'SP' AS device_name 
	UNION ALL SELECT 3 AS device_id, '애플리케이션' AS device_name
)
SELECT 
	u.user_id
	, d.device_name
FROM 
	MST_USERS AS u
LEFT JOIN 
	mst_devices AS d 
	ON u.register_device = d.device_id
;