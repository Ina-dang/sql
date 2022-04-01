
CREATE TABLE T_MEMBER (
    ID VARCHAR2(100) CONSTRAINT PK_MEMBER PRIMARY KEY,
    PW VARCHAR2(100),
    NAME VARCHAR2(100),
    SI VARCHAR2(100),
    SGG VARCHAR2(100),
    EMD VARCHAR2(100),
    ROADADDR VARCHAR2(500),
    ADDRDETAIL VARCHAR2(500),
    ZIPNO VARCHAR2(10),
    ROADFULLADDR VARCHAR2(500),
    JIBUNADDR VARCHAR2(500),
    EMAIL VARCHAR2(200) CONSTRAINT T_MEMBER_EMAIL_UK UNIQUE, 
    AUTH CHAR(1) DEFAULT '0',
    AUTH_TOKEN VARCHAR2(100),
    JOINDATE DATE DEFAULT SYSDATE
);

--DROP TABLE T_MEMBER;
DESC t_member;

SELECT * FROM t_member;

INSERT INTO T_MEMBER VALUES ('inadang', '1234', '捞唱寸', '力林矫', '力林矫', '力林矫','力林矫','力林矫','力林矫','力林矫','力林矫', 'inadang@gmail.com', '0', NULL, SYSDATE); 
INSERT INTO T_MEMBER VALUES ('javaman', '1234', '捞唱寸', '力林矫', '力林矫', '力林矫','力林矫','力林矫','力林矫','力林矫','力林矫', 'javaman@gmail.com', '0', NULL, SYSDATE); 
INSERT INTO T_MEMBER VALUES ('ina9377', '1234', '捞唱寸', '力林矫', '力林矫', '力林矫','力林矫','力林矫','力林矫','力林矫','力林矫', 'ina9377@gmail.com', '0', NULL, SYSDATE); 

DELETE t_member WHERE JOINDATE IS NULL;
