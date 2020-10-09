SELECT 
	cast('127.0.0.1' AS inet) < cast('127.0.0.2' AS inet) AS lt
	,cast('127.0.0.1' AS inet) > cast('192.168.0.1' AS inet) AS gt;