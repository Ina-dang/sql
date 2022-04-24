CREATE TABLE 회원관리 (
    ID VARCHAR2(1000) PRIMARY KEY,
    비밀번호 VARCHAR2(1000),
    회원이름 VARCHAR2(1000),
    전화번호 VARCHAR2(1000)
);

DROP TABLE 게시글관리;
CREATE TABLE 게시글관리 (
    글번호 NUMBER PRIMARY KEY,
    글제목 VARCHAR2(1000),
    글내용 VARCHAR2(4000),
    글작성자 REFERENCES 회원관리(ID),
    글작성일 DATE
);

CREATE TABLE 댓글관리 (
    댓글번호 NUMBER PRIMARY KEY,
    댓글내용 VARCHAR2(4000),
    글작성자 REFERENCES 회원관리(ID),
    글작성일 DATE,
    게시글번호 REFERENCES 게시글관리(글번호)
);

CREATE UNIQUE INDEX 회원_ID_이름_IDX ON 회원관리(ID, 회원이름);

SELECT * FROM 회원관리 WHERE ID = 'A' AND 회원이름 = 'A';

CREATE OR REPLACE PROCEDURE 회원정보확인_PROC(P_ID VARCHAR2) IS
V_비밀번호 VARCHAR2(1000);
V_회원이름 VARCHAR2(1000);
V_전화번호 VARCHAR2(1000);
BEGIN
    SELECT 비밀번호, 회원이름, 전화번호 
    INTO V_비밀번호, V_회원이름, V_전화번호
    FROM 회원관리
    WHERE ID = P_ID;
    DBMS_OUTPUT.PUT_LINE(P_ID);
    DBMS_OUTPUT.PUT_LINE('=============');
    DBMS_OUTPUT.PUT_LINE(V_비밀번호);
    DBMS_OUTPUT.PUT_LINE(V_회원이름);
    DBMS_OUTPUT.PUT_LINE(V_전화번호);
    COMMIT;
END;
/

EXEC 회원정보확인_PROC('ID1');

SET SERVEROUTPUT ON;
INSERT INTO 회원관리 VALUES ('ID1', '1234', '고길동', '02333222');

DROP PROCEDURE 회원등록;
CREATE OR REPLACE PROCEDURE 회원등록_PROC(P_ID VARCHAR2, P_비밀번호 VARCHAR2, P_회원이름 VARCHAR2, P_전화번호 VARCHAR2) IS
BEGIN
    INSERT INTO 회원관리 
    VALUES (P_ID , P_비밀번호 , P_회원이름 , P_전화번호 );
    COMMIT;
END;
/

EXEC 회원등록_PROC('ID2', '1234', '고길동쓰', '023332222');


CREATE OR REPLACE PROCEDURE 회원수정_PROC(P_ID VARCHAR2, P_비밀번호 VARCHAR2, P_회원이름 VARCHAR2, P_전화번호 VARCHAR2) IS
BEGIN
    UPDATE 회원관리 SET
    비밀번호 = P_비밀번호,
    회원이름 = P_회원이름,
    전화번호 = P_전화번호
    WHERE ID = P_ID;
    COMMIT;
END;
/
EXEC 회원수정_PROC('ID2', '1234', '고길동쓰', '023332222');

CREATE OR REPLACE PROCEDURE 회원삭제_PROC(P_ID VARCHAR2) IS
BEGIN
    UPDATE 게시글관리 SET
    글작성자 = NULL
    WHERE 글작성자 = P_ID;
    
    UPDATE 댓글관리 SET
    글작성자 = NULL
    WHERE 글작성자 = P_ID;
    
    DELETE 회원관리 WHERE ID = P_ID;
    COMMIT;
END;
/

EXEC 회원삭제_PROC('ID2');

SELECT * FROM 회원관리;


----------------------------------------------------------------함수만들기
CREATE OR REPLACE FUNCTION 회원정보_FN(P_ID VARCHAR2) RETURN VARCHAR2 IS
V_회원이름 VARCHAR2(1000);
BEGIN
    SELECT 회원이름
    INTO V_회원이름
    FROM 회원관리
    WHERE ID = P_ID;
    RETURN P_ID || ' ' || V_회원이름;
    COMMIT;
END;
/

SELECT 회원정보_FN('ID1') FROM DUAL;
