--계절별 학생수

SELECT 
    * 
FROM
    student;
    
SELECT
    name,
    CASE 
    WHEN TO_CHAR(birthdate, 'MM') BETWEEN 3 AND 5 THEN '봄' 
    WHEN TO_CHAR(birthdate, 'MM') BETWEEN 6 AND 8 THEN '여름' 
    WHEN TO_CHAR(birthdate, 'MM') BETWEEN 9 AND 11 THEN '가을' 
    ELSE '겨울'
    END,
    count(*)        
FROM
    student
GROUP BY
   name, TO_CHAR(birthdate, 'MM');
   
   
   
   
-- 학생 탄생 계절별 인원수

SELECT
    studno, name, birthdate, ADD_MONTHS(birthdate, -2), TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q')
FROM
    student;
    
SELECT 
    CASE
        WHEN TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q') = 1 THEN '봄'
        WHEN TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q') = 2 THEN '여름'
        WHEN TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q') = 3 THEN '가을'
        ELSE '겨울'
    END SEASONS, 
    COUNT(*)
FROM student
WHERE birthdate IS NOT NULL
GROUP BY TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q')
ORDER BY TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q'); 


SELECT studno, name, S.deptno, dname
FROM student S, department D
WHERE S.deptno = d.deptno
AND studno = 10101;

SELECT * FROM student, department, professor;
--10101학생의 학번, 이름, 학과번호, 학과이름, 담당교수번호, 담당교수이름
SELECT 
    studno, S.name, S.deptno, dname, S.profno, P.name AS "담당교수"
FROM 
    student S, department D, professor P
WHERE 
    S.deptno = D.deptno  --나중에 애들이 외래키 될거임
    AND S.profno = P.profno --애들이 기본키
    AND studno = 10101;


--10101학생의 학번, 이름, 학과번호, 학과이름, 담당교수번호, 담당교수이름
SELECT
    studno, S.name, S.deptno, dname, profno, P.name
FROM student S
JOIN department D ON S.deptno = D.deptno
JOIN professor P USING(profno)
WHERE studno = 10101;



SELECT * FROM student, department;
--ASNI
SELECT * FROM student CROSS JOIN department;


--학생테이블과부서테이블을EQUI JOIN하여학번, 이름, 학과번호, 소속학과이름, 학과위치를춗력하여라
SELECT * FROM student, department;
SELECT 
    name, deptno, dname, loc
FROM 
    student
NATURAL JOIN
    department
WHERE
    deptno = deptno ;
    
SELECT 
    name, deptno, dname, loc
FROM 
    student
JOIN
    department USING(deptno)
WHERE
    deptno = deptno ;
    
    
--NATURAL JOIN을이용하여교수번호, 이름, 학과번호, 학과이름을춗력하여라.
SELECT profno, name, deptno, dname
FROM
    professor
NATURAL JOIN
    department;
    
--교수테이블과급여등급테이블을NON-EQUI JOIN하여교수별로급여등급을춗력하여라.
SELECT 
    name, sal, grade, hisal, losal
FROM
    professor
JOIN
    salgrade 
--ON sal BETWEEN losal AND hisal;
ON sal <= hisal AND sal >= losal;
    
SELECT * FROM professor;
SELECT * FROM salgrade;

--4행 2열짜리 숫자가 저장될 테이블 두개
CREATE TABLE J1(
    A NUMBER,
    B NUMBER
);
CREATE TABLE J2(
    A NUMBER,
    C NUMBER
);   

INSERT INTO J1 VALUES (1, 1);
INSERT INTO J1 VALUES (2, 2);
INSERT INTO J1 VALUES (3, 3);
INSERT INTO J1 VALUES (4, 4);

INSERT INTO J2 VALUES (1, 5);
INSERT INTO J2 VALUES (2, 6);
INSERT INTO J2 VALUES (5, 6);
INSERT INTO J2 VALUES (NULL, 7);

SELECT * FROM J1, J2;
SELECT * FROM J2;

SELECT 
    *
FROM
    J1
NATURAL JOIN
    J2;
    
SELECT * FROM J1, J2;    
SELECT * FROM J1 JOIN J2 ON J1.A = J2.A;
SELECT * FROM J1 JOIN J2 ON J1.A != J2.A;
SELECT * FROM J1 CROSS JOIN J2;



SELECT * FROM STUDENT;

DELETE student WHERE studno = 30303 OR studno is null;

SELECT 
    DISTINCT studno
FROM 
    STUDENT
WHERE 
    profno IS NOT NULL
ORDER BY 1;

--총학생수 16 담당교수 없는 6 있는 10 
-- 8 교수 3 학생없는 교수

--지도교수가 없는 학생도 출력
SELECT studno, s.name, profno, p.name
FROM
    student s
RIGHT JOIN
    professor p USING(profno);

--담당학생, 지도교수 없는 학생 출력 FULL
SELECT studno, s.name, profno, p.name
FROM
    student s
FULL JOIN
    professor p USING(profno);
    
    
--지도교수만 없는 학생들만
SELECT studno, s.name, profno, p.name
FROM
    student s
LEFT JOIN
    professor p USING(profno)
WHERE
    profno IS NULL;
    
--담담학생이 없는 교수들만
SELECT studno, s.name, profno, p.name
FROM
    student s
RIGHT JOIN
    professor p USING(profno)
WHERE
    studno IS NULL;
    
    
--양쪽 빼기
SELECT studno, s.name, profno, p.name
FROM
    student s
FULL JOIN
    professor p USING(profno)
WHERE
    profno IS NULL OR studno IS NULL;
    
    
    
--학생테이블과교수테이블을조인하여이름, 학년, 지도교수의이름, 직급을춗력하여라. 
--단, 지도교수가배정되지않은학생이름도함께춗력하여라.

SELECT 
    s.name, grade, p.name AS "지도교수", position
FROM
    student s
LEFT JOIN
    professor p USING(profno)
ORDER BY 2, 1;


--(+)사용 >> 선생님 비추
SELECT 
    s.name, grade, p.name AS "지도교수", position
FROM
    student s, professor p
WHERE
    s.profno = p.profno(+)
UNION ALL
SELECT 
    s.name, grade, p.name AS "지도교수", position
FROM
    student s, professor p
WHERE
    s.profno(+) = p.profno
ORDER BY 2, 1;

SELECT
    s.profno, p.profno, s.deptno, p.deptno
FROM student s, professor p;


--부서테이블에서SELF JOIN을이용하여부서이름과상위부서의이름을춗력하여라.
SELECT * FROM department d1, department d2;

SELECT 
    d1.dname || '의 상위학과는' || NVL2(d2.dname, d2.dname || '입니다', '없습니다') AS RESULT
FROM 
    department d1
LEFT JOIN department d2 ON d1.college = d2.deptno;

SELECT * 
FROM 
    professor 
WHERE 
    position = (
    SELECT 
        position
    FROM
        professor
    WHERE 
        name = '전은지'
);



