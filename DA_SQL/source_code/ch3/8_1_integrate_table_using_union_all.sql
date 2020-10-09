SELECT 'app1' AS app_name, user_id, name, email FROM APP1_MST_USERS
UNION ALL
SELECT 'app2' AS app_name, user_id, name, NULL AS email FROM APP2_MST_USERS;