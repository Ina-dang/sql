SELECT deptno FROM student;

SELECT s.name, studno, s.deptno, profno, p.name, position
FROM student S
LEFT JOIN professor P USING(profno)
ORDER BY profno, studno;





SELECT *
FROM professor
WHERE position = '교수';

--사용자 아이디가 ?jun123?인 학생과 같은 학년인 학생의 학번, 이름, 학년을 춗력하여라
SELECT * FROM STUDENT;

SELECT studno, name, grade
FROM student
WHERE 
    GRADE = ( 
        SELECT grade
        FROM student
        WHERE userid = 'jun123'
    );

--101번 학과 학생들의 평균 몸무게보다 몸무게가 적은 학생의 이름, 학과번호, 몸무게를 춗력하여라
SELECT
    name, deptno, weight
FROM
    student
WHERE 
    WEIGHT <     
    (SELECT 
        AVG(weight)
    FROM
        student
    WHERE
        deptno=101);
        
--20101번 학생과 학년이 같고, 키는 20101번 학생보다 큰 학생의 이름, 학년, 키를 춗력하여라
(SELECT grade
FROM student
WHERE studno = 20101);

SELECT height
FROM student
WHERE studno = 20101;

SELECT name, grade, height
FROM student
WHERE 
    grade = (
        SELECT grade
        FROM student
        WHERE studno = 20101
    )
AND 
    height > (
    SELECT height
    FROM student
    WHERE studno = 20101
    ) ;

--정보미디어학부(부서번호:100)에 소속된 모든 학생의 학번, 이름,학과 번호를 춗력하여라

SELECT studno, name, deptno
FROM student
WHERE deptno IN (
    SELECT deptno
    FROM department
    WHERE college = (
        SELECT deptno
        FROM department
        WHERE dname = '정보미디어학부'
        )
    );
    
    
--모든 학생 중에서 4학년 학생 중에서 키가 제일 작은 학생보다 키가 큰 학생의 학번, 이름, 키를 춗력하여라

SELECT studno, name, height
FROM student
WHERE height > ANY (
    SELECT height
    FROM student
    WHERE grade = 4
    );
    
SELECT studno, name, height
FROM student
WHERE height > (
    SELECT MIN(height)
    FROM student
    WHERE grade = 4
    );
    
---모든 학생 중에서 4학년 학생 중에서 키가 제일 큰 학생보다 키가 큰 학생의 학번, 이름, 키를 춗력하여라
SELECT studno, name, height
FROM student
WHERE height > ALL (
    SELECT height
    FROM student
    WHERE grade = 4
    );
    
SELECT studno, name, height
FROM student
WHERE height > (
    SELECT MAX(height)
    FROM student
    WHERE grade = 4
    );
    
---모든 학생 중 키가 제일 큰 4학년 학생 보다 키가 작은 학생의 학번, 이름, 키를 춗력하여라
SELECT height
FROM student
WHERE grade = 4;
    
SELECT studno, name, height
FROM student
WHERE height < ANY (
    SELECT height
    FROM student
    WHERE grade = 4
    );
    
SELECT studno, name, height
FROM student
WHERE height < (
    SELECT MAX(height)
    FROM student
    WHERE grade = 4
    )
ORDER BY 3;

--보직수당을 받는 교수가 핚 명이라도 있으면 모든 교수의 교수번호, 이름, 보직수당 그리고 급여와 보직수당의 합을 춗력하여라 

SELECT profno, name, comm, sal+comm
FROM professor
WHERE EXISTS (
    SELECT *
    FROM professor
    WHERE comm IS NOT NULL
    )
ORDER BY 3;
    
SELECT profno, name, comm, sal+comm
FROM professor
WHERE NOT EXISTS (
    SELECT *
    FROM professor
    WHERE comm IS NOT NULL
    );

--PAIRWISE 비교 방법에 의해 학년별로 몸무게가 최소인 학생의 이름, 학년, 몸무게를 춗력하여라
 
SELECT
    name, grade, weight
FROM
    student
WHERE 
    (GRADE, WEIGHT) IN (
    SELECT 
        grade, MIN(weight)
    FROM
        student
    GROUP BY grade
    )
ORDER BY 2,3;
    
-- UNPAIRWISE 비교 방법에 의해 학년별로 몸무게가 최소인 학생의 이름, 학년, 몸무게를 춗력하여라
SELECT
    name, grade, weight
FROM
    student
WHERE GRADE IN (
    SELECT 
        grade
    FROM
        student
    GROUP BY grade)
AND WEIGHT IN (
    SELECT
        MIN(weight)
    FROM
        student
    GROUP BY grade
    )
ORDER BY 3;

--각 학과 학생의 평균 키보다 키가 큰 학생의 이름, 학과 번호, 키를 춗력하여라

SELECT 
    studno, name, deptno, height
FROM 
    student S1
WHERE 
    height > (
    SELECT
    AVG(height)
    FROM
        student S2
    WHERE S1.deptno = S2.deptno
    GROUP BY deptno
    );
    
--학번, 이름, 학과번호, 학과이름에 대한것을 join, subquery로

SELECT
    studno, name, deptno
FROM
    student;
    
SELECT
    deptno, dname
FROM
    department;

SELECT studno, name, S.deptno, dname
FROM
    student S
JOIN 
    department D ON s.deptno = d.deptno;

SELECT studno, name, deptno, dname
FROM student
NATURAL JOIN department;

SELECT studno, name, s.deptno, (
    SELECT
        dname
    FROM
        department D
    WHERE
        d. deptno = s. deptno) dname
FROM student s;


--+ 교수님이름출력 (삼중)
SELECT studno, name, profno, (
    SELECT
        name
    FROM
        professor P
    WHERE
        p.profno = s.profno) pname, (
    SELECT
        dname
    FROM
        department D
    WHERE
        d. deptno = s. deptno) dname
FROM student s;


--홍길동
INSERT INTO student
VALUES (10110, '홍길동', 'hong', '1', '850101143098', '85/01/01', '041)630-3114', 170,70, 101,9903);

SELECT * FROM STUDENT;

ROLLBACK;

COMMIT;






