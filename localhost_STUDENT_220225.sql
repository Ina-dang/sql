SELECT * FROM tab;

SELECT * FROM STUDENT;

SELECT DISTINCT deptno, name
FROM student
ORDER BY 1 DESC;

SELECT 'Hello world' AS "HI" FROM DUAL;

SELECT * FROM ex_type;

--ÇĞ»ı Å×ÀÌºí¿¡¼­ 1ÇĞ³â ÇĞ»ı¸¸ °Ë»ö, ÇĞ¹ø, ÀÌ¸§, ÇĞ°ú¹øÈ£ Ãâ·Â
SELECT * FROM student;
SELECT grade, studno, name, deptno FROM student ORDER BY 1;

SELECT 
    studno, name, deptno 
FROM 
    student 
WHERE
--    grade = 1; --±×·¹ÀÌµå°¡ ¹®ÀÚ¿­ÀÌ¹Ç·Î
--    TO_NUMBER(grade) = 1; >> ½ÇÁ¦·Î´Â ÀÌ·¸°Ô ÀÚµ¿Çüº¯È¯ÇØ¼­ ¿¬»ê
    grade = '1'; --ÀÌ°Ô °¡Àå È¿À²Àû
    
DESC STUDENT; --±×·¹ÀÌµå À¯Çüº¸´Â¹ı

--ÇĞ»ı Å×ÀÌºí¿¡¼­ ¸ö¹«°Ô 70kg ÀÌÇÏÀÎ ÇĞ»ı¸¸ °Ë»öÇÏ¿© ÀÌ¸§ ÇĞ³â ÇĞ°ú¹øÈ£ ¸ö¹«°Ô Ãâ·Â
SELECT * FROM student;
SELECT studno, name, grade, deptno, weight 
FROM student 
WHERE weight <= 70 ;

--ÇĞ»ı Å×ÀÌºí¿¡¼­ 1ÇĞ³âÀÌ¸é¼­ ¸ö¹«°Ô 70kg ÀÌ»óÀÎ ÇĞ»ı¸¸ °Ë»öÇÏ¿© ÀÌ¸§ ÇĞ³â ÇĞ°ú¹øÈ£ ¸ö¹«°Ô Ãâ·Â
SELECT * FROM student;

SELECT 
    studno, name, grade, deptno, weight 
FROM 
    student 
WHERE 
    grade = 1
AND
    weight >= 70 ;
    
--ÇĞ»ı Å×ÀÌºí¿¡¼­ 1ÇĞ³âÀÌ°Å³ª ¸ö¹«°Ô°¡ 70kg ÀÌ»óÀÎ ÇĞ»ı¢ °Ë»öÇÏ¿© ÀÌ¸§, ÇĞ³â, ¸ö¹«°Ô, ÇĞ°ú¹øÈ£¸¦ ­t·ÂÇÏ¿©¶ó
SELECT 
    studno, name, grade, deptno, weight 
FROM 
    student 
WHERE 
    grade = 1
OR
    weight >= 70 ;
    
--BETWEEN ¿¬»êÀÚ¸¦ »ç¿ëÇÏ¿© ¸ö¹«°Ô°¡ 50kg¿¡¼­ 70kg »çÀÌÀÎ ÇĞ»ıÀÇ ÇĞ¹ø, ÀÌ¸§, ¸ö¹«°Ô¸¦ ­t·ÂÇÏ¿©¶ó
SELECT
    studno, name, weight
FROM
    student
WHERE 
--    weight 
    -- ´Ü¼ø¿¬»êÀÚÀÏ¶§´Â ¾Øµå¿¬»êÀÚ°¡ ´õ ÂªÀºµ¥ ¼ö½ÄÀÌ µé¾î°¡¸é ºñÆ®À©ÀÌ ÈÎ¾À È¿À²Àû
    weight * 2.2
    -- ´çÀå pound·Î¸¸ ¹Ù²ãµµ ±×·¸´Ù
BETWEEN 
    50 AND 70;
    
--ÇĞ»ıÅ×ÀÌºí¿¡¼­ 81³â¿¡¼­ 83³âµµ¿¡ ÅÂ¾î³­ ÇĞ»ıÀÇ ÀÌ¸§°ú »ı³â¿ùÀÏÀ» Ãâ·ÂÇØ¶ó
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


--ANDÅ¸ÀÔÀ¸·Î ÇÏ´Â¹ı
SELECT 
    name, birthdate 
FROM 
    student
WHERE 
    TO_CHAR(birthdate, 'YY') >= 81
AND 
    TO_CHAR(birthdate, 'YY') <= 83;
    
--INÅ¸ÀÔÀ¸·Î ÇÏ´Â ¹ı
SELECT 
    name, birthdate 
FROM 
    student
WHERE 
    TO_CHAR(birthdate, 'YY') 
IN 
    (81, 82, 83);

--IN ¿¬»êÀÚ¸¦ »ç¿ëÇÏ¿© 102¹ø ÇĞ°ú¿Í 201¹ø ÇĞ°ú ÇĞ»ıÀÇ ÀÌ¸§, ÇĞ³â, ÇĞ°ú¹øÈ£¸¦ ­t·ÂÇÏ¿©¶ó
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


--or ¿¬»êÀÚ·Î
SELECT 
    name, grade, deptno 
FROM 
    student
WHERE 
    deptno = 102 OR deptno = 201;
     
     
--LIKE¿¬»êÀÚ
-- ÇĞ»ı Å×ÀÌºí¿¡¼­ ¼ºÀÌ ?±è?¾¾ÀÎ ÇĞ»ıÀÇ ÀÌ¸§, ÇĞ³â, ÇĞ°ú ¹øÈ£¸¦ ­t·ÂÇÏ¿©¶ó
SELECT 
    name, grade, deptno
FROM 
    student
WHERE
    name
LIKE
    '±è%'
ORDER BY 1;

--ÀÌ¸§Áß¿¡ 'µ¿'ÀÌ µé¾î°¡´Â ÇĞ»ıÀÇ ÇĞ¹ø, ÀÌ¸§ Á¶È¸
SELECT 
    name, grade, deptno
FROM 
    student
WHERE
    name
LIKE
    '_%µ¿%'
ORDER BY 1;

INSERT INTO student(name) VALUES ('µ¿¼­³²');

--? ÇĞ»ı Å×ÀÌºí¿¡¼­ ÀÌ¸§ÀÌ 3±ÛÀÚ, ¼ºÀº "±è?¾¾°í ¸¶Áö¸· ±ÛÀÚ°¡ "¿µ?À¸·Î ³¡³ª´Â ÇĞ»ıÀÇ ÀÌ¸§, ÇĞ³â, ÇĞ°ú ¹øÈ£¸¦ ­t·ÂÇÏ¿©¶ó
SELECT * FROM student;
SELECT
    name, grade, deptno
FROM 
    student
WHERE
    name
LIKE
    '±è_¿µ';



