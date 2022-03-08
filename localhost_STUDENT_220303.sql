--±³¼öÅ×ÀÌºí¿¡¼­¼Ò¼ÓÇÐ°ú¿¡µû¶óº¸³Ê½º¸¦´Ù¸£°Ô°è»êÇÏ¿©­t·ÂÇÏ¿©¶ó. ÇÐ°ú¹øÈ£º°·Îº¸³Ê½º´Â´ÙÀ½°ú°°ÀÌ°è»êÀ™´Ù.
--ÇÐ°ú¹øÈ£°¡101ÀÌ¸éº¸³Ê½º´Â±Þ¿©ÀÇ10%, 102ÀÌ¸é20%, 201ÀÌ¸é30%, ³ª¸ÓÁöÇÐ°ú´Â0%ÀÌ´Ù.

SELECT 
    name, sal, deptno,
    DECODE(deptno,
        101, sal * 0.1,
        102, sal * 0.1,
        103, sal * 0.1,
        0 ) BONUS, --ÀÌ·±°æ¿ì´Â DECODE°¡ ´õ ³ªÀ»¼öµµ
    CASE deptno
        WHEN 101 THEN sal * 0.1
        WHEN 102 THEN sal * 0.1
        WHEN 103 THEN sal * 0.1
        ELSE 0
    END BONUS1
FROM
    professor;
    


SELECT
    studno, name, birthdate, TO_CHAR(birthdate, 'MM') AS "´Þ",
    CASE
        WHEN TO_CHAR(birthdate, 'MM') IN (3,4,5) THEN 'º½'
        WHEN TO_CHAR(birthdate, 'MM') BETWEEN 6 AND 8 THEN '¿©¸§'
        WHEN TO_CHAR(birthdate, 'MM') BETWEEN 9 AND 11 THEN '°¡À»'
        ELSE '°Ü¿ï'
    END AS "seasons"
    
FROM
    student;
    
    

--¼­ºêÄõ¸®
SELECT  
    studno,
    name,
    CASE
        WHEN M IN (3,4,5) THEN 'º½'
        WHEN M BETWEEN 6 AND 8 THEN '¿©¸§'
        WHEN M BETWEEN 9 AND 11 THEN '°¡À»'
        ELSE '°Ü¿ï'
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
    
    
--101¹øÇÐ°ú±³¼öÁß¿¡¼­º¸Á÷¼ö´çÀ»¹Þ´Â±³¼öÀÇ¼ö¸¦­t·ÂÇÏ¿©¶ó.
SELECT
    COUNT(comm)
FROM
    professor
WHERE 
    deptno = 101;
    
--?101¹øÇÐ°úÇÐ»ýµéÀÇ¸ö¹«°ÔÆò±Õ°úÇÕ°è¸¦­t·ÂÇÏ¿©¶ó.
SELECT
    SUM(WEIGHT), AVG(WEIGHT)
FROM
    student
WHERE 
    deptno = 101;
    
--102¹øÇÐ°úÇÐ»ýÁß¿¡¼­ÃÖ´ëÅ°¿ÍÃÖ¼ÒÅ°¸¦­t·ÂÇÏ¿©¶ó.
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


--±³¼öÅ×ÀÌºí¿¡¼­ÇÐ°úº°·Î±³¼ö¼ö¿Íº¸Á÷¼ö´çÀ»¹Þ´Â±³¼ö¼ö¸¦­t·ÂÇÏ¿©¶ó
SELECT
    deptno, COUNT(*), COUNT(COMM)
FROM
    professor
GROUP BY 
    deptno
ORDER BY 1;


--ÇÐ°úº°·Î¼Ò¼Ó±³¼öµéÀÇÆò±Õ±Þ¿©, ÃÖ¼Ò±Þ¿©, ÃÖ´ë±Þ¿©¸¦­t·ÂÇÏ¿©¶ó.
SELECT
   deptno, AVG(SAL), MIN(SAL), MAX(SAL)
FROM
    professor
GROUP BY 
    deptno;

--Ç×»ó ±×·ì¹ÙÀÌ´Â °á°ú¸¦ °ËÅäÇØ¾ßÇÑ´Ù
SELECT 
    deptno, sal
FROM
    professor
ORDER BY 1  ;



-- †Ã¼ÇÐ»ýÀ»¼Ò¼ÓÇÐ°úº°·Î³ª´©°í, °°ÀºÇÐ°úÇÐ»ýÀº´Ù½ÃÇÐ³âº°·Î±×·ìÇÎÇÏ¿©, ÇÐ°ú¿ÍÇÐ³âº°ÀÎ¿ø¼ö, Æò±Õ¸ö¹«°Ô¸¦­t·ÂÇÏ¿©¶ó, 
--´Ü, Æò±Õ¸ö¹«°Ô´Â¼Ò¼öÁ¡ÀÌÇÏ«Q¹øÂ°ÀÚ¸®¿¡¼­¹Ý¿Ã¸²À™´Ù.

