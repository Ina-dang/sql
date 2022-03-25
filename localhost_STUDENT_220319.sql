
SELECT * FROM STUDENT;
SELECT * FROM PROFESSOR;
SELECT * FROM department;

SELECT deptno FROM student;
SELECT DISTINCT deptno FROM student;


SELECT DISTINCT deptno AS dn FROM student;

SELECT 
    dname || ' ' || name || '입니다' 
from 
    student 
JOIN
    department USING(deptno)
WHERE
    dname = '컴퓨터공학과';


-- 학생들의 학번, 이름, 학과를 학과별 이름순으로 검색하라
SELECT * FROM student;
SELECT * FROM department;

SELECT 
    studno, name, dname
FROM 
    student
JOIN
    department USING(deptno)
ORDER BY 3;

--학생들의 정보를 학과별 학년이 높은 순으로 검색하라
SELECT * FROM STUDENT ORDER BY GRADE DESC;

--학생들의 정보를 학과별 순으로 
SELECT * FROM STUDENT ORDER BY DEPTNO;

--학생들의 학번, 이름을 학과별, 학년으로 검색;
SELECT 
    STUDNO, NAME
FROM 
    STUDENT
ORDER BY 
    DEPTNO, GRADE;
    
--학생들 아이디를 대문자로 검색
SELECT * FROM STUDENT;
SELECT UPPER(USERID) FROM STUDENT;

--()과 ()학년 ()입니다 검색
SELECT 
--    CONCAT(DNAME, '과 ', GRADE, '학년 ', NAME, '입니다.')
    DNAME || ' ' || GRADE || '학년 ' || NAME || '입니다.'
FROM
    STUDENT
JOIN 
    DEPARTMENT USING(DEPTNO);
    
--학생들의 이름, 유저아이디 첫2글자 검색
SELECT NAME, SUBSTR(USERID, 1, 2) AS "2"
FROM STUDENT;

-- 이름, 학과, 학과의 두번째 글자 1자리
SELECT NAME, DNAME, SUBSTR(DNAME, 2, 1) AS "1"
FROM STUDENT
JOIN DEPARTMENT USING(DEPTNO);

--학과명, 학과명 길이 검색
SELECT DNAME, LENGTH(DNAME)
FROM DEPARTMENT;

SELECT * FROM STUDENT;

SELECT INSTR(NAME, '김') FROM STUDENT;

--유저아이디 10자리로 만들고 앞2자리만 보이게하기)
SELECT RPAD(SUBSTR(USERID,1,2), 10, '*') FROM STUDENT; 

--학번, 이름, 키 검색
SELECT 
    STUDNO, NAME, HEIGHT
FROM    
    STUDENT;
    
    
--학년별 평균키
SELECT
    GRADE, TRUNC(AVG(HEIGHT), 2)
FROM 
    STUDENT
GROUP BY
    GRADE;
    
-- 담당 교수 없는경우 '교수없음'으로 검색
SELECT * FROM STUDENT;

SELECT NVL(TO_CHAR(PROFNO), '교수없음') FROM STUDENT;

--제일 키 큰 학생 검색
SELECT MAX(HEIGHT) FROM STUDENT;

--학년별 평균 신장 검색
SELECT TRUNC(AVG(HEIGHT), 2), GRADE
FROM STUDENT
GROUP BY GRADE
ORDER BY GRADE;

--학년별 인원수 많은 순서로 정렬
SELECT GRADE, COUNT(*)
FROM STUDENT
GROUP BY GRADE
ORDER BY 2 DESC;

--학년별 무거운 순으로 정렬
SELECT GRADE, TRUNC(AVG(WEIGHT),2)
FROM STUDENT
GROUP BY GRADE
ORDER BY AVG(WEIGHT) DESC;

-- 전자공학과를 수강하는 학생들의 학번과 이름 검색 
SELECT * FROM DEPARTMENT;
SELECT 
    STUDNO, NAME, DNAME 
FROM 
    STUDENT
JOIN
    DEPARTMENT USING(DEPTNO)
WHERE 
    DNAME = '전자공학과';
    
--학번 101또는 201학생들의 STUDNO, NAME, DEPTNO 검색
SELECT * FROM STUDENT;

SELECT STUDNO, NAME, DEPTNO
FROM STUDENT
WHERE DEPTNO = 101 OR DEPTNO = 201
ORDER BY DEPTNO;

--성이 김씨인 학생의 학번 이름 찾기
SELECT STUDNO, NAME
FROM STUDENT
WHERE NAME LIKE '김%';











