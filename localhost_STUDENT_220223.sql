--¾Æ±î Áý¾î³Ö¾ú´ø µ¥ÀÌÅÍº£ÀÌ½ºµé Ãâ·Â
SELECT * FROM STUDENT;

--ÇÐ»ýµéÀÇ Å° ¼ø¼­ ¿ª¼ø
SELECT * FROM STUDENT ORDER BY HEIGHT DESC;

--ÇÐ»ýµéÀÇ ÀÎ¿ø¼ö, Æò±ÕÅ°, Æò±Õ ¸ö¹«°Ô
SELECT COUNT(*), AVG(HEIGHT),  AVG(WEIGHT) fROM STUDENT;

--ÇÐ°úº° ÇÐ»ýµéÀÇ ÀÎ¿ø¼ö, Æò±ÕÅ°, Æò±Õ, ¸ö¹«°Ô
SELECT DEPTNO, COUNT(*), AVG(HEIGHT),  AVG(WEIGHT) fROM STUDENT GROUP BY DEPTNO;


SELECT * FROM PROFESSOR;
SELECT * FROM DEPARTMENT; 
SELECT * FROM SALGRADE; 

--Çï·Î¿ùµå Ãâ·Â
SELECT 'HELLO WORLD' FROM DUAL;

--ÇÐ»ýÀÇ ÇÐ¹ø, ÀÌ¸§, ÇÐ°úÀÌ¸§À» Á¶È¸
--SELECT STUDNO, NAME, DNAME
--FROM STUDENT
--NATURAL JOIN DEPARTMENT;

SELECT STUDNO, NAME, DNAME
FROM STUDENT S, DEPARTMENT D
WHERE S.DEPTNO = D.DEPTNO;

SELECT STUDNO, NAME, (SELECT DNAME FROM DEPARTMENT D WHERE D.DEPTNO = S.DEPTNO) AS DNAME
FROM STUDENT S;


--ÇöÀç Á¢¼ÓÇÒ µ¥ÀÌÅÍº£ÀÌ½º °èÁ¤¿¡¼­ »ý¼ºµÈ ¸ðµç Å×ÀÌºí ÀÔ·Â
SELECT * FROM TAB;

--ÇÐ»ý Å×ÀÌºí ±¸Á¶ È®ÀÎ
DESC STUDENT;

--½Ã°£Ãâ·Â
SELECT SYSDATE FROM DUAL; --ÇöÀç
SELECT SYSDATE + 3 FROM DUAL; --3ÀÏ µÚ ¿¬»ê°¡³Õ
SELECT SYSDATE - 1 FROM DUAL; --ÇÏ·çÀüµµ °¡´É¾²

--¿¬»ê
SELECT 1000 * 200 FROM DUAL;
SELECT 240 / 3 FROM DUAL;
SELECT 2 + 3 * 10 FROM DUAL;

--ºÎ¼­Å×ÀÌºí¿¡¼­ ºÎ¼­ÀÌ¸§(DNAME)°ú ºÎ¼­¹øÈ£(DEPTNO) Ãâ·Â
SELECT * FROM TAB; --ÀÖ´ÂÁöºÎÅÍ È®ÀÎ
SELECT* FROM DEPARTMENT; --µé¾î°¡¼­ ¹¹ÀÖ´ÂÁö È®ÀÎ
SELECT DNAME, DEPTNO FROM DEPARTMENT; --ÈÄ º¯¼ö È®ÀÎÇØ¼­ Ãâ·Â

--±³¼öÅ×ÀÌºí¿¡¼­ ±³¼öÀÌ¸§°ú Æ÷Áö¼Ç Ãâ·Â
SELECT NAME, POSITION FROM PROFESSOR;

/* SQL ¸í·É¹®ÀÇ Ç¥ÁØ Çü½Ä
SELECT [DISTINCT] {*}
FROM TABLE
[WHERE CONDITION]
[GROUP BY GROUP_BY_EXPRESSION]
[HAVING GROUP_CONDITION]
[ORDER BY COLUMN];
*/

--ÇÐ»ýÅ×ÀÌºí¿¡¼­Áßº¹µÇ´ÂÇÐ°ú¹øÈ£(deptno)¸¦Á¦¿ÜÇÏ°í­t·ÂÇÏ¿©¶ó
SELECT DISTINCT DEPTNO FROM STUDENT;

--ÇÐ»ýÅ×ÀÌºí¿¡¼­Áßº¹µÇ´ÂÇÐ°ú¹øÈ£, ÇÐ³âÁ¦¿ÜÇÏ°í­t·ÂÇÏ¿©¶ó
SELECT * FROM STUDENT; 
SELECT DISTINCT DEPTNO, GRADE FROM STUDENT;



