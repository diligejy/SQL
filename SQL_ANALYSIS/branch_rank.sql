SELECT *
    FROM 
    (
        SELECT SUBSTR(A.reserv_date, 1, 6) 매출월,
                     A.branch  지점,
                     SUM(B.sales) 전용상품매출,
                     ROW_NUMBER() OVER(PARTITION BY SUBSTR(A.reserv_date, 1, 6)
        ORDER BY SUM(B.sales) DESC) 지점순위,
        DECODE(A.branch, '강남', 'A', '종로', 'A', '영등포', 'A', 'B') 지점등급
        FROM reservation A, order_info B
        WHERE A.reserv_no = B.reserv_no
        AND A.cancel = 'N'
        AND B.item_id = 'M0001'
        GROUP BY SUBSTR(A.reserv_date, 1, 6), A.branch
        ORDER BY SUBSTR(A.reserv_date, 1, 6)
) A
WHERE A.지점순위 <= 3;