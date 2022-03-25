
--회원 테이블 생성
CREATE TABLE T_MEMBER(
    ID VARCHAR2(10) CONSTRAINT PK_MEMBER PRIMARY KEY,
    PWD VARCHAR2(10),
    NAME VARCHAR2(50),
    EMAIL VARCHAR2(50),
    JOINDATE DATE DEFAULT SYSDATE
);

--회원 정보 추가
INSERT INTO T_MEMBER
VALUES('hong', '1212', '홍길동', 'hong@gmail.com', sysdate);

INSERT INTO T_MEMBER
VALUES('lee', '1212', '이순신', 'lee@test.com', sysdate);

INSERT INTO T_MEMBER
VALUES('kim', '1212', '김유신', 'kim@jweb.com', sysdate);

COMMIT;

SELECT * FROM T_MEMBER;