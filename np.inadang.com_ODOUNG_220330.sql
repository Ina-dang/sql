-- 회원의 주소를 저장할 수 있다 > 한 명의 회원은 하나의 주소를 가진다 (1:1), 총 7개의 추가 필드를 소유한다.
--회원의 이메일을 저장할 수 있다. 유일값  1

--인증 => 회원의 이메일이 본인 소유인 것을 인증한다 

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

--업데이트 코드
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
    SI = '제주시',
    SGG = '제주시',
    EMD = '제주시',
    ROADADDR = '제주시',
    ADDRDETAIL = '제주시',
    ZIPNO = '07730',
    ROADFULLADDR = '제주시',
    JIBUNADDR = '제주시',
    EMAIL = 'howold0917@gmail.com'
WHERE ID = 'inadang';

SELECT * FROM tbl_member;
DELETE tbl_member WHERE ID = 'javaman2';

--탈퇴한 회원 정보변경
UPDATE TBL_BOARD SET
WRITER = NULL
WHERE WRITER = 'merona';

--프로시저 선언
--회원탈퇴기능수행 
-- 프로시저이름 : QUIT_PROC
-- 매개변수 : P_ID / MEMBER.ID 타입

CREATE OR REPLACE PROCEDURE QUIT_PROC(
    P_ID TBL_MEMBER.ID%TYPE
)
IS
BEGIN
--  게시글  
    UPDATE TBL_BOARD SET
    WRITER = NULL
    WHERE WRITER = P_ID;
--  댓글
    UPDATE TBL_REPLY SET
    WRITER = NULL
    WHERE WRITER = P_ID;
--  회원
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

