SELECT * FROM tbl_board;
SELECT * FROM tbl_member;
SELECT * FROM tbl_reply;


DELETE tbl_member WHERE id = 'inadang';

--�ϰ� Ŀ��������

--��������, �����Խ���
--�Խ��� �� ���̺���� x >> ��� �Խ����� �ϳ��� ���̺� ����
--ī�װ��� �÷����� ���� (�÷��� : ī�װ�)


--1 : �����Խ��� 2 : ��������
ALTER TABLE TBL_BOARD ADD (CATEGORY NUMBER DEFAULT 1);

SELECT * FROM TBL_BOARD;

--�������߰�
INSERT INTO tbl_board(BNO, TITLE, HITCOUNT, CONTENT, REGDATE, WRITER)
    SELECT SEQ_BOARD.NEXTVAL, TITLE, HITCOUNT, CONTENT, REGDATE, WRITER FROM TBL_BOARD;

--���� ����Ʈ���� �ٲٱ�
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
    WHERE CATEGORY = 1 --ī�װ� ��� ����
    AND ROWNUM <=10 --����¡�ϱ�����
)
WHERE RN > 0;

--������ Ȯ��

--���� ����Ʈ���� �ٲٱ�
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
    WHERE CATEGORY = 1 --ī�װ� ��� ����
    AND ROWNUM <=10 --����¡�ϱ�����
)
WHERE RN > 0;

--�Խñ� �Ѱ���
SELECT COUNT(bno) FROM TBL_BOARD;

SELECT count(*) FROM tbl_board;


CREATE UNIQUE INDEX IDX_BOARD_BNO_CATEGORY ON TBL_BOARD(BNO DESC, CATEGORY);

SELECT COUNT(*) FROM TBL_BOARD WHERE CATEGORY = 1;

INSERT INTO TBL_BOARD (BNO, TITLE, CONTENT, WRITER) VALUES (SEQ_BOARD.NEXTVAL, '����', '����', '�ƹ���');