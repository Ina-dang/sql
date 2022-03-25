CREATE TABLE T_HOME (
    ID VARCHAR2(50) CONSTRAINT PK_HOME PRIMARY KEY,
    PW VARCHAR2(100),
    NAME VARCHAR2(50),
    NICK VARCHAR2(50),
    EMAIL VARCHAR2(100),
    JOINDATE DATE DEFAULT SYSDATE
);

SELECT * FROM T_HOME;

INSERT INTO T_HOME VALUES('hong', '1234', 'ȫ�浿', '����ȫ', 'hong@gmail.com', SYSDATE);
INSERT INTO T_HOME VALUES('lee', '1234', '�̼���', '������', 'lee@test.com', SYSDATE);
INSERT INTO T_HOME VALUES('kim', '1234', '������', '������', 'kim@web.com', SYSDATE);

COMMIT;

