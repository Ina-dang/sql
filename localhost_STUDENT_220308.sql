select * from student;

-- DML시작
/*
오라클 디벨로퍼
트랜잭션 시작상태 이기 때문에 내가 커밋전까지는 롤백가능

단일행입력, INTO절에 
실제값들은 ''
*/

--학생테이블에 홍길동의 데이터 입력
desc student;
-- 1:1데이터 입력해줘야함 408페이지

/* NULL
데이터 입력시점 해당 컬럼값 모르거나 미확정

*/

--INSERT 명령묷에서 묵시적인 방법을 이용하여 부서 테이블의 부서번호와 부서 이름을 입력하고 나머지 칼럼은 NULL을 입력하여라.
INSERT INTO department(deptno, dname)
VALUES (900, '생명공학부');

INSERT INTO department --빈문자열도 널값인식
VALUES (301, '환경보건학과', '', NULL);

SELECT * FROM department ;

--교수 테이블에서 입사일을 2006년 1월1일로 입력하여라.
INSERT INTO professor(profno, name, position, hiredate, deptno)
VALUES (9920, '최윤식', '조교수', TO_DATE('2006/01/01', 'YYYY/MM/DD'), 102);

SELECT * FROM professor;

--? 교수 테이블에서 새로욲 행을 입력핛 때 입사일을 혂재 날짜로 입력하여라
INSERT INTO professor
VALUES (9910, '백미선', 'white', '전임강사', 200, SYSDATE, 10, 101);

--게시판 테이블
CREATE TABLE TBL_BOARD (
    BNO NUMBER,
    TITLE VARCHAR2(1000),
    CONTENT CLOB,
    HITCOOUNT NUMBER DEFAULT 0, --디폴트해두면 널대신 0이들어감
    REGDATE DATE DEFAULT SYSDATE,
    WRITER VARCHAR2(200)
);

CREATE SEQUENCE seq_board;

DROP TABLE TBL_BOARD; --테이블삭ㅈ제
DROP SEQUENCE SEQ_BOARD; 

SELECT * FROM tbl_board;
TRUNCATE TABLE TBL_BOARD; --테이블자르기

INSERT INTO tbl_board (BNO, TITLE, CONTENT, WRITER) VALUES (SEQ_BOARD.NEXTVAL, '제목1', '내용1', 'javaman');
INSERT INTO tbl_board (BNO, TITLE, CONTENT, WRITER) VALUES (SEQ_BOARD.NEXTVAL, '제목2', '내용2', 'babamba');
INSERT INTO tbl_board (BNO, TITLE, CONTENT, WRITER) VALUES (SEQ_BOARD.NEXTVAL, '제목3', '내용3', 'amanna');
INSERT INTO tbl_board (BNO, TITLE, CONTENT, WRITER) VALUES (SEQ_BOARD.NEXTVAL, '제목4', '내용4', 'merona');
INSERT INTO tbl_board (BNO, TITLE, CONTENT, WRITER) VALUES (SEQ_BOARD.NEXTVAL, '제목5', '내용5', 'vivivic');


INSERT INTO tbl_board
SELECT * FROM tbl_board;


INSERT INTO 
    tbl_board(BNO, TITLE, CONTENT, WRITER)
SELECT 
    SEQ_BOARD.NEXTVAL, TITLE, CONTENT, WRITER
FROM 
    tbl_board;
    
    
SELECT * FROM tbl_board ORDER BY 1 DESC;

--페이징 처리 한페이지에 10개씩
SELECT 
    A.*, ROWNUM RN
FROM (
    SELECT * FROM tbl_board ORDER BY 1 DESC
) A
WHERE ROWNUM <=10;


--2페이지
SELECT 
    * 
FROM (
    SELECT 
        A.*, ROWNUM RN
    FROM (
        SELECT * FROM tbl_board ORDER BY 1 DESC
    ) A
    WHERE ROWNUM <=20
)
WHERE RN > 10 ;


--다중 행 입력을 위핚 height_info, weight_info 예제 테이블 생성
CREATE TABLE height_info(
    studno NUMBER,
    name VARCHAR2(10),
    height NUMBER
);

