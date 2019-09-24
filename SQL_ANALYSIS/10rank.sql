SELECT *
FROM 
(
    SELECT A.customer_id,
                 A.customer_name,
                 SUM(C.sales) 전용상품매출,
                 ROW_NUMBER() OVER (PARTITION BY C.item_id ORDER BY SUM(C.sales) DESC) 순위
    FROM customer A, reservation B, order_info C
    WHERE A.customer_id = B.customer_id
    AND B.reserv_no = C.reserv_no
    AND B.cancel = 'N'
    AND C.item_id = 'M0001'
    GROUP BY A.customer_id, C.item_id, A.customer_name
) A
WHERE A.순위 <= 10
ORDER BY A.순위;