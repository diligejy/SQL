SELECT 
	cast('127.0.0.1' AS inet) << cast('127.0.0.0/8' AS inet) AS is_contained;