SELECT * FROM height_info;


CREATE TABLE weight_info(
    studno NUMBER,
    name VARCHAR2(10),
    weight NUMBER
);

SELECT * FROM weight_info;

--학생 테이블에서 2학년 이상의 학생을 검색하여 height_info 테이블에는 학번, 이름, 키, weight_info 테이블에는 학번, 이름, 몸무게를 각각 입력하여라.
--이거하기위해 2학년 정보 필요
SELECT * FROM student WHERE grade = '2'; --컬럼이름에 맞춰 각각의 테이블이 들어갈 것
-- ALL 쓰면 INTO 위치에 테이블명
INSERT ALL 
INTO height_info VALUES (studno, name, height)
INTO weight_info VALUES (studno, name, weight)
SELECT * FROM student WHERE grade = '2'; 

SELECT * FROM height_info;
SELECT * FROM weight_info;

TRUNCATE TABLE height_info; --테이블 날림
TRUNCATE TABLE weight_info; --테이블 날림

/*
학생 테이블에서 2학년 이상의 학생을 검색하여 
height_info 테이블에는 키가 170보다 큰 학생의 학번, 이름, 키를 입력하고
weight_info 테이블에는 몸무게가 70보다 큰 학생의 학번, 이름,몸무게를 각각 입력하여라.
단, 키가 170보다 작고, 몸무게가 70보다 큰 학생은 weight_info 테이블맊 입력핚다.
*/

INSERT ALL 
WHEN height > 170 THEN 
INTO height_info VALUES (studno, name, height)
WHEN weight > 70 THEN
INTO weight_info VALUES (studno, name, weight)
SELECT * FROM student WHERE grade >= '2'; 

SELECT * FROM height_info;
SELECT * FROM weight_info;

--INSERT ALL 대신 FIRST 사용해보기
INSERT FIRST 
WHEN height > 170 THEN 
INTO height_info VALUES (studno, name, height)
WHEN weight > 70 THEN
INTO weight_info VALUES (studno, name, weight)
SELECT * FROM student WHERE grade >= '2'; 

SELECT * FROM height_info;
SELECT * FROM weight_info;


--? PIVOTING INSERT 를 실습하기 위핚 예제 테이블

CREATE TABLE sales (
    sales_no NUMBER, -- pk
    week_no NUMBER,
    sales_mon NUMBER,
    sales_tue NUMBER,
    sales_wed NUMBER,
    sales_thu NUMBER,
    sales_fri NUMBER
);

TRUNCATE TABLE sales;

INSERT INTO sales VALUES (1101, 4, 100, 150, 80, 60, 120);
INSERT INTO sales VALUES (1102, 5, 300, 300, 230, 120, 150);

SELECT * FROM sales;
SELECT * FROM sales_data;

CREATE TABLE sales_data (
    sales_no NUMBER,
    week_no NUMBER,
    day_no NUMBER,
    sales NUMBER    
);

TRUNCATE TABLE sales_data;

INSERT ALL
INTO sales_data VALUES (sales_no, week_no, 1, sales_mon)
INTO sales_data VALUES (sales_no, week_no, 2, sales_tue)
INTO sales_data VALUES (sales_no, week_no, 3, sales_wed)
INTO sales_data VALUES (sales_no, week_no, 4, sales_thu)
INTO sales_data VALUES (sales_no, week_no, 5, sales_fri)
SELECT * FROM sales;

INSERT ALL
INTO seles_data VALUES (sales_no, week_no) 
SELECT * FROM sales;

SELECT * FROM sales_data ORDER BY 2,3;


--SALES DATE기반 주차별 평균매출, 매출합
SELECT 
    week_no, AVG(sales), SUM(sales)
FROM
    sales_data
GROUP BY 
    week_no;
    
