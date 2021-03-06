--교수테이블에서소속학과에따라보너스를다르게계산하여춗력하여라. 학과번호별로보너스는다음과같이계산핚다.
--학과번호가101이면보너스는급여의10%, 102이면20%, 201이면30%, 나머지학과는0%이다.

SELECT 
    name, sal, deptno,
    DECODE(deptno,
        101, sal * 0.1,
        102, sal * 0.1,
        103, sal * 0.1,
        0 ) BONUS, --이런경우는 DECODE가 더 나을수도
    CASE deptno
        WHEN 101 THEN sal * 0.1
        WHEN 102 THEN sal * 0.1
        WHEN 103 THEN sal * 0.1
        ELSE 0
    END BONUS1
FROM
    professor;
    


SELECT
    studno, name, birthdate, TO_CHAR(birthdate, 'MM') AS "달",
    CASE
        WHEN TO_CHAR(birthdate, 'MM') IN (3,4,5) THEN '봄'
        WHEN TO_CHAR(birthdate, 'MM') BETWEEN 6 AND 8 THEN '여름'
        WHEN TO_CHAR(birthdate, 'MM') BETWEEN 9 AND 11 THEN '가을'
        ELSE '겨울'
    END AS "seasons"
    
FROM
    student;
    
    

--서브쿼리
SELECT  
    studno,
    name,
    CASE
        WHEN M IN (3,4,5) THEN '봄'
        WHEN M BETWEEN 6 AND 8 THEN '여름'
        WHEN M BETWEEN 9 AND 11 THEN '가을'
        ELSE '겨울'
    END AS "seasons"
FROM (
    SELECT
        studno, name, birthdate, TO_CHAR(birthdate, 'MM') AS "M"
    FROM
        student
);


SELECT
    deptno
FROM
    student
WHERE 
    deptno IS NOT NULL
GROUP BY
    deptno
HAVING 
    COUNT(deptno) <= 5 ;
    
    
--101번학과교수중에서보직수당을받는교수의수를춗력하여라.
SELECT
    COUNT(comm)
FROM
    professor
WHERE 
    deptno = 101;
    
--?101번학과학생들의몸무게평균과합계를춗력하여라.
SELECT
    SUM(WEIGHT), AVG(WEIGHT)
FROM
    student
WHERE 
    deptno = 101;
    
--102번학과학생중에서최대키와최소키를춗력하여라.
SELECT
    MAX(height), MIN(height)
FROM   
    student
WHERE
    deptno = 102;
    

SELECT
    deptno, COUNT(deptno)
FROM
    student
WHERE 
    deptno IS NOT NULL
GROUP BY
    deptno;
    
    
SELECT
    position, COUNT(*)
FROM
    professor
GROUP BY position;    
    
SELECT
    deptno, position, COUNT(*)
FROM
    professor
GROUP BY deptno, position;


--교수테이블에서학과별로교수수와보직수당을받는교수수를춗력하여라
SELECT
    deptno, COUNT(*), COUNT(COMM)
FROM
    professor
GROUP BY 
    deptno
ORDER BY 1;


--학과별로소속교수들의평균급여, 최소급여, 최대급여를춗력하여라.
SELECT
   deptno, AVG(SAL), MIN(SAL), MAX(SAL)
FROM
    professor
GROUP BY 
    deptno;

--항상 그룹바이는 결과를 검토해야한다
SELECT 
    deptno, sal
FROM
    professor
ORDER BY 1  ;



--젂체학생을소속학과별로나누고, 같은학과학생은다시학년별로그룹핑하여, 학과와학년별인원수, 평균몸무게를춗력하여라, 
--단, 평균몸무게는소수점이하첪번째자리에서반올림핚다.

SELECT
    deptno, grade, COUNT(*), ROUND(AVG(WEIGHT))
FROM 
    STUDENT
WHERE 
    deptno IS NOT NULL
GROUP BY
    deptno, grade
ORDER BY 1, 2;


--소속학과별로교수급여합계와모든학과교수들의급여합계를춗력하여라
SELECT
    deptno, sum(sal)
