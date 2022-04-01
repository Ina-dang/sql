select * from tbl_attach;

select * from tbl_board;

delete tbl_board where bno = 363;

SELECT
    (SELECT 
        COUNT(*) 
    FROM 
        tbl_reply R
    WHERE
        R.BNO = B.BNO) REPLYCNT,
    B.*
FROM 
    TBL_BOARD B
ORDER BY 2 DESC;

