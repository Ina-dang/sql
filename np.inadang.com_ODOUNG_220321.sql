SELECT * FROM tbl_board;
SELECT * FROM tbl_member;
SELECT * FROM tbl_reply;


DELETE tbl_member WHERE id = 'inadang';

--하고 커밋해줬음

--공지사항, 자유게시판
--게시판 별 테이블관리 x >> 모든 게시판이 하나의 테이블 공유
--카테고리를 컬럼으로 관리 (컬럼명 : 카테고리)


--1 : 자유게시판 2 : 공지사항
ALTER TABLE TBL_BOARD ADD (CATEGORY NUMBER DEFAULT 1);

SELECT * FROM TBL_BOARD;

--페이지추가
INSERT INTO tbl_board(BNO, TITLE, HITCOUNT, CONTENT, REGDATE, WRITER)
    SELECT SEQ_BOARD.NEXTVAL, TITLE, HITCOUNT, CONTENT, REGDATE, WRITER FROM TBL_BOARD;

--기존 셀렉트쿼리 바꾸기
SELECT *
FROM (
    SELECT
        /*+ INDEX_DESC(TBL_BOARD PK_BOARD)*/
        BNO,
        TITLE,
        HITCOUNT, 
        CASE
            WHEN SYSDATE - REGDATE > 1 THEN TO_CHAR(REGDATE, 'YY/MM/DD')
            ELSE TO_CHAR(REGDATE, 'HH24:MI:SS')
        END REGDATE,
        WRITER, 
        ROWNUM RN
    FROM TBL_BOARD
    WHERE CATEGORY = 1 --카테고리 어떤거 쓸지
    AND ROWNUM <=10 --페이징하기위해
)
WHERE RN > 0;

--페이지 확인

--기존 셀렉트쿼리 바꾸기
SELECT *
FROM (
    SELECT
        /*+ INDEX_DESC(TBL_BOARD PK_BOARD)*/
        BNO,
        TITLE,
        HITCOUNT, 
        CASE
            WHEN SYSDATE - REGDATE > 1 THEN TO_CHAR(REGDATE, 'YY/MM/DD')
            ELSE TO_CHAR(REGDATE, 'HH24:MI:SS')
        END REGDATE,
        WRITER, 
        ROWNUM RN,
        (SELECT COUNT(bno) FROM TBL_BOARD) CNT
    FROM TBL_BOARD
    WHERE CATEGORY = 1 --카테고리 어떤거 쓸지
    AND ROWNUM <=10 --페이징하기위해
)
WHERE RN > 0;

--게시글 총개수
SELECT COUNT(bno) FROM TBL_BOARD;

SELECT count(*) FROM tbl_board;


CREATE UNIQUE INDEX IDX_BOARD_BNO_CATEGORY ON TBL_BOARD(BNO DESC, CATEGORY);

SELECT COUNT(*) FROM TBL_BOARD WHERE CATEGORY = 1;

INSERT INTO TBL_BOARD (BNO, TITLE, CONTENT, WRITER) VALUES (SEQ_BOARD.NEXTVAL, '제목', '내용', '아무개');