SELECT deptno FROM student;

SELECT s.name, studno, s.deptno, profno, p.name, position
FROM student S
LEFT JOIN professor P USING(profno)
ORDER BY profno, studno;





SELECT *
FROM professor
WHERE position = '±³¼ö';

--»ç¿ëÀÚ ¾ÆÀÌµð°¡ ?jun123?ÀÎ ÇÐ»ý°ú °°Àº ÇÐ³âÀÎ ÇÐ»ýÀÇ ÇÐ¹ø, ÀÌ¸§, ÇÐ³âÀ» ­t·ÂÇÏ¿©¶ó
SELECT * FROM STUDENT;

SELECT studno, name, grade
FROM student
WHERE 
    GRADE = ( 
        SELECT grade
        FROM student
        WHERE userid = 'jun123'
    );

--101¹ø ÇÐ°ú ÇÐ»ýµéÀÇ Æò±Õ ¸ö¹«°Ôº¸´Ù ¸ö¹«°Ô°¡ ÀûÀº ÇÐ»ýÀÇ ÀÌ¸§, ÇÐ°ú¹øÈ£, ¸ö¹«°Ô¸¦ ­t·ÂÇÏ¿©¶ó
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
        
--20101¹ø ÇÐ»ý°ú ÇÐ³âÀÌ °°°í, Å°´Â 20101¹ø ÇÐ»ýº¸´Ù Å« ÇÐ»ýÀÇ ÀÌ¸§, ÇÐ³â, Å°¸¦ ­t·ÂÇÏ¿©¶ó
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

--Á¤º¸¹Ìµð¾îÇÐºÎ(ºÎ¼­¹øÈ£:100)¿¡ ¼Ò¼ÓµÈ ¸ðµç ÇÐ»ýÀÇ ÇÐ¹ø, ÀÌ¸§,ÇÐ°ú ¹øÈ£¸¦ ­t·ÂÇÏ¿©¶ó

SELECT studno, name, deptno
FROM student
WHERE deptno IN (
    SELECT deptno
    FROM department
    WHERE college = (
        SELECT deptno
        FROM department
        WHERE dname = 'Á¤º¸¹Ìµð¾îÇÐºÎ'
        )
    );
    
    
--¸ðµç ÇÐ»ý Áß¿¡¼­ 4ÇÐ³â ÇÐ»ý Áß¿¡¼­ Å°°¡ Á¦ÀÏ ÀÛÀº ÇÐ»ýº¸´Ù Å°°¡ Å« ÇÐ»ýÀÇ ÇÐ¹ø, ÀÌ¸§, Å°¸¦ ­t·ÂÇÏ¿©¶ó

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
    
---¸ðµç ÇÐ»ý Áß¿¡¼­ 4ÇÐ³â ÇÐ»ý Áß¿¡¼­ Å°°¡ Á¦ÀÏ Å« ÇÐ»ýº¸´Ù Å°°¡ Å« ÇÐ»ýÀÇ ÇÐ¹ø, ÀÌ¸§, Å°¸¦ ­t·ÂÇÏ¿©¶ó
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
    
---¸ðµç ÇÐ»ý Áß Å°°¡ Á¦ÀÏ Å« 4ÇÐ³â ÇÐ»ý º¸´Ù Å°°¡ ÀÛÀº ÇÐ»ýÀÇ ÇÐ¹ø, ÀÌ¸§, Å°¸¦ ­t·ÂÇÏ¿©¶ó
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

--º¸Á÷¼ö´çÀ» ¹Þ´Â ±³¼ö°¡ À™ ¸íÀÌ¶óµµ ÀÖÀ¸¸é ¸ðµç ±³¼öÀÇ ±³¼ö¹øÈ£, ÀÌ¸§, º¸Á÷¼ö´ç ±×¸®°í ±Þ¿©¿Í º¸Á÷¼ö´çÀÇ ÇÕÀ» ­t·ÂÇÏ¿©¶ó 

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

--PAIRWISE ºñ±³ ¹æ¹ý¿¡ ÀÇÇØ ÇÐ³âº°·Î ¸ö¹«°Ô°¡ ÃÖ¼ÒÀÎ ÇÐ»ýÀÇ ÀÌ¸§, ÇÐ³â, ¸ö¹«°Ô¸¦ ­t·ÂÇÏ¿©¶ó
 
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
    
-- UNPAIRWISE ºñ±³ ¹æ¹ý¿¡ ÀÇÇØ ÇÐ³âº°·Î ¸ö¹«°Ô°¡ ÃÖ¼ÒÀÎ ÇÐ»ýÀÇ ÀÌ¸§, ÇÐ³â, ¸ö¹«°Ô¸¦ ­t·ÂÇÏ¿©¶ó
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

--°¢ ÇÐ°ú ÇÐ»ýÀÇ Æò±Õ Å°º¸´Ù Å°°¡ Å« ÇÐ»ýÀÇ ÀÌ¸§, ÇÐ°ú ¹øÈ£, Å°¸¦ ­t·ÂÇÏ¿©¶ó

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
    
--ÇÐ¹ø, ÀÌ¸§, ÇÐ°ú¹øÈ£, ÇÐ°úÀÌ¸§¿¡ ´ëÇÑ°ÍÀ» join, subquery·Î

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


--+ ±³¼ö´ÔÀÌ¸§Ãâ·Â (»ïÁß)
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


--È«±æµ¿
INSERT INTO student
VALUES (10110, 'È«±æµ¿', 'hong', '1', '850101143098', '85/01/01', '041)630-3114', 170,70, 101,9903);

SELECT * FROM STUDENT;

ROLLBACK;

COMMIT;






