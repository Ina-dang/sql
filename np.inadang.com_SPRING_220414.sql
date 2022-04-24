CREATE SEQUENCE SEQ_BOARD;
CREATE TABLE TBL_BOARD(
    BNO NUMBER(10, 0) CONSTRAINT BOARD_PK PRIMARY KEY,
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL,
    WRITER VARCHAR2(50) NOT NULL,
    REGDATE DATE DEFAULT SYSDATE,
    UPDATEDATE DATE DEFAULT SYSDATE
);
SELECT COUNT(*) FROM tbl_board ORDER BY bno DESC;
SELECT * FROM tbl_board ORDER BY 1 DESC;
SELECT 
/*+ INDEX_DESC(tbl_board board_pk) */ * 
FROM tbl_board;
SELECT 
/*+ INDEX_DESC() */ * 
FROM tbl_board ORDER BY BNO + 1 DESC;

--페이징
SELECT RN, BNO, TITLE, CONTENT FROM (
    SELECT 
    /*+ INDEX_DESC(tbl_board board_pk) */ 
    ROWNUM RN, BNO, TITLE, CONTENT
    FROM tbl_board
    WHERE ROWNUM <= 3 * 10
) WHERE RN > (3 - 1 ) * 10;

SELECT
/*+ FULL(T) */ T.*, rownum
FROM tbl_board t ORDER BY BNO DESC;

SELECT rownum, bno, title FROM tbl_board;
SELECT rownum, bno, title FROM tbl_board ORDER BY bno;

INSERT INTO tbl_board (bno, title, content, writer)
SELECT seq_board.nextval, title, content, writer FROM tbl_board;

COMMIT;

--더보기
SELECT 
/*+ INDEX(tbl_board board_pk) */ 
ROWNUM RN, BNO, TITLE, CONTENT
FROM tbl_board
WHERE ROWNUM <= 10
AND BNO > 13;

SELECT COUNT(*) FROM tbl_board WHERE BNO > 0;
    
    
    
--페이징
SELECT * FROM (
    SELECT 
        /*+ INDEX_DESC(tbl_board board_pk) */ 
        ROWNUM RN, BNO, TITLE, CONTENT
    FROM 
        tbl_board
    WHERE ROWNUM <= 1 * 10
    AND (
    title= 테스트
    #{title} '테스트'
    ${title} 테스트
        TITLE LIKE '%' || #{title} ||'%'
        OR WRITER LIKE '%12'
        )
) WHERE RN > ( 1 - 1 ) * 10
;


SELECT * FROM TBL_BOARD
WHERE (
    TITLE LIKE '%테스트%' OR
    CONTENT LIKE '%테스트%' OR
    WRITER LIKE '%테스트%')
AND ROWNUM <= 20;