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
    
--// 10101 ÀüÀÎÇÏ ÇÐ»ýÀÇ Áöµµ±³¼ö Ã£±â
SELECT * 
FROM professor 
WHERE 
    profno = 9903;

SELECT * FROM student;
--¾ÆÁ÷ ÁöÁ¤±³¼ö ¾ø´Â»óÅÂ
SELECT * FROM professor WHERE profno = null;

-- '' ºó¹®ÀÚ¿­ ==> ±æÀÌ°¡ 0 ÀÌ¸é null·Î Ã³¸®
-- = null

--ÇöÀç½Ã°£Á¤º¸¿¡ ½ºÄ®¶óÇÔ¼ö
SELECT 
    SYSDATE, 
    TO_CHAR(SYSDATE, 'MM/DD') MD,  --ÇÔ¼ö. ÀÎµ¥ µÎ °³ÀÇ °ª(SYSDATE, MMDD ³Ö¾ú´Âµ¥ ÇÏ³ª¸¸ ¹ÝÈ¯)
    TO_CHAR(NULL, 'MM/DD') NV, --nullÀÌ ÀÎÀÚ·Î µé¾î°¡¼­ null°ª ¹ÝÈ¯
    TO_CHAR(SYSDATE, NULL) NV2
FROM 
    DUAL;


--ÇÕÁýÇÕ¿¬»ê    
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

-- divisor is equal to zero ¿À·ù¹ß»ý
SELECT
    2 / 0
FROM 
    DUAL;
    
    
--±³¼ö Å×ÀÌºí¿¡¼­ ÀÌ¸§, Á÷±Þ,  º¸Á÷¼ö´ç Ãâ·Â
SELECT * FROM PROFESSOR;
SELECT
    name, position, sal
FROM
    professor;

-- ±³¼öÅ×ÀÌºí¿¡¼­ º¸Á÷¼ö´çÀ» ¹Þ´Â ±³¼öÀÇ ÀÌ¸§, Á÷±Þ, º¸Á÷¼ö´ç Ãâ·Â
SELECT
    name, position, comm
FROM
    professor
WHERE 
    COMM IS NOT NULL;


-- ±³¼öÅ×ÀÌºí¿¡¼­ º¸Á÷¼ö´çÀ» ¹ÞÁö¾Ê´Â ±³¼öÀÇ ÀÌ¸§, Á÷±Þ, º¸Á÷¼ö´ç Ãâ·Â
SELECT
    name, position, comm
FROM
    professor
WHERE 
    COMM IS NULL;
    
--±³¼öÅ×ÀÌºí¿¡¼­ ±Þ¿©¿¡ º¸Á÷¼ö´çÀ» ´õÇÑ°ªÀ» sal_comÀÌ¶ó´Â º°¸íÀ¸·Î Ãâ·Â
SELECT * FROM professor;
SELECT  
    name, sal, comm, sal+comm AS sal_com
FROM 
    professor
WHERE
    sal+comm IS NOT NULL;
    
--102¹ø ÇÐ°úÀÇ ÇÐ»ýÁß 1 ¶É´Â 4ÇÐ³â ÇÐ»ýÀÇ ÀÌ¸§ ÇÐ³â ÇÐ°ú¹øÈ£ Ãâ·Â
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

--102¹ø ÇÐ°úÀÇ ÇÐ»ý Áß¿¡¼­ 4ÇÐ³â ÇÐ»ýÀÌ°Å³ª ¼Ò¼ÓÇÐ°ú¿¡ »ó°ü¾øÀÌ 1ÇÐ³â ÇÐ»ýÀÇ ÀÌ¸§, ÇÐ³â, ÇÐ°ú ¹øÈ£¸¦ ­t·ÂÇÏ¿©¶ó
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
    
--? 1ÇÐ³â ÀÌ¸é¼­ ¸ö¹«°Ô°¡ 70kg ÀÌ»óÀÎ ÇÐ»ýÀÇ ÁýÇÕ(stud_heavy)°ú 1ÇÐ³â ÀÌ¸é¼­ 101¹ø ÇÐ°ú¿¡ ¼Ò¼ÓµÈ ÇÐ»ý(stud_101)À¸·Î ±¸¼ºµÈ µÎ °³ÀÇ Å×ÀÌºí »ý¼º
--ÁúÀÇ¹®ºÎÅÍ Ã³¸®

CREATE TABLE STUD_HEAVY AS --Å×ÀÌºí »ý¼º
SELECT * FROM STUDENT WHERE GRADE = 1 AND WEIGHT >= 70;

