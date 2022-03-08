--°èÀýº° ÇÐ»ý¼ö

SELECT 
    * 
FROM
    student;
    
SELECT
    name,
    CASE 
    WHEN TO_CHAR(birthdate, 'MM') BETWEEN 3 AND 5 THEN 'º½' 
    WHEN TO_CHAR(birthdate, 'MM') BETWEEN 6 AND 8 THEN '¿©¸§' 
    WHEN TO_CHAR(birthdate, 'MM') BETWEEN 9 AND 11 THEN '°¡À»' 
    ELSE '°Ü¿ï'
    END,
    count(*)        
FROM
    student
GROUP BY
   name, TO_CHAR(birthdate, 'MM');
   
   
   
   
-- ÇÐ»ý Åº»ý °èÀýº° ÀÎ¿ø¼ö

SELECT
    studno, name, birthdate, ADD_MONTHS(birthdate, -2), TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q')
FROM
    student;
    
SELECT 
    CASE
        WHEN TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q') = 1 THEN 'º½'
        WHEN TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q') = 2 THEN '¿©¸§'
        WHEN TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q') = 3 THEN '°¡À»'
        ELSE '°Ü¿ï'
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
--10101ÇÐ»ýÀÇ ÇÐ¹ø, ÀÌ¸§, ÇÐ°ú¹øÈ£, ÇÐ°úÀÌ¸§, ´ã´ç±³¼ö¹øÈ£, ´ã´ç±³¼öÀÌ¸§
SELECT 
    studno, S.name, S.deptno, dname, S.profno, P.name AS "´ã´ç±³¼ö"
FROM 
    student S, department D, professor P
WHERE 
    S.deptno = D.deptno  --³ªÁß¿¡ ¾ÖµéÀÌ ¿Ü·¡Å° µÉ°ÅÀÓ
    AND S.profno = P.profno --¾ÖµéÀÌ ±âº»Å°
    AND studno = 10101;


--10101ÇÐ»ýÀÇ ÇÐ¹ø, ÀÌ¸§, ÇÐ°ú¹øÈ£, ÇÐ°úÀÌ¸§, ´ã´ç±³¼ö¹øÈ£, ´ã´ç±³¼öÀÌ¸§
SELECT
    studno, S.name, S.deptno, dname, profno, P.name
FROM student S
JOIN department D ON S.deptno = D.deptno
JOIN professor P USING(profno)
WHERE studno = 10101;



SELECT * FROM student, department;
--ASNI
SELECT * FROM student CROSS JOIN department;


--ÇÐ»ýÅ×ÀÌºí°úºÎ¼­Å×ÀÌºíÀ»EQUI JOINÇÏ¿©ÇÐ¹ø, ÀÌ¸§, ÇÐ°ú¹øÈ£, ¼Ò¼ÓÇÐ°úÀÌ¸§, ÇÐ°úÀ§Ä¡¸¦­t·ÂÇÏ¿©¶ó
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
    
    
--NATURAL JOINÀ»ÀÌ¿ëÇÏ¿©±³¼ö¹øÈ£, ÀÌ¸§, ÇÐ°ú¹øÈ£, ÇÐ°úÀÌ¸§À»­t·ÂÇÏ¿©¶ó.
SELECT profno, name, deptno, dname
FROM
    professor
NATURAL JOIN
    department;
    
--±³¼öÅ×ÀÌºí°ú±Þ¿©µî±ÞÅ×ÀÌºíÀ»NON-EQUI JOINÇÏ¿©±³¼öº°·Î±Þ¿©µî±ÞÀ»­t·ÂÇÏ¿©¶ó.
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

--4Çà 2¿­Â¥¸® ¼ýÀÚ°¡ ÀúÀåµÉ Å×ÀÌºí µÎ°³
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

--ÃÑÇÐ»ý¼ö 16 ´ã´ç±³¼ö ¾ø´Â 6 ÀÖ´Â 10 
-- 8 ±³¼ö 3 ÇÐ»ý¾ø´Â ±³¼ö

--Áöµµ±³¼ö°¡ ¾ø´Â ÇÐ»ýµµ Ãâ·Â
SELECT studno, s.name, profno, p.name
FROM
    student s
RIGHT JOIN
    professor p USING(profno);

--´ã´çÇÐ»ý, Áöµµ±³¼ö ¾ø´Â ÇÐ»ý Ãâ·Â FULL
SELECT studno, s.name, profno, p.name
FROM
    student s
FULL JOIN
    professor p USING(profno);
    
    
--Áöµµ±³¼ö¸¸ ¾ø´Â ÇÐ»ýµé¸¸
SELECT studno, s.name, profno, p.name
FROM
    student s
LEFT JOIN
    professor p USING(profno)
WHERE
    profno IS NULL;
    
--´ã´ãÇÐ»ýÀÌ ¾ø´Â ±³¼öµé¸¸
SELECT studno, s.name, profno, p.name
FROM
    student s
RIGHT JOIN
    professor p USING(profno)
WHERE
    studno IS NULL;
    
    
--¾çÂÊ »©±â
SELECT studno, s.name, profno, p.name
FROM
    student s
FULL JOIN
    professor p USING(profno)
WHERE
    profno IS NULL OR studno IS NULL;
    
    
    
--ÇÐ»ýÅ×ÀÌºí°ú±³¼öÅ×ÀÌºíÀ»Á¶ÀÎÇÏ¿©ÀÌ¸§, ÇÐ³â, Áöµµ±³¼öÀÇÀÌ¸§, Á÷±ÞÀ»­t·ÂÇÏ¿©¶ó. 
--´Ü, Áöµµ±³¼ö°¡¹èÁ¤µÇÁö¾ÊÀºÇÐ»ýÀÌ¸§µµÇÔ²²­t·ÂÇÏ¿©¶ó.

SELECT 
    s.name, grade, p.name AS "Áöµµ±³¼ö", position
FROM
    student s
LEFT JOIN
    professor p USING(profno)
ORDER BY 2, 1;


--(+)»ç¿ë >> ¼±»ý´Ô ºñÃß
SELECT 
    s.name, grade, p.name AS "Áöµµ±³¼ö", position
FROM
    student s, professor p
WHERE
    s.profno = p.profno(+)
UNION ALL
SELECT 
    s.name, grade, p.name AS "Áöµµ±³¼ö", position
FROM
    student s, professor p
WHERE
    s.profno(+) = p.profno
ORDER BY 2, 1;

SELECT
    s.profno, p.profno, s.deptno, p.deptno
FROM student s, professor p;


--ºÎ¼­Å×ÀÌºí¿¡¼­SELF JOINÀ»ÀÌ¿ëÇÏ¿©ºÎ¼­ÀÌ¸§°ú»óÀ§ºÎ¼­ÀÇÀÌ¸§À»­t·ÂÇÏ¿©¶ó.
SELECT * FROM department d1, department d2;

SELECT 
    d1.dname || 'ÀÇ »óÀ§ÇÐ°ú´Â' || NVL2(d2.dname, d2.dname || 'ÀÔ´Ï´Ù', '¾ø½À´Ï´Ù') AS RESULT
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
        name = 'ÀüÀºÁö'
);



