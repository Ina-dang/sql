SELECT * FROM STUDENT;

SELECT rownum, rowid, studno FROM student;

SELECT
    rownum, name
FROM
    STUDENT
WHERE
    rownum 
BETWEEN 1 and 3;

SELECT
    studno, name, grade, deptno, weight
FROM
    student
WHERE
    weight <= 70;
    
--// 10101 전인하 학생의 지도교수 찾기
SELECT * 
FROM professor 
WHERE 
    profno = 9903;

SELECT * FROM student;
--아직 지정교수 없는상태
SELECT * FROM professor WHERE profno = null;

-- '' 빈문자열 ==> 길이가 0 이면 null로 처리
-- = null

--현재시간정보에 스칼라함수
SELECT 
    SYSDATE, 
    TO_CHAR(SYSDATE, 'MM/DD') MD,  --함수. 인데 두 개의 값(SYSDATE, MMDD 넣었는데 하나만 반환)
    TO_CHAR(NULL, 'MM/DD') NV, --null이 인자로 들어가서 null값 반환
    TO_CHAR(SYSDATE, NULL) NV2
FROM 
    DUAL;


--합집합연산    
SELECT AVG(MYVAL)
FROM (
    SELECT 1000 MYVAL FROM DUAL
    UNION ALL
    SELECT NULL FROM DUAL
    UNION ALL
    SELECT NULL FROM DUAL
    UNION ALL
    SELECT NULL FROM DUAL
    UNION ALL
    SELECT 2000 FROM DUAL
);

SELECT (1000 + NULL + NULL + NULL + 2000) / 5 FROM DUAL;

-- divisor is equal to zero 오류발생
SELECT
    2 / 0
FROM 
    DUAL;
    
    
--교수 테이블에서 이름, 직급,  보직수당 출력
SELECT * FROM PROFESSOR;
SELECT
    name, position, sal
FROM
    professor;

-- 교수테이블에서 보직수당을 받는 교수의 이름, 직급, 보직수당 출력
SELECT
    name, position, comm
FROM
    professor
WHERE 
    COMM IS NOT NULL;


-- 교수테이블에서 보직수당을 받지않는 교수의 이름, 직급, 보직수당 출력
SELECT
    name, position, comm
FROM
    professor
WHERE 
    COMM IS NULL;
    
--교수테이블에서 급여에 보직수당을 더한값을 sal_com이라는 별명으로 출력
SELECT * FROM professor;
SELECT  
    name, sal, comm, sal+comm AS sal_com
FROM 
    professor
WHERE
    sal+comm IS NOT NULL;
    
--102번 학과의 학생중 1 똔는 4학년 학생의 이름 학년 학과번호 출력
SELECT * FROM STUDENT;
SELECT
    name, grade, deptno
FROM 
    student
WHERE 
    deptno = 102 
AND (
    grade = 1 
OR 
    grade = 4);

--102번 학과의 학생 중에서 4학년 학생이거나 소속학과에 상관없이 1학년 학생의 이름, 학년, 학과 번호를 춗력하여라
SELECT * FROM STUDENT;
SELECT 
    name, grade, deptno
FROM 
    student
WHERE
    deptno = 102 
AND
    grade = 4 
OR 
    grade = 1;
    
--? 1학년 이면서 몸무게가 70kg 이상인 학생의 집합(stud_heavy)과 1학년 이면서 101번 학과에 소속된 학생(stud_101)으로 구성된 두 개의 테이블 생성
--질의문부터 처리

CREATE TABLE STUD_HEAVY AS --테이블 생성
SELECT * FROM STUDENT WHERE GRADE = 1 AND WEIGHT >= 70;

CREATE TABLE STUD_101 AS --테이블 생성
SELECT * FROM STUDENT WHERE GRADE = 1 AND deptno = 101;

SELECT * FROM STUD_HEAVY;
SELECT * FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
UNION --합집합
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
UNION ALL --중복합집합
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
INTERSECT --교집합
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
MINUS --차집합
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;


/*
1 2 3 
4 5 6
7 8 9
만들기*/
--야매
SELECT 1,2,3 FROM DUAL
UNION
SELECT 4,5,6 FROM DUAL
UNION 
SELECT 7,8,9 FROM DUAL;

--선생님이 원하던 답
SELECT 
    (rownum-1)*3+1 N1, (rownum-1)*3+2 N2, (rownum-1)*3+3 N3
FROM
    student
WHERE
    rownum <= 3;

-- 달력만드는데 쓸거
SELECT
    *
FROM
    ALL_OBJECTS;
    


--학생 테이블에서 이름을 가나다순으로 정렧하여 이름, 학년, 젂화번호를 춗력하여라
SELECT 
    name, grade, tel 
FROM 
    student 
WHERE 
    tel IS NOT NULL
ORDER BY 1;

--학년 내림차순
SELECT 
    name, grade, tel 
FROM 
    student 
WHERE 
    tel IS NOT NULL
ORDER BY 2 DESC;

--학년, 이름 내림차순
SELECT 
    name, grade, tel 
FROM 
    student 
WHERE 
    tel IS NOT NULL
ORDER BY 2 DESC, 1 DESC;
    
    
--학생 테이블에서 학번, 이름, 탄생년도 조회
SELECT
    studno, name, birthdate, TO_CHAR(birthdate, 'YYYY') AS YY
FROM   
    student;
    
--학생 테이블에서 평균키 평균몸무게 조회
SELECT 
    MIN(studno), AVG(height) AS "평균 키" , avg(weight) AS "평균 몸무게"
FROM
    student;
    
    
--학생 테이블에서 ?김영균? 학생의 이름, 사용자 아이디를 춗력하여라. 그리고 사용자 아이디의 첪 묷자를 대묷자로 변홖하여 춗력하여라
SELECT
    name, INITCAP(userid), LOWER(userid), UPPER(userid)
FROM
    student
WHERE
    name = '김영균';

--부서 테이블에서 부서 이름의 길이를 묷자 수와 바이트 수로 각각 춗력하여라
SELECT
    dname, LENGTH(dname),LENGTHB(dname)
FROM
    department;
    
--학생 테이블에서 1학년 학생의 주민등록 번호에서 생년월일과 태어난 달을 추춗하여 이름, 주민번호, 생년월일, 태어난 달을 춗력하여라.
SELECT
    name, grade, idnum, SUBSTR(idnum,1,6) AS "BIRTHDATE", SUBSTR(idnum, 3,2) AS "BIRTHMONTH"
FROM
    student
WHERE 
    grade = 1
ORDER BY 4;

SELECT 1, '123456789012345667890' FROM DUAL
UNION
SELECT 2, 'CORPORATE FLOOR' FROM DUAL
UNION
SELECT 3, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR')) FROM DUAL
UNION
SELECT 4, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR', 3)) FROM DUAL
UNION
SELECT 6, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR', 3, 2)) FROM DUAL
UNION
SELECT 7, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR', -3)) FROM DUAL
UNION
SELECT 8, TO_CHAR(INSTR('CORPORATE FLOOR', 'OR', -3, 2)) FROM DUAL;




    