CREATE TABLE STUD_101 AS --Å×ÀÌºí »ý¼º
SELECT * FROM STUDENT WHERE GRADE = 1 AND deptno = 101;

SELECT * FROM STUD_HEAVY;
SELECT * FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
UNION --ÇÕÁýÇÕ
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
UNION ALL --Áßº¹ÇÕÁýÇÕ
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
INTERSECT --±³ÁýÇÕ
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
MINUS --Â÷ÁýÇÕ
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;


/*
1 2 3 
4 5 6
7 8 9
¸¸µé±â*/
--¾ß¸Å
SELECT 1,2,3 FROM DUAL
UNION
SELECT 4,5,6 FROM DUAL
UNION 
SELECT 7,8,9 FROM DUAL;

--¼±»ý´ÔÀÌ ¿øÇÏ´ø ´ä
SELECT 
    (rownum-1)*3+1 N1, (rownum-1)*3+2 N2, (rownum-1)*3+3 N3
FROM
    student
WHERE
    rownum <= 3;

-- ´Þ·Â¸¸µå´Âµ¥ ¾µ°Å
SELECT
    *
FROM
    ALL_OBJECTS;
    


--ÇÐ»ý Å×ÀÌºí¿¡¼­ ÀÌ¸§À» °¡³ª´Ù¼øÀ¸·Î Á¤Ž¶ÇÏ¿© ÀÌ¸§, ÇÐ³â,  †È­¹øÈ£¸¦ ­t·ÂÇÏ¿©¶ó
SELECT 
    name, grade, tel 
FROM 
    student 
WHERE 
    tel IS NOT NULL
ORDER BY 1;

--ÇÐ³â ³»¸²Â÷¼ø
SELECT 
    name, grade, tel 
FROM 
    student 
WHERE 
    tel IS NOT NULL
ORDER BY 2 DESC;

--ÇÐ³â, ÀÌ¸§ ³»¸²Â÷¼ø
SELECT 
    name, grade, tel 
FROM 
    student 
WHERE 
    tel IS NOT NULL
ORDER BY 2 DESC, 1 DESC;
    
    
--ÇÐ»ý Å×ÀÌºí¿¡¼­ ÇÐ¹ø, ÀÌ¸§, Åº»ý³âµµ Á¶È¸
SELECT
    studno, name, birthdate, TO_CHAR(birthdate, 'YYYY') AS YY
FROM   
    student;
    
--ÇÐ»ý Å×ÀÌºí¿¡¼­ Æò±ÕÅ° Æò±Õ¸ö¹«°Ô Á¶È¸
SELECT 
    MIN(studno), AVG(height) AS "Æò±Õ Å°" , avg(weight) AS "Æò±Õ ¸ö¹«°Ô"
FROM
    student;
    
    
--ÇÐ»ý Å×ÀÌºí¿¡¼­ ?±è¿µ±Õ? ÇÐ»ýÀÇ ÀÌ¸§, »ç¿ëÀÚ ¾ÆÀÌµð¸¦ ­t·ÂÇÏ¿©¶ó. ±×¸®°í »ç¿ëÀÚ ¾ÆÀÌµðÀÇ «Q ’KÀÚ¸¦ ´ë’KÀÚ·Î º¯ÃQÇÏ¿© ­t·ÂÇÏ¿©¶ó
SELECT
    name, INITCAP(userid), LOWER(userid), UPPER(userid)
FROM
    student
WHERE
    name = '±è¿µ±Õ';

--ºÎ¼­ Å×ÀÌºí¿¡¼­ ºÎ¼­ ÀÌ¸§ÀÇ ±æÀÌ¸¦ ’KÀÚ ¼ö¿Í ¹ÙÀÌÆ® ¼ö·Î °¢°¢ ­t·ÂÇÏ¿©¶ó
SELECT
    dname, LENGTH(dname),LENGTHB(dname)
FROM
    department;
    
--ÇÐ»ý Å×ÀÌºí¿¡¼­ 1ÇÐ³â ÇÐ»ýÀÇ ÁÖ¹Îµî·Ï ¹øÈ£¿¡¼­ »ý³â¿ùÀÏ°ú ÅÂ¾î³­ ´ÞÀ» Ãß­tÇÏ¿© ÀÌ¸§, ÁÖ¹Î¹øÈ£, »ý³â¿ùÀÏ, ÅÂ¾î³­ ´ÞÀ» ­t·ÂÇÏ¿©¶ó.
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




    