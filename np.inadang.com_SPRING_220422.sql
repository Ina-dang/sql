CREATE TABLE tbl_reply (
    rno NUMBER(10, 0) CONSTRAINT reply_pk PRIMARY KEY,
    bno NUMBER(10, 0) CONSTRAINT reply_board_fk REFERENCES tbl_board(bno),
    reply VARCHAR2(1000) NOT NULL,
    replyer VARCHAR2(50) NOT NULL,
    replyDate DATE DEFAULT SYSDATE,
    updateDate DATE DEFAULT SYSDATE
);

CREATE SEQUENCE SEQ_REPLY;

SELECT MAX(BNO) FROM tbl_board; --84082

SELECT BNO FROM tbl_board WHERE ROWNUM <= 5 ORDER BY BNO DESC;

--����� ���� �� ������ ���� ������ (bno�� ����)
--�񵿱�
SELECT /*+ INDEX(TBL_REPLY REPLY_PK) */ * 
FROM TBL_REPLY 
WHERE BNO = 84082 
AND  RNO > 11
AND ROWNUM <= 10;
--pageNum (rno, amount)�ΰ� �ʿ