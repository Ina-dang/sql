SELECT * FROM STUDENT;

--학생 테이블에서 학번, 이름, 학과번호 조회
SELECT studno, name, deptno FROM student;

--학생 테이블에섯 학과번호 정렬순 조회
SELECT deptno FROM student ORDER BY 1;

--학생 테이블에서 학과번호 중복제거후 정렬조회
SELECT DISTINCT deptno FROM student ORDER BY 1;

SELECT ALL name, deptno FROM student; --편의상 ALL 생략

SELECT DISTINCT 
    name, deptno 
FROM
    student
WHERE
    deptno = 201 --conditional
ORDER BY 1;


-- 학생테이블에서 학과 별 인원수를 조회
SELECT 
    deptno, COUNT(*)
FROM  
    student
GROUP BY 
    deptno
HAVING COUNT
    (*) >= 5;


SELECT * FROM STUDENT;    
-- 학생 테이블에서 중복되는 학과번호를 제외하고 출력
SELECT DISTINCT deptno FROM student;

-- 학생 테이블에서 중복되는 학과번호, 학년 제외하고 출력
SELECT DISTINCT deptno, grade FROM student ORDER BY 1, 2;

--다양한 정렬방식
SELECT DISTINCT deptno, grade FROM student ORDER BY 1 DESC, 2 DESC;
SELECT deptno, grade FROM student ORDER BY studno;

--데이터베이스 문자열 리터럴 : ''
SELECT 'HELLO WORLD' FROM DUAL;
SELECT 'HELLO WORLD' FROM student; --스튜던트 행 17개만큼의 결과가 나옴

--학생의 이름과 '안녕' 결합
SELECT name || '안녕' FROM student; --오라클에서만 가능
SELECT CONCAT(name, '안녕') AS HI FROM STUDENT S; --정석문법

--학번에 "학번" 이름에는 "이름" 
SELECT studno AS "학번", name AS "이름" FROM STUDENT;
SELECT studno "학번", name "이름" FROM STUDENT;

--부서테이블 부서이름 별명"dept_name", 부서번호 칼럼의 별명은 "DN"
SELECT * FROM department;
SELECT dname, deptno FROM department;
SELECT 
    dname AS "dept_name",
    deptno AS "DN" 
FROM 
    department;

--학생테이블에서 학번과 이름칼럼 연결 "Student"별명 붙이기
SELECT * FROM student;
SELECT studno, name FROM student;
SELECT studno || name FROM student;
SELECT studno || name AS "Student" FROM student;
SELECT studno || ' ' || name As "Student" FROM student ORDER BY 1;

SELECT * FROM department;
SELECT deptno, dname FROM department;
SELECT deptno || dname FROM department;
SELECT deptno || ' ' || dname AS "department" FROM department ORDER BY 1;

--학생 몸무게 pound환산 칼럼이름 weight_pound 1kg는 2.2
SELECT * FROM student;
SELECT studno, name, weight FROM student;
SELECT studno, name, weight, weight * 2.2 AS "weight_pound" FROM student ORDER BY 1;

/* 순서 중요쓰
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
*/

SELECT deptno, COUNT(*)
FROM student
WHERE weight IS  NOT NULL
GROUP BY deptno
HAVING COUNT(deptno) >= 5
ORDER BY deptno;

-- 컴퓨터는 FROM >> HAVING >> GROUP BY >> WHERE >> SELECT >> ORDER BY 순으로 해석

SELECT * FROM STUDENT;


--테이블 생성
CREATE TABLE EX_TYPE (
    C CHAR(10), --C라는 이름의 CHAR타입변수를 10칸
    V VARCHAR(10) --2안적어도 됨
);

--테이블 삭제
DROP TABLE EX_TYPE;

--데이터 입력
INSERT INTO EX_TYPE VALUES ('sql', 'sql');
SELECT * FROM EX_TYPE;
SELECT * FROM EX_TYPE;

--
SELECT * 
FROM EX_TYPE
--WHERE c = 'sql'; --둘다가능
WHERE c = 'sql           ';

SELECT *
FROM EX_TYPE
WHERE v = 'sql';
--WHERE v = 'sql       '; --불가능

SELECT *
FROM EX_TYPE
WHERE C = V || '       '; --얘는 값 출력
--WHERE C = V; --저장길이가 다르므로 거짓

--공백 제거
RTRIM('abc   ');
LTRIM('    abc');

SELECT 1
FROM DUAL
--WHERE 1=0; --거짓이라 안나옴
--WHERE 1=1; --참이라 나옴
WHERE 1='1'; --참이라 나옴, 숫자로 타입 맞춤


SELECT 3.14 + 1 FROM DUAL;
SELECT studno, name, birthdate, sysdate, ROUND(sysdate-birthdate) FROM STUDENT WHERE studno = 10101;

--내 날짜 계산
SELECT SYSDATE - TO_DATE('93/07/07') FROM DUAL;

SELECT SYSDATE FROM DUAL; --년월일론나옴

SELECT 
--    "NOW"
    TO_CHAR(SYSDATE , 'YY/MM/DD HH24:MI:SS') NOW,
--    "1DAY AFTER"
    TO_CHAR(SYSDATE + 1  , 'YY/MM/DD HH24:MI:SS') AS "1DAY AFTER",
--    "3 HOURS AFTER"
    TO_CHAR(SYSDATE + 3/24 , 'YY/MM/DD HH24:MI:SS') AS "3HOURS AFTER",
--    "30MINUTS AFTER"
    TO_CHAR(SYSDATE + 30/24/60 , 'YY/MM/DD HH24:MI:SS') AS "30MINUTES AFTER",

    ADD_MONTHS(SYSDATE, 1) AS "ADD MONTHS"
FROM DUAL; --포맷터

SELECT TO_CHAR(TO_DATE('83/05/09'), 'YY/MM/DD HH24:MI:SS') FROM DUAL;
SELECT ROUND(SYSDATE) FROM DUAL;
SELECT ROUND(SYSDATE -1/24, 'YY') FROM DUAL;
SELECT ROUND(SYSDATE -1/24, 'MM') FROM DUAL;

SELECT ROWID, S.* FROM STUDENT S; --생각보다 잘 안씀
SELECT ROWNUM, S.* FROM STUDENT S ORDER BY STUDNO DESC; --얘는 좀 잘씀쓰 >> 조회시에 나왔던 행들의 순번
