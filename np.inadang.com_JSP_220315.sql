
--ȸ�� ���̺� ����
CREATE TABLE T_MEMBER(
    ID VARCHAR2(10) CONSTRAINT PK_MEMBER PRIMARY KEY,
    PWD VARCHAR2(10),
    NAME VARCHAR2(50),
    EMAIL VARCHAR2(50),
    JOINDATE DATE DEFAULT SYSDATE
);

--ȸ�� ���� �߰�
INSERT INTO T_MEMBER
VALUES('hong', '1212', 'ȫ�浿', 'hong@gmail.com', sysdate);

INSERT INTO T_MEMBER
VALUES('lee', '1212', '�̼���', 'lee@test.com', sysdate);

INSERT INTO T_MEMBER
VALUES('kim', '1212', '������', 'kim@jweb.com', sysdate);

COMMIT;

SELECT * FROM T_MEMBER;