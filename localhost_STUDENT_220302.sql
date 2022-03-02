--ºÎ¼­Å×ÀÌºíÀÇºÎ¼­ÀÌ¸§Ä®·³¿¡¼­?°ú?±ÛÀÚÀÇÀ§Ä¡¸¦­t·ÂÇÏ¿©¶ó
SELECT * FROM department;
SELECT
    dname, INSTR(dname, '°ú') AS "°ú"
FROM
    department;

--±³¼öÅ×ÀÌºí¿¡¼­Á÷±ÞÄ®·³ÀÇ¿ÞÂÊ¿¡?*?’KÀÚ¸¦»ðÀÔÇÏ¿©10¹ÙÀÌÆ®·Î­t·ÂÇÏ°í
--±³¼ö¾ÆÀÌ´ÙÄ®·³Àº¿À¸¥ÂÊ¿¡?+?’KÀÚ¸¦»ðÀÔÇÏ¿©12¹ÙÀÌÆ®·Î­t·ÂÇÏ¿©¶ó

SELECT
    position, LPAD(position, 10, '*') AS "*¹®ÀÚ",
    userid, RPAD(userid, 12, '+') AS "+¹®ÀÚ"
FROM 
    professor;
    
-- ÇÐ»ý Å×ÀÌºí¿¡¼­ ÇÐ»ý IDÀÇ µÞÀÚ¸® µÎ±ÛÀÚ¸¦ *·Î º¯°æ ÀüÈ­¹øÈ£ µÞ¼¼ÀÚ¸®¸¦ *·Î º¯°æ
--INSTR, SUBSTR, LENGTH ¸¹ÀÌ»ç¿ë
SELECT
    userid
    , RPAD(SUBSTR(userid, 0 , LENGTH(userid)-2), 12, '*') AS "**"
    ,tel
    ,SUBSTR(tel, 0, LENGTH(tel)-3) || '***' AS "***"
FROM
    student;
    
--±³¼öÅ×ÀÌºí¿¡¼­101ÇÐ°ú±³¼öÀÇÀÏ±ÞÀ»°è»ê(¿ù±Ù¹«ÀÏÀº22ÀÏ)ÇÏ¿©
--¼Ò¼öÁ¡«QÂ°ÀÚ¸®¿Í¼ÂÂ°ÀÚ¸®¿¡¼­¹Ý¿Ã¸²À™°ª°ú¼Ò¼ýÁ¡¿ÞÂÊ«QÂ°ÀÚ¸®¿¡¼­¹Ý¿Ã¸²À™°ªÀ»­t·ÂÇÏ¿©¶ó

SELECT * FROM professor;
SELECT
    deptno, sal
    , ROUND(sal/22, -1) AS "ROUND-1"
    , ROUND(sal/22) AS "ROUND"
    , ROUND(sal/22, 1) AS "ROUND1"
    , ROUND(sal/22, 2) AS "ROUND2"
FROM
    professor
WHERE 
    deptno = 101;
    
--±³¼öÅ×ÀÌºí¿¡¼­101ÇÐ°ú±³¼öÀÇÀÏ±ÞÀ»°è»ê(¿ù±Ù¹«ÀÏÀº22ÀÏ)ÇÏ¿©
--¼Ò¼öÁ¡«QÂ°ÀÚ¸®¿Í¼ÂÂ°ÀÚ¸®¿¡¼­ ‡»èÀ™°ª°ú¼Ò¼ýÁ¡¿ÞÂÊ«QÂ°ÀÚ¸®¿¡¼­ ‡»èÀ™°ªÀ»­t·ÂÇÏ¿©¶ó
SELECT
    deptno, sal
    , TRUNC(sal/22, -1) AS "TRUNC-1"
    , TRUNC(sal/22) AS "TRUNC"
    , TRUNC(sal/22, 1) AS "TRUNC1"
    , TRUNC(sal/22, 2) AS "TRUNC2"
FROM
    professor
WHERE 
    deptno = 101;
    
