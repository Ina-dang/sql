-- ȸ���� �ּҸ� ������ �� �ִ� > �� ���� ȸ���� �ϳ��� �ּҸ� ������ (1:1), �� 7���� �߰� �ʵ带 �����Ѵ�.
--ȸ���� �̸����� ������ �� �ִ�. ���ϰ�  1

--���� => ȸ���� �̸����� ���� ������ ���� �����Ѵ� 

SELECT * FROM TBL_MEMBER;
UPDATE tbl_member SET AUTH = 0;

COMMIT;

SELECT 'private String ' || lower(column_name) || ';' FROM user_tab_columns WHERE table_name = 'TBL_MEMBER';
--<input type="hidden" name="">

SELECT 
    '<input type="hidden" name="' || 
    lower(column_name) || 
    '" id="' ||
    lower(column_name) ||
    '">'
FROM user_tab_columns  a
WHERE table_name = 'TBL_MEMBER'
ORDER BY column_id;

INSERT INTO tbl_member (
A,
B,
C,
D
)
    VALUES (
    1,
    2,
    3,
    4
    );
    
  
SELECT 
    lower(column_name) || ',' ,
    column_id + 1
FROM user_tab_columns  a
WHERE table_name = 'TBL_MEMBER'
ORDER BY column_id;

SELECT * FROM
    (
    SELECT 'INSERT INTO tbl_member (' AS A, 1 FROM DUAL UNION
    SELECT ') VALUES (' , 100 FROM DUAL UNION
    SELECT ');' , 10000 FROM DUAL UNION
    SELECT * FROM (SELECT 
            lower(column_name) || ',' ,
            column_id + 1
        FROM user_tab_columns  a
        WHERE table_name = 'TBL_MEMBER'
        ORDER BY column_id) UNION 
        SELECT * FROM (SELECT 
            '?,' ,
            column_id + 100
    FROM user_tab_columns  a
    WHERE table_name = 'TBL_MEMBER'
    ORDER BY column_id)
ORDER BY 2);


SELECT 
'V_' || COLUMN_NAME || ' TBL_MEMBER.' || COLUMN_NAME || '%TYPE,' 
FROM user_tab_columns  a
WHERE table_name = 'TBL_MEMBER'
ORDER BY column_id;


CREATE OR REPLACE PROCEDURE PROC_INSERT_MEMBER(
V_ID TBL_MEMBER.ID%TYPE,
V_PW TBL_MEMBER.PW%TYPE,
V_NAME TBL_MEMBER.NAME%TYPE,
V_SI TBL_MEMBER.SI%TYPE,
V_SGG TBL_MEMBER.SGG%TYPE,
V_EMD TBL_MEMBER.EMD%TYPE,
V_ROADADDR TBL_MEMBER.ROADADDR%TYPE,
V_ADDRDETAIL TBL_MEMBER.ADDRDETAIL%TYPE,
V_ZIPNO TBL_MEMBER.ZIPNO%TYPE,
V_ROADFULLADDR TBL_MEMBER.ROADFULLADDR%TYPE,
V_JIBUNADDR TBL_MEMBER.JIBUNADDR%TYPE,
V_EMAIL TBL_MEMBER.EMAIL%TYPE

) IS
BEGIN
    INSERT INTO TBL_MEMBER (ID, PW, NAME, SI, SGG, EMD, ROADADDR, ADDRDETAIL, ZIPNO, ROADFULLADDR, JIBUNADDR, EMAIL) 
    VALUES (V_ID, V_PW, V_NAME, V_SI, V_SGG, V_EMD, V_ROADADDR, V_ADDRDETAIL, V_ZIPNO, V_ROADFULLADDR, V_JIBUNADDR, V_EMAIL);
    COMMIT;
END;
/

SELECT * FROM tbl_member;

--������Ʈ �ڵ�
UPDATE tbl_member SET
    PW = ?,
    NAME = ?,
    SI = ?,
    SGG = ?,
    EMD = ?,
    ROADADDR = ?,
    ADDRDETAIL = ?,
    ZIPNO = ?,
    ROADFULLADDR = ?,
    JIBUNADDR = ?
WHERE ID = ?;

SELECT 'sb.append("' || COLUMN_NAME || ' = ?, \n");"'  FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TBL_MEMBER' ORDER BY COLUMN_ID;

SELECT 'pstmt.setString(idx++, member.get' || INITCAP(COLUMN_NAME) || '());'  FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'TBL_MEMBER' ORDER BY COLUMN_ID;



SELECT * FROM tbl_member;
SELECT * FROM tbl_board order by 1 desc;


UPDATE tbl_member SET
    SI = '���ֽ�',
    SGG = '���ֽ�',
    EMD = '���ֽ�',
    ROADADDR = '���ֽ�',
    ADDRDETAIL = '���ֽ�',
    ZIPNO = '07730',
    ROADFULLADDR = '���ֽ�',
    JIBUNADDR = '���ֽ�',
    EMAIL = 'howold0917@gmail.com'
WHERE ID = 'inadang';

SELECT * FROM tbl_member;
DELETE tbl_member WHERE ID = 'javaman2';

--Ż���� ȸ�� ��������
UPDATE TBL_BOARD SET
WRITER = NULL
WHERE WRITER = 'merona';

--���ν��� ����
--ȸ��Ż���ɼ��� 
-- ���ν����̸� : QUIT_PROC
-- �Ű����� : P_ID / MEMBER.ID Ÿ��

CREATE OR REPLACE PROCEDURE QUIT_PROC(
    P_ID TBL_MEMBER.ID%TYPE
)
IS
BEGIN
--  �Խñ�  
    UPDATE TBL_BOARD SET
    WRITER = NULL
    WHERE WRITER = P_ID;
--  ���
    UPDATE TBL_REPLY SET
    WRITER = NULL
    WHERE WRITER = P_ID;
--  ȸ��
    DELETE TBL_MEMBER WHERE ID = P_ID;
    
    COMMIT;
END;
/

exec quit_proc('amanna');

SELECT * FROM tbl_member;
DELETE FROM TBL_MEMBER WHERE ID = 'odoung';
SAVEPOINT S1;
DELETE FROM TBL_MEMBER WHERE ID = 'javaman';
SAVEPOINT S2;
ROLLBACK TO S1;

ROLLBACK;
COMMIT;

