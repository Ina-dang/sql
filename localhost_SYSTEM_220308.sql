SELECT * FROM student; --�� ����
SELECT * FROM STUDENT.student;
-- SYSTEM ������ �������� �߱⶧���� ����


CREATE TABLE student.tbl_test (
    NUM NUMBER
);

DROP TABLE student.tbl_test;
DROP TABLE address;

--����ó ������ �����ϱ� ���� �ּҷ�(address)���̺��� �����Ͽ���.

CREATE TABLE address (
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(50),
    addr VARCHAR2(100),
    phone VARCHAR2(30),
    email VARCHAR2(100)
);

DESC address;

--INSERT INTO address (id, name, addr) VALUES (101, '��浿', '������');
SELECT * FROM address;

SELECT * FROM TAB;

--���������� �̿��� ���̺� ����
INSERT INTO address
VALUES (1, 'HGDONG', 'SEOUL', '123-4567', 'gdhong@cwunet.ac.kr');

SELECT * FROM address;



--�������� ���� �̿��Ͽ� �ּҷ� ���̺��� ������ �����͸� �����Ͽ� addr_second ���̺��� �����Ͽ���.
CREATE TABLE address_second AS
SELECT * FROM ADDRESS;

DROP TABLE address_second;
SELECT * FROM address;
SELECT * FROM address_second;

CREATE TABLE address_second (ID, NAME, ADDR, PHONE, E_MAIL) AS
SELECT * FROM ADDRESS;

DROP TABLE address_third;
CREATE TABLE address_third AS
SELECT ID col1, NAME col2, ADDR col3, PHONE col4, EMAIL col5 FROM ADDRESS WHERE 1=0;

SELECT * FROM address_third;

--addr_second ���̺� �̸��� client_address�� �����Ͽ���
RENAME address_second TO client_address;
SELECT * FROM address_second; --table or view does not exist
SELECT * FROM client_address;

DROP TABLE address_third;