--?±³¼öÅ×ÀÌºí¿¡¼­101¹øÇÐ°ú±³¼öÀÇ±Þ¿©¸¦º¸Á÷¼ö´çÀ¸·Î³ª´«³ª¸ÓÁö¸¦°è»êÇÏ¿©­t·ÂÇÏ¿©¶ó
SELECT
    deptno, sal, comm
    , MOD(sal, comm) AS "TRUNC-1"
FROM
    professor
WHERE 
    deptno = 101;
    
--³¯Â¥
SELECT 
    TO_DATE('2022', 'YYYY') + 2022
FROM 
    DUAL;
    
--?±³¼ö¹øÈ£°¡9908ÀÎ±³¼öÀÇÀÔ»çÀÏÀ»±âÁØÀ¸·ÎÀÔ»ç30ÀÏÈÄ¿Í60ÀÏÈÄÀÇ³¯Â¥¸¦­t·ÂÇÏ¿©¶ó
DESC professor; 
--µ¥ÀÌÅÍÅ¸ÀÔÈ®ÀÎ

SELECT
    profno, name
    , hiredate
    , hiredate + 30
    , hiredate + 60
FROM
    professor
WHERE
    profno = 9908;
    
--ÀÔ»çÀ™Áö 330°³¿ù¹Ì¢ÀÎ±³¼öÀÇ
--±³¼ö¹øÈ£, ÀÔ»çÀÏ, ÀÔ»çÀÏ·ÎºÎÅÍÂnÀçÀÏ±îÁöÀÇ°³¿ù¼ö, ÀÔ»çÀÏ¿¡¼­6°³¿ùÈÄÀÇ³¯Â¥¸¦­t·ÂÇÏ¿©¶ó
--ÀÔ»çÀÏ +17³â
DESC professor;
SELECT 
    name
    , profno
    , sysdate AS "ÇöÀç³¯Â¥"
    , hiredate AS "ÀÔ»çÀÏ"
    , ADD_MONTHS(hiredate, 17*12) AS "ÀÔ»çÀÏ+17y"
    , ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)) AS "~°³¿ù"
    , ADD_MONTHS(hiredate, 6) AS "~6°³¿ù"
FROM
    professor
WHERE
    ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)) < 330
ORDER BY 4;
    
--¿À´ÃÀÌ¼ÓÀ™´ÞÀÇ¸¶Áö¸·³¯Â¥¿Í´Ù°¡¿À´ÂÀÏ¿äÀÏÀÇ³¯Â¥¸¦­t·ÂÇÏ¿©¶ó
SELECT 
    sysdate,
    LAST_DAY(sysdate) AS "3¿ù ¸·³¯",
    NEXT_DAY(sysdate, 1) AS "´Ù°¡¿À´ÂÀÏ¿äÀÏ",
    NEXT_DAY(sysdate+3, 4) AS "3/6ÀÌÈÄ ¼ö¿äÀÏ"
FROM
    DUAL;
    
--½ÃAÁ¤º¸¸¦»ý·«À™°æ¿ì, ROUND ÇÔ¼ö¿ÍTRUNC ÇÔ¼öÀÇ°á°ú¸¦ºñ±³À™¿¹ÀÌ´Ù
SELECT 
    SYSDATE,
    TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') AS NOW
    ,TO_CHAR(TRUNC(SYSDATE), 'YY/MM/DD HH24:MI:SS') AS TRUNC
    ,TO_CHAR(ROUND(SYSDATE), 'YY/MM/DD HH24:MI:SS') AS ROUND
FROM 
    DUAL;
    
