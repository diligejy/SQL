WITH
mst_devices(device_id, device_name) AS (
	VALUES
	(1, 'PC')
	, (2, 'SP')
	, (3, '애플리케이션')
)
SELECT *
FROM mst_devices;