--다시피봇팅 하기
SELECT SALES_NO, WEEK_NO, DAY_NO, SALES FROM sales_DATA ORDER BY 2, 3; -- >>10행 컬럼늘리기
SELECT 
    SALES_NO, 
    WEEK_NO,
    MAX(CASE WHEN DAY_NO = 1 THEN SALES END) SALES_MON,
    MAX(CASE WHEN DAY_NO = 2 THEN SALES END) SALES_TUE,
    MAX(CASE WHEN DAY_NO = 3 THEN SALES END) SALES_WED,
    MAX(CASE WHEN DAY_NO = 4 THEN SALES END) SALES_THU,
    MAX(CASE WHEN DAY_NO = 5 THEN SALES END) SALES_FRI
FROM 
    SALES_DATA
GROUP BY 
    SALES_NO, WEEK_NO;
    
--또다시 피봇팅
SELECT SALES_NO, WEEK_NO, 1 DAY_NO, SALES_MON SALES FROM sales UNION
SELECT SALES_NO, WEEK_NO, 2 DAY_NO, SALES_TUE SALES FROM sales UNION
SELECT SALES_NO, WEEK_NO, 3 DAY_NO, SALES_WED SALES FROM sales UNION
SELECT SALES_NO, WEEK_NO, 4 DAY_NO, SALES_THU SALES FROM sales UNION
SELECT SALES_NO, WEEK_NO, 5 DAY_NO, SALES_FRI SALES FROM sales;

--달력만들기

SELECT ROWNUM RN FROM DICT WHERE ROWNUM <= 31; 


SELECT * 
FROM (
    SELECT ROWNUM RN FROM DICT WHERE ROWNUM <= 31
);

--MOD 나머지연산 사용할거
SELECT 
    CASE WHEN MOD (RN, 7) = 1 THEN RN END 일
FROM (
    SELECT ROWNUM RN FROM DICT WHERE ROWNUM <= 31
);

--MOD 나머지연산 사용할거1
SELECT 
    CASE WHEN MOD (RN, 7) = 1 THEN RN END 일,
    CASE WHEN MOD (RN, 7) = 2 THEN RN END 월,
    CASE WHEN MOD (RN, 7) = 3 THEN RN END 화,
    CASE WHEN MOD (RN, 7) = 4 THEN RN END 수,
    CASE WHEN MOD (RN, 7) = 5 THEN RN END 목,
    CASE WHEN MOD (RN, 7) = 6 THEN RN END 금,
    CASE WHEN MOD (RN, 7) = 0 THEN RN END 토
    
FROM (
    SELECT ROWNUM RN FROM DICT WHERE ROWNUM <= 31
);

--MOD 나머지연산 사용할거2 얘들의 공통점 봐서 그룹조건줄꺼 
--공통점 주
SELECT 
    TRUNC((RN-1)/7),
    CASE WHEN MOD (RN, 7) = 1 THEN RN END 일,
    CASE WHEN MOD (RN, 7) = 2 THEN RN END 월,
    CASE WHEN MOD (RN, 7) = 3 THEN RN END 화,
    CASE WHEN MOD (RN, 7) = 4 THEN RN END 수,
    CASE WHEN MOD (RN, 7) = 5 THEN RN END 목,
    CASE WHEN MOD (RN, 7) = 6 THEN RN END 금,
    CASE WHEN MOD (RN, 7) = 0 THEN RN END 토
    
FROM (
    SELECT ROWNUM RN FROM DICT WHERE ROWNUM <= 31
);


--MOD 나머지연산 사용할거3 공통점으로 묶어내기
SELECT 
    MAX(CASE WHEN MOD (RN, 7) = 1 THEN RN END) 일,
    MAX(CASE WHEN MOD (RN, 7) = 2 THEN RN END) 월,
    MAX(CASE WHEN MOD (RN, 7) = 3 THEN RN END) 화,
    MAX(CASE WHEN MOD (RN, 7) = 4 THEN RN END) 수,
    MAX(CASE WHEN MOD (RN, 7) = 5 THEN RN END) 목,
    MAX(CASE WHEN MOD (RN, 7) = 6 THEN RN END) 금,
    MAX(CASE WHEN MOD (RN, 7) = 0 THEN RN END) 토
