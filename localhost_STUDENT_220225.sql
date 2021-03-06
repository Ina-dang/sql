SELECT * FROM tab;

SELECT * FROM STUDENT;

SELECT DISTINCT deptno, name
FROM student
ORDER BY 1 DESC;

SELECT 'Hello world' AS "HI" FROM DUAL;

SELECT * FROM ex_type;

--학생 테이블에서 1학년 학생만 검색, 학번, 이름, 학과번호 출력
SELECT * FROM student;
SELECT grade, studno, name, deptno FROM student ORDER BY 1;

SELECT 
    studno, name, deptno 
FROM 
    student 
WHERE
--    grade = 1; --그레이드가 문자열이므로
--    TO_NUMBER(grade) = 1; >> 실제로는 이렇게 자동형변환해서 연산
    grade = '1'; --이게 가장 효율적
    
DESC STUDENT; --그레이드 유형보는법

--학생 테이블에서 몸무게 70kg 이하인 학생만 검색하여 이름 학년 학과번호 몸무게 출력
SELECT * FROM student;
SELECT studno, name, grade, deptno, weight 
FROM student 
WHERE weight <= 70 ;

--학생 테이블에서 1학년이면서 몸무게 70kg 이상인 학생만 검색하여 이름 학년 학과번호 몸무게 출력
SELECT * FROM student;

SELECT 
    studno, name, grade, deptno, weight 
FROM 
    student 
WHERE 
    grade = 1
AND
    weight >= 70 ;
    
--학생 테이블에서 1학년이거나 몸무게가 70kg 이상인 학생맊 검색하여 이름, 학년, 몸무게, 학과번호를 춗력하여라
SELECT 
    studno, name, grade, deptno, weight 
FROM 
    student 
WHERE 
    grade = 1
OR
    weight >= 70 ;
    
--BETWEEN 연산자를 사용하여 몸무게가 50kg에서 70kg 사이인 학생의 학번, 이름, 몸무게를 춗력하여라
SELECT
    studno, name, weight
FROM
    student
WHERE 
--    weight 
    -- 단순연산자일때는 앤드연산자가 더 짧은데 수식이 들어가면 비트윈이 훨씬 효율적
    weight * 2.2
    -- 당장 pound로만 바꿔도 그렇다
BETWEEN 
    50 AND 70;
    
--학생테이블에서 81년에서 83년도에 태어난 학생의 이름과 생년월일을 출력해라
SELECT * FROM student;
SELECT name, birthdate FROM student ORDER BY 2;

SELECT 
    name, birthdate 
FROM 
    student
WHERE 
    birthdate
BETWEEN
    '81/01/01' and  '83/12/31';


--AND타입으로 하는법
SELECT 
    name, birthdate 
FROM 
    student
WHERE 
    TO_CHAR(birthdate, 'YY') >= 81
AND 
    TO_CHAR(birthdate, 'YY') <= 83;
    
--IN타입으로 하는 법
SELECT 
    name, birthdate 
FROM 
    student
WHERE 
    TO_CHAR(birthdate, 'YY') 
IN 
    (81, 82, 83);

--IN 연산자를 사용하여 102번 학과와 201번 학과 학생의 이름, 학년, 학과번호를 춗력하여라
SELECT * FROM STUDENT;
SELECT name, grade, deptno FROM student ORDER BY 3 DESC;

SELECT 
    name, grade, deptno 
FROM 
    student
WHERE 
    deptno
IN 
    (102, 201)
ORDER BY 3;


--or 연산자로
SELECT 
    name, grade, deptno 
FROM 
    student
WHERE 
    deptno = 102 OR deptno = 201;
     
     
--LIKE연산자
-- 학생 테이블에서 성이 ?김?씨인 학생의 이름, 학년, 학과 번호를 춗력하여라
SELECT 
    name, grade, deptno
FROM 
    student
WHERE
    name
LIKE
    '김%'
ORDER BY 1;

--이름중에 '동'이 들어가는 학생의 학번, 이름 조회
SELECT 
    name, grade, deptno
FROM 
    student
WHERE
    name
LIKE
    '_%동%'
ORDER BY 1;

INSERT INTO student(name) VALUES ('동서남');

--? 학생 테이블에서 이름이 3글자, 성은 "김?씨고 마지막 글자가 "영?으로 끝나는 학생의 이름, 학년, 학과 번호를 춗력하여라
SELECT * FROM student;
SELECT
    name, grade, deptno
FROM 
    student
WHERE
    name
LIKE
    '김_영';



