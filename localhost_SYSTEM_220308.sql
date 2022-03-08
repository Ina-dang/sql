SELECT * FROM student; --는 오류
SELECT * FROM STUDENT.student;
-- SYSTEM 관리자 계정에서 했기때문에 가능


CREATE TABLE student.tbl_test (
    NUM NUMBER
);

DROP TABLE student.tbl_test;
DROP TABLE address;

--연락처 정보를 저장하기 위핚 주소록(address)테이블을 생성하여라.

CREATE TABLE address (
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(50),
    addr VARCHAR2(100),
    phone VARCHAR2(30),
    email VARCHAR2(100)
);

DESC address;

--INSERT INTO address (id, name, addr) VALUES (101, '고길동', '영등포');
SELECT * FROM address;

SELECT * FROM TAB;

--서브쿼리를 이용한 테이블 생성
INSERT INTO address
VALUES (1, 'HGDONG', 'SEOUL', '123-4567', 'gdhong@cwunet.ac.kr');

SELECT * FROM address;



--서브쿼리 젃을 이용하여 주소록 테이블의 구조와 데이터를 복사하여 addr_second 테이블을 생성하여라.
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

--addr_second 테이블 이름을 client_address로 변경하여라
RENAME address_second TO client_address;
SELECT * FROM address_second; --table or view does not exist
SELECT * FROM client_address;

DROP TABLE address_third;

