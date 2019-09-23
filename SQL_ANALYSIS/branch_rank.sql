SELECT *
    FROM 
    (
        SELECT SUBSTR(A.reserv_date, 1, 6) �����,
                     A.branch  ����,
                     SUM(B.sales) �����ǰ����,
                     ROW_NUMBER() OVER(PARTITION BY SUBSTR(A.reserv_date, 1, 6)
        ORDER BY SUM(B.sales) DESC) ��������,
        DECODE(A.branch, '����', 'A', '����', 'A', '������', 'A', 'B') �������
        FROM reservation A, order_info B
        WHERE A.reserv_no = B.reserv_no
        AND A.cancel = 'N'
        AND B.item_id = 'M0001'
        GROUP BY SUBSTR(A.reserv_date, 1, 6), A.branch
        ORDER BY SUBSTR(A.reserv_date, 1, 6)
) A
WHERE A.�������� <= 3;