--101¹øÇÐ°ú±³¼öµéÀÇÀÔ»çÀÏÀ»ÀÏ, ¿ù, ³âÀ»±âÁØÀ¸·Î¹Ý¿Ã¸²ÇÏ¿©­t·ÂÇÏ¿©¶ó.
SELECT
    profno, name, hiredate
    , TO_CHAR(HIREDATE, 'YYYY/MM/DD HH24:Mi:SS') AS R1
    , TO_CHAR(ROUND(HIREDATE, 'HH24'), 'YYYY/MM/DD HH24:Mi:SS') AS R2
    , TO_CHAR(ROUND(HIREDATE, 'DD'), 'YYYY/MM/DD HH24:Mi:SS') AS R3
    , TO_CHAR(ROUND(HIREDATE, 'MM'), 'YYYY/MM/DD HH24:Mi:SS') AS R4
FROM 
    professor
WHERE 
    deptno = 101;
    
    
SELECT '22-02-02' - 1 FROM DUAL;

INSERT INTO STUDENT(name, birthdate) VALUES ('½Å»ý¾Æ', SYSDATE);
INSERT INTO STUDENT(name, birthdate) VALUES ('½Å»ý¾Æ', '22/02/02');

SELECT * FROM STUDENT;

SELECT SUBSTR(BIRTHDATE, 1, 2) FROM STUDENT;


--TO_CHAR

--?ÇÐ»ýÅ×ÀÌºí¿¡¼­ †ÀÎÇÏÇÐ»ýÀÇÇÐ¹ø°ú»ý³â¿ùÀÏÁß¿¡¼­³â¿ù¢­t·ÂÇÏ¿©¶ó
SELECT
    studno, name, TO_CHAR(birthdate, 'YYYY/MM')
FROM 
    student
WHERE
    studno = 10101;
    
--ÇÐ»ýÅ×ÀÌºí¿¡¼­102¹øÇÐ°úÇÐ»ýÀÇÀÌ¸§, ÇÐ³â, »ý³â¿ùÀÏÀ»­t·ÂÇÏ¿©¶ó
SELECT
    name, grade, birthdate,
    TO_CHAR(birthdate, 'DAY MON DD YYYY A.M. "TEXT¾µ¼öÀÖ´Ù"')
FROM
    student
WHERE
    deptno = 102;
    
--±³¼öÅ×ÀÌºí¿¡¼­101¹øÇÐ°ú±³¼öµéÀÇÀÌ¸§, Á÷±Þ, ÀÔ»çÀÏÀ»­t·ÂÇÏ¿©¶ó
SELECT
    deptno, name, position, hiredate
    , TO_CHAR(hiredate, 'Mon, "the" DDTH "of" YYYY DDSPTH')
FROM
    professor
WHERE
    deptno = 101;
    
    
--º¸Á÷¼ö´çÀ»¹Þ´Â±³¼öµéÀÇÀÌ¸§, ±Þ¿©, º¸Á÷¼ö´ç, 
--±×¸®°í±Þ¿©¿Íº¸Á÷¼ö´çÀ»´õÀ™°ª¿¡12¸¦°öÀ™°á°ú¸¦¿¬ºÀÀ¸·Î­t·ÂÇÏ¿©¶ó.
SELECT 
    name, sal, comm 
    , TO_CHAR((sal + comm) * 12, '9,999') AS "ANNUAL"
FROM
    professor
WHERE 
    comm IS NOT NULL;
    
--½Ç ¼ýÀÚº¸´Ù Ä¿¾ßÇÔ¾²
SELECT TO_NUMBER('1,234,567,890', '9,999,999,999') + 1 FROM DUAL;

--ÁÖ¹Îµî·Ï¹øÈ£¿¡¼­»ý³â¿ùÀÏÀ»Ãß­tÇÏ¿©?YY/MM/DD?ÇüÅÂ·Î­t·ÂÇÏ¿©¶ó.
SELECT
    name, idnum
    ,SUBSTR(idnum, 1, 6) AS "TRIM"
    ,TO_DATE(SUBSTR(idnum, 1, 6), 'YYMMDD') AS "BIRTHDATE"
    ,TO_CHAR(TO_DATE(SUBSTR(idnum, 1, 6), 'YY/MM/DD')) AS "BIRTHDATE1"
FROM
    student
WHERE
    idnum IS NOT NULL
ORDER BY 2;


