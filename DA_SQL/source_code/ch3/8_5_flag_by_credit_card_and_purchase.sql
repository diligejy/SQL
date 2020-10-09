SELECT 
	m.user_id
	, m.card_number
	, COUNT(p.user_id) AS purchase_count
	-- 신용 카드 번호를 등록한 경우 1, 등록하지 않은 경우 0으로 표현
	, CASE WHEN m.card_number IS NOT NULL THEN 1 ELSE 0 END AS has_card
	-- 구매 이력이 있는 경우  1, 없는 경우 0으로 표현
	, SIGN(count(p.user_id)) AS has_purchased
FROM 
	MST_USERS_WITH_CARD_NUMBER AS m 
LEFT JOIN
	PURCHASE_LOG AS p
	ON m.user_id = p.user_id
GROUP by m.user_id, m.card_number;