FROM
    professor
GROUP BY
    ROLLUP(deptno);
    
--ROLLUP 연산자를이용하여학과및직급별교수수, 학과별교수수, 젂체교수수를춗력하여라.
SELECT
    deptno, position, count(*), GROUPING(deptno), GROUPING(position)
FROM
    professor
GROUP BY
    ROLLUP(deptno, position);
--    CUBE(deptno, position);



--학과내에서학년별인원수와태어난년도별인원수를춗력하여라.
SELECT
    deptno, grade, TO_CHAR(birthdate, 'YY') AS YY, count(*)
FROM
    student
GROUP BY
    GROUPING SETS((deptno, grade), (deptno, TO_CHAR(birthdate, 'YY')));
    
    
    
--학생수가4명이상인학년에대해서학년, 학생수, 평균키, 평균몸무게를춗력하여라.
-- 단, 평균키와평균몸무게는소수점첪번째자리에서반올림하고, 춗력순서는평균키가높은순부터내림차순으로춗력하여라
SELECT
    grade, COUNT(*), ROUND(AVG(height)), ROUND(AVG(weight))
FROM
    student
WHERE
    grade IS NOT NULL
GROUP BY
    grade
HAVING
    COUNT(*) >= 4
ORDER BY
    3 DESC;
    
SELECT
    grade, count(grade)
FROM
    student
GROUP BY
    grade;
    
    
--학과별 학생의 평균 몸무게
SELECT 
    deptno, AVG(weight)
FROM 
    student
WHERE 
    deptno IS NOT NULL
GROUP BY 
    deptno
ORDER BY 1;

--학과별 학생의 평균 몸무게중 최대 평균 몸무게
SELECT 
    deptno, MAX(AVG(weight))
FROM 
    student
WHERE 
    deptno IS NOT NULL
GROUP BY 
    deptno
ORDER BY 1;


    
--학과별 학생의 평균 몸무게중 최대 평균 몸무게
SELECT DEPTNO, A_WEIGHT
FROM
    (SELECT
        deptno, AVG(weight) A_WEIGHT
    FROM
        student
    GROUP BY
        deptno) A,
    (SELECT
        MAX(AVG(weight)) B_WEIGHT
    FROM
        student
    GROUP BY 
        deptno) B
WHERE B.B_WEIGHT = A.A_WEIGHT;



--조인을 이용한 학생이름과 학과이름 검색
SELECT 
    studno, name,
    student.deptno, 
    department.dname
FROM
    student, department
WHERE
    student.deptno = department.deptno;
    
    
SELECT
    *
FROM
    (SELECT
        rownum A
    FROM
        dict
    WHERE
        rownum <=4) A,    
    (SELECT
        (rownum-1) * 2 + 1 B
    FROM
        dict
    WHERE
        rownum <=3) B
WHERE A.A = B.B;


SELECT 
    studno, name, D.deptno, dname
FROM 
    student S, department D
WHERE
    S.deptno = D.deptno;
    
SELECT 
    *
FROM
    student;
    
    
--??젂인하?학생의학번, 이름, 학과이름그리고학과위치를춗력하여라.
SELECT
    studno, name, dname, loc
FROM
    student S, department D
WHERE
    name = '전인하'
AND
    S.deptno = D.deptno;
    
    
SELECT
    studno, name, dname, loc
FROM
    student
NATURAL JOIN 
    department
WHERE
    name = '전인하';
        
        
-- 학번, 학생이름, 교수번호, 담당교수이름
SELECT
    studno, S.name, S.profno, P.name
FROM
    student S, professor P
WHERE
    S.profno = P.profno;
    
    
SELECT
    *
FROM
    student, professor;

--ASNI grammer
SELECT
    studno, S.name, S.profno, P.name
FROM
    student S
JOIN 
    professor P
ON
    S.profno = P.profno;
    
SELECT
    studno, S.name, profno, P.name
FROM
    student S
JOIN 
    professor P
USING
    (profno);
    
    