FROM (
    SELECT ROWNUM RN FROM DICT WHERE ROWNUM <= 31
)
GROUP BY TRUNC((RN-1)/7)
ORDER BY TRUNC((RN-1)/7);


--MOD 나머지연산 사용할거3 공통점으로 묶어내기 >> DICT에 서브쿼리 먹이실거라고 했다



--교수 번호가 9903인 교수의 혂재 직급을 ?부교수?로 수정하여라
UPDATE professor SET 
POSITION = '부교수';
--이것만 하면 다 부교수됨
SELECT * FROM professor;
ROLLBACK;

UPDATE professor SET 
POSITION = '부교수'
WHERE profno = 9903;
SELECT * FROM professor;


--서브쿼리를 이용하여 학번이 10201인 학생의 학년과 학과 번호를 10103 학번 학생의 학년과 학과 번호와 동일하게 수정하여라

SELECT studno, grade, deptno
FROM student
WHERE studno = 10103;

SELECT studno, grade, deptno
FROM student
WHERE studno = 10201;

SELECT 
    studno, grade, deptno
FROM
    student
WHERE 
    studno IN (10201, 10103);


--내 과정
UPDATE student SET
--GRADE = (SELECT grade FROM student WHERE studno = 10103),
--DEPTNO = (SELECT deptno FROM student WHERE studno = 10103)
(grade, deptno) = (SELECT grade,deptno FROM student WHERE studno = 10103)
WHERE studno = 10201;
SELECT * FROM student;

--쌤 답
UPDATE student SET
(grade, deptno) = (SELECT grade, deptno FROM student WHERE studno = 10103)
WHERE studno = 10201;



--학생 테이블에서 학번이 20103인 학생의 데이터를 삭제하여라
DELETE FROM STUDENT
WHERE studno = 30303;

DELETE FROM STUDENT
WHERE name = '동서남';

SELECT * FROM student;


--학생 테이블에서 컴퓨터공학과에 소속된 학생을 모두 삭제하여라.

DELETE FROM student
WHERE deptno = (
SELECT deptno FROM department WHERE dname = '컴퓨터공학과');

ROLLBACK;


/*professor 테이블과 professor_temp 테이블을 비교하여
professor 테이블에 있는 기졲 데이터는 professor_temp 테이블
의 데이터에 의해 수정하고, professor 테이블에 없는 데이터는
싞규로 입력핚다.*/

CREATE TABLE professor_temp AS 
SELECT *
FROM professor
WHERE position = '교수';

UPDATE professor temp
SET position = '명예교수'
WHERE position = '교수';

INSERT INTO professor_temp
VALUES(9999, '김도경', 'arom21', '전임강사', 200, SYSDATE, 10, 101);

SELECT * FROM professor;
--두개랑 해당 교수번호 일치할 때 업데이트하고 아닐때 인서트
SELECT * FROM professor_temp;

MERGE INTO professor p
USING professor_temp p2
ON (p.profno = p2.profno)
WHEN MATCHED THEN 
    UPDATE SET position = p2.position
WHEN NOT MATCHED THEN
    INSERT values(p2.profno, p2.name, p2.userid, p2.position, p2.sal, p2.hiredate, p2.comm, p2.deptno);

    
--시작번호 3 2씩 증가하는 최대값 100읭 sequence 생성 이름은 seq_test
CREATE SEQUENCE seq_test
START WITH 3 
INCREMENT BY 2
MAXVALUE 100;

DROP SEQUENCE seq_test;

--CURRVAL, NEXTVAL
SELECT seq_test.CURRVAL FROM DUAL;
SELECT seq_test.NEXTVAL FROM DUAL;
SELECT seq_test.NEXTVAL, seq_test.NEXTVAL,seq_test.NEXTVAL,seq_test.NEXTVAL FROM DUAL;

SELECT * FROM professor;
--profno, name, position, sal, comm, userid, hiredate, deptno 로 바꾸기

CREATE TABLE prof2 AS
SELECT profno, name, position, sal, comm, userid, hiredate, deptno FROM professor;

SELECT * FROM prof2;

RENAME professor TO prof;
RENAME prof2 TO professor;

SELECT * FROM professor;