SELECT
    deptno, grade, COUNT(*), ROUND(AVG(WEIGHT))
FROM 
    STUDENT
WHERE 
    deptno IS NOT NULL
GROUP BY
    deptno, grade
ORDER BY 1, 2;


--¼Ò¼ÓÇÐ°úº°·Î±³¼ö±Þ¿©ÇÕ°è¿Í¸ðµçÇÐ°ú±³¼öµéÀÇ±Þ¿©ÇÕ°è¸¦­t·ÂÇÏ¿©¶ó
SELECT
    deptno, sum(sal)
FROM
    professor
GROUP BY
    ROLLUP(deptno);
    
--ROLLUP ¿¬»êÀÚ¸¦ÀÌ¿ëÇÏ¿©ÇÐ°ú¹×Á÷±Þº°±³¼ö¼ö, ÇÐ°úº°±³¼ö¼ö,  †Ã¼±³¼ö¼ö¸¦­t·ÂÇÏ¿©¶ó.
SELECT
    deptno, position, count(*), GROUPING(deptno), GROUPING(position)
FROM
    professor
GROUP BY
    ROLLUP(deptno, position);
--    CUBE(deptno, position);



--ÇÐ°ú³»¿¡¼­ÇÐ³âº°ÀÎ¿ø¼ö¿ÍÅÂ¾î³­³âµµº°ÀÎ¿ø¼ö¸¦­t·ÂÇÏ¿©¶ó.
SELECT
    deptno, grade, TO_CHAR(birthdate, 'YY') AS YY, count(*)
FROM
    student
GROUP BY
    GROUPING SETS((deptno, grade), (deptno, TO_CHAR(birthdate, 'YY')));
    
    
    
--ÇÐ»ý¼ö°¡4¸íÀÌ»óÀÎÇÐ³â¿¡´ëÇØ¼­ÇÐ³â, ÇÐ»ý¼ö, Æò±ÕÅ°, Æò±Õ¸ö¹«°Ô¸¦­t·ÂÇÏ¿©¶ó.
-- ´Ü, Æò±ÕÅ°¿ÍÆò±Õ¸ö¹«°Ô´Â¼Ò¼öÁ¡«Q¹øÂ°ÀÚ¸®¿¡¼­¹Ý¿Ã¸²ÇÏ°í, ­t·Â¼ø¼­´ÂÆò±ÕÅ°°¡³ôÀº¼øºÎÅÍ³»¸²Â÷¼øÀ¸·Î­t·ÂÇÏ¿©¶ó
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
    
    
--ÇÐ°úº° ÇÐ»ýÀÇ Æò±Õ ¸ö¹«°Ô
SELECT 
    deptno, AVG(weight)
FROM 
    student
WHERE 
    deptno IS NOT NULL
GROUP BY 
    deptno
ORDER BY 1;

--ÇÐ°úº° ÇÐ»ýÀÇ Æò±Õ ¸ö¹«°ÔÁß ÃÖ´ë Æò±Õ ¸ö¹«°Ô
SELECT 
    deptno, MAX(AVG(weight))
FROM 
    student
WHERE 
    deptno IS NOT NULL
GROUP BY 
    deptno
ORDER BY 1;


    
--ÇÐ°úº° ÇÐ»ýÀÇ Æò±Õ ¸ö¹«°ÔÁß ÃÖ´ë Æò±Õ ¸ö¹«°Ô
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



--Á¶ÀÎÀ» ÀÌ¿ëÇÑ ÇÐ»ýÀÌ¸§°ú ÇÐ°úÀÌ¸§ °Ë»ö
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
    
    
--?? †ÀÎÇÏ?ÇÐ»ýÀÇÇÐ¹ø, ÀÌ¸§, ÇÐ°úÀÌ¸§±×¸®°íÇÐ°úÀ§Ä¡¸¦­t·ÂÇÏ¿©¶ó.
SELECT
    studno, name, dname, loc
FROM
    student S, department D
WHERE
    name = 'ÀüÀÎÇÏ'
AND
    S.deptno = D.deptno;
    
    
SELECT
    studno, name, dname, loc
FROM
    student
NATURAL JOIN 
    department
WHERE
    name = 'ÀüÀÎÇÏ';
        
        
-- ÇÐ¹ø, ÇÐ»ýÀÌ¸§, ±³¼ö¹øÈ£, ´ã´ç±³¼öÀÌ¸§
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
    
    
