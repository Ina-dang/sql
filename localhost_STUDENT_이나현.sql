
CREATE TABLE 회원관리 (
    ID VARCHAR2(1000) PRIMARY KEY,
    비밀번호 VARCHAR2(1000),
    회원이름 VARCHAR2(1000),
    전화번호 VARCHAR2(1000)
);

DROP TABLE 회원관리;

CREATE TABLE 게시글관리 (
    글번호 NUMBER PRIMARY KEY,
    글제목 VARCHAR2(1000),
    글내용 VARCHAR2(4000),
    글작성자 VARCHAR2(1000),
    글작성일 DATE
);

CREATE TABLE 댓글관리 (
    댓글번호 NUMBER PRIMARY KEY,
    댓글내용 VARCHAR2(4000),
    댓글작성자 VARCHAR2(1000),
    댓글작성일 DATE
);
/

INSERT INTO 회원관리 VALUES ('ID1', '1234', '고길동', '023332222');

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE 회원정보확인_PROC(p_id VARCHAR2) IS
    V_PW VARCHAR2(1000);
    V_NAME VARCHAR2(1000);
    V_NUM VARCHAR2(1000);
bEGIN
    SELECT 비밀번호, 회원이름, 전화번호 INTO V_PW, V_NAME, V_NUM
    FROM 회원관리 WHERE ID = P_ID;
    
    dbms_output.put_line(p_id);
    DBMS_OUTPUT.PUT_LINE('-------------');
    dbms_output.put_line(V_PW);
    dbms_output.put_line(V_NAME);
    dbms_output.put_line(V_NUM);
END;
/

CREATE OR REPLACE PROCEDURE 회원등록_PROC IS
P_ID 회원관리.ID%TYPE;
P_비밀번호 회원관리.비밀번호%TYPE;
P_회원이름 회원관리.회원이름%TYPE;
P_전화번호 회원관리.전화번호%TYPE;
BEGIN
--    INSERT id, 비밀번호, 회원이름, 전화번호
--    INTO p_id, p_비밀번호, p_회원이름, p_전화번호
    
    COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE 회원수정_PROC IS
P_ID 회원관리.ID%TYPE;
P_비밀번호 회원관리.비밀번호%TYPE;
P_회원이름 회원관리.회원이름%TYPE;
P_전화번호 회원관리.전화번호%TYPE;
BEGIN
--    DBMS_OUTPUT.PUT_LINE();
--    UPDATE
    COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE 회원삭제_PROC IS
P_ID 회원관리.ID%TYPE;
P_비밀번호 회원관리.비밀번호%TYPE;
P_회원이름 회원관리.회원이름%TYPE;
P_전화번호 회원관리.전화번호%TYPE;
BEGIN
--    DELETE FROM 회원관리 WHERE ;
    COMMIT;    
END;
/


CREATE OR REPLACE FUNCTION 회원정보_FN IS 
 P_ID := VARCHAR2(1000);
BEGIN
    IF
        P_ID = '홍길동';
        dbms_output.put_line('ID ' || P_ID);
    END IF;
END;
/
