SELECT *
FROM (
            SELECT A.고객아이디,
                          A. 고객이름,
                          D.product_name 상품명,
                          SUM(C.sales) 상품매출,
                          RANK() OVER(PARTITION BY A.고객아이디 ORDER BY SUM(C.sales) DESC) 선호도순위
            FROM 
            (
                SELECT A.customer_id 고객아이디,
                             A.customer_name 고객이름,
                             SUM(C.sales) 전용상품매출
                FROM customer A, reservation B, order_info C
                WHERE A.customer_id = B.customer_id
                AND B.reserv_no = C.reserv_no
                AND B.cancel = 'N'
                AND C.item_id = 'M0001'
                GROUP BY A.customer_id, A.customer_name
                HAVING SUM(C.sales) >= 216000
            ) A, reservation B, order_info C, item D
            WHERE A.고객아이디 = B.customer_id
            AND B.reserv_no = C.reserv_no
            AND C.item_id = D.item_id
            AND D.item_id <> 'M0001'
            AND B.cancel = 'N'
            GROUP BY A.고객아이디, A.고객이름, D.product_name
) A
WHERE A.선호도순위 = 1;