--NVL(P1, P2) : P! NULLÀÇ °¡´É¼ºÀÌ ÀÖ´Â °ª P2 : NULL ÀÏ °æ¿ì ´ëÃ¼°ª
-- 201¹øÇÐ°ú±³¼öÀÇÀÌ¸§, Á÷±Þ, ±Þ¿©, º¸Á÷¼ö´ç, ±Þ¿©¿Íº¸Á÷¼ö´çÀÇÇÕ°è¸¦­t·ÂÇÏ¿©¶ó.
--´Ü, º¸Á÷¼ö´çÀÌNULLÀÎ°æ¿ì¿¡´Âº¸Á÷¼ö´çÀ»0À¸·Î°è»êÀ™´Ù.
SELECT 
    name, position, 
    sal, comm, 
    sal+comm AS "ÇÕ°è",
    sal+NVL(comm, 0) AS "º¸Á÷ 0",
    NVL(sal+comm, sal) AS "´ëÃ¼°ª"
FROM
    professor
WHERE 
    deptno = 201;
    
SELECT
    name, position,
    sal, comm,
    NVL2(comm, sal+comm, SAL) AS "NVL2 total"
FROM 
    professor
WHERE
    deptno = 201;
    
    
--COALESCE
SELECT 
    COALESCE(NULL, 1, 2),
    NVL(NVL(NULL,1),2)
FROM DUAL;


--±³¼öÅ×ÀÌºí¿¡¼­±³¼öÀÇ¼Ò¼ÓÇÐ°ú¹øÈ£¸¦ÇÐ°úÀÌ¸§À¸·Îº¯ÃQÇÏ¿©­t·ÂÇÏ¿©¶ó. 
--ÇÐ°ú¹øÈ£°¡101ÀÌ¸é?ÄÄÇ»ÅÍ°øÇÐ°ú?, 102ÀÌ¸é?¸ÖÆ¼¹Ìµð¾îÇÐ°ú?, 201ÀÌ¸é? †ÀÚ°øÇÐ°ú?, 
--³ª¸ÓÁöÇÐ°ú¹øÈ£´Â?±â°è°øÇÐ°ú?(default)·Îº¯ÃQÀ™´Ù.

SELECT
    deptno, dname
FROM
    department;
    
SELECT 
    profno
    , deptno
    , DECODE(deptno ,
        101,'ÄÄÇ»ÅÍ°øÇÐ°ú',
        102,'¸ÖÆ¼¹Ìµð¾îÇÐ°ú',
        201,'ÀüÀÚ°øÇÐ°ú',
        '±â°è°øÇÐ°ú') AS "DECODE"
FROM
    professor;

DESC department;

-- ÇÐ»ýµéÀÌ ÅÂ¾î³­ ´Þ¿¡ µû¶ó °èÀý Ãâ·Â
SELECT
    name, birthdate
    , SUBSTR(birthdate, 4,2) AS "Àß¶ó³»±â"
    , TO_CHAR(birthdate, 'MM') AS "Àß¶ó³»±â1"
    , DECODE(SUBSTR(birthdate, 4,2),
        01, '°Ü¿ï',
        02, '°Ü¿ï',
        03, 'º½',
        04, 'º½',
        05, 'º½',
        06, '¿©¸§',
        07, '¿©¸§',
        08, '¿©¸§',
        09, '°¡À»',
        10, '°¡À»',
        11, '°¡À»',
        12, '°Ü¿ï') AS "°èÀý"
FROM
    student;
    
SELECT
    name, birthdate
    , TO_CHAR(birthdate, 'MM') AS "Àß¶ó³»±â1"
    , TRUNC(TO_CHAR(birthdate, 'MM') / 3) AS "Àß¶ó³»±â"
    , DECODE(TRUNC(TO_CHAR(birthdate, 'MM') /3),
        1, 'º½',
        2, '¿©¸§',
        3, '°¡À»',
        '°Ü¿ï') AS "season" 
FROM
    student;
    
    