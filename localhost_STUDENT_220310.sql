SELECT * FROM USER_TABLES;
SELECT * FROM ALL_TABLES;
SELECT * FROM DBA_TABLES;



SELECT * FROM USER_SEQUENCES;
SELECT * FROM USER_VIEWS;
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_CONSTRAINTS;


--³»°¡º¼¼öÀÖ´Â USER·Î µÈ µ¥ÀÌÅÍ »çÀü¸íµé
SELECT table_name FROM dictionary  WHERE table_name LIKE 'USER%';

--»çÀüÀ» ÀÌ¿ëÇÑ Äõ¸®¸¸µé±â
SELECT 'SELECT * FROM' || table_name || ';' FROM dictionary  WHERE table_name LIKE 'USER%';

--Äõ¸®¸¦ ¸¸µå´Â Äõ¸®¸¸µé±â >> »ý¼ºÀÌÀ¯
SELECT column_name FROM USER_TAB_COLS WHERE TABLE_NAME = 'TBL_BOARD';
SELECT 'SELECT ' || column_name || ' FROM TBL_BOARD;' FROM USER_TAB_COLS WHERE TABLE_NAME = 'TBL_BOARD';


SELECT BNO FROM TBL_BOARD;
SELECT TITLE FROM TBL_BOARD;
SELECT CONTENT FROM TBL_BOARD;
SELECT HITCOUNT FROM TBL_BOARD;
SELECT REGDATE FROM TBL_BOARD;
SELECT WRITER FROM TBL_BOARD;



--µ¥ÀÌÅÍ ¹«°á¼º
-- ÂÊÁö¹ß¼Û

--no(ÂÊÁö¹øÈ£), sender, receiver, content, regdate(¹ß½Å½Ã°£), receiverdate(ÀÐÀº½Ã°£)>>½Ã°£¾øÀ¸¸é Ä«Åå1Ã³·³

DESC student;
SELECT * FROM professor;


--°­ÁÂ Å×ÀÌºí ÀÎ½ºÅÏ½º
CREATE TABLE subject (
    subno NUMBER(5)
        CONSTRAINT pk_subject PRIMARY KEY
        DEFERRABLE INITIALLY DEFERRED,
--        USING INDEX TABLESPACE indx, --¾ø¾î¼­ »­
    subname VARCHAR2(20)
        CONSTRAINT nn_subname NOT NULL,
    term VARCHAR2(1)
        CONSTRAINT ck_term CHECK (term in ('1', '2')),
    type VARCHAR2(1)
);

SELECT * FROM SUBJECT;


-- studo Ä®·³¿¡ ±âº»Å° Á¦¾àÁ¶°ÇÃß°¡
ALTER TABLE student
    ADD CONSTRAINT pk_student PRIMARY KEY(studno);

CREATE TABLE sugang (
    --¿Ü·¡Å° ¾²¸é ÀÌ°Å ¾È½áµÎµÊ
    studno
        CONSTRAINT fk_sugang_studno REFERENCES student(studno),
    subno
        CONSTRAINT fk_sugang_subno REFERENCES subject(subno),
    regdate DATE DEFAULT sysdate,
    result NUMBER(3),
        CONSTRAINT pk_sugang PRIMARY KEY (studno, subno)
);

SELECT * FROM sugang;

SELECT * FROM user_constraints;


--? ÇÐ»ý Å×ÀÌºí ÀÎ½ºÅÏ½º¸¦ ÂüÁ¶ÇÏ¿© studno¿¡ ±âº» Å°, idnum¿¡ °íÀ¯ Å°,name¿¡ NOT NULL ¹«°á¼º Á¦¾àÁ¶°ÇÀ» Ãß°¡ÇÏ¿©¶ó.
--Á¦¾àÁ¶°Ç¸í ±»ÀÌ ¾È½áµµ µÊ PKÁ¦¾àÁ¶°ÇÀº ÀÎµ¦½º·Î »ç¿ëÇÒ°Å¶ó Á» ½Å°æ½áÁà¾ßÇÔ
ALTER TABLE student ADD CONSTRAINT uk_idnum UNIQUE(idnum);
ALTER TABLE student ADD CONSTRAINT uk_userid UNIQUE(userid);
ALTER TABLE student MODIFY (name CONSTRAINT nn_name NOT NULL);

--ÇÐ°ú Å×ÀÌºí¿¡ pk¾ø¾î¼­ ¿À·ù --deptno¿¡ ¿Ü·¡Å° ³Ö¾îÁÖ±â
ALTER TABLE department MODIFY(deptno CONSTRAINT pk_department PRIMARY KEY);
ALTER TABLE student MODIFY ( deptno CONSTRAINT fk_deptno REFERENCES department(deptno));




SELECT * FROM department;
--ÇÐ°ú Å×ÀÌºí college¿¡ fkÃß°¡
ALTER TABLE department MODIFY(college CONSTRAINT fk_college REFERENCES department(deptno));
--ÇÐ°ú Å×ÀÌºí name nn Ãß°¡
ALTER TABLE department MODIFY(dname CONSTRAINT nn_dname NOT NULL);
-- ±³¼öÅ×ÀÌºí profno pkÃß°¡
ALTER TABLE professor MODIFY(profno CONSTRAINT pk_professor PRIMARY KEY);

--±³¼öÅ×ÀÌºí namennÃß°¡
ALTER TABLE professor MODIFY(name CONSTRAINT nn_prof_name NOT NULL); --ÀÌ¸§ °ãÄ¡¸é¾ÈµÊ

--Àß¸øÇÏ¸é drop ÇØ¾ßÇÔ
--ALTER TABLE (Å×ÀÌºí¸í) DROP CONSTRAINT (Àß¸øµÈÀÌ¸§);

--±³¼öÅ×À×ºí deptno fkÃß°¡
ALTER TABLE professor MODIFY(deptno CONSTRAINT fk_prof_deptno REFERENCES department(deptno));
--ÇÐ»ýÅ×ÀÌºí profno fkÃß°¡
ALTER TABLE student MODIFY(profno CONSTRAINT fk_stud_profno REFERENCES professor(profno));

--ÇÐ»ýÅ×ÀÌºí grade ck Ãß°¡(1~4)
ALTER TABLE student MODIFY (grade CONSTRAINT ck_grade CHECK(grade BETWEEN '1' AND 4));

SELECT * FROM user_cons_columns;
SELECT * FROM user_constraints;

--ALTER TABLE student DROP CONSTRAINT ck_grade;

DESC subject;
INSERT INTO subject VALUES (1001, 'ÀÚ¹Ù', '1', NULL);
INSERT INTO subject VALUES (1001, '¿À¶óÅ¬', '2', NULL); --Áö¿¬»óÅÂ¶ó °¡´É 

COMMIT; --Ä¿¹ÔÇÏ¸é ¿À·ù¶ä

SELECT * FROM subject; --ÀÔ·Â Àü ½ÃÁ¡À¸·Î ÀÌµ¿

INSERT INTO subject VALUES (1001, 'ÀÚ¹Ù', '1', NULL);
INSERT INTO subject VALUES (1001, '¿À¶óÅ¬', '2', NULL); --´Ù½ÃÇØµµ ÀÔ·ÂÀº µÊ

DESC subject;
INSERT INTO subject VALUES (1001, 'ÀÚ¹Ù', '1', NULL);
INSERT INTO subject VALUES (1002, '¿À¶óÅ¬', '2', NULL); --Á¦´ë·ÎµÈ Á¤º¸ÀÔ·Â
SELECT * FROM subject;

COMMIT;



--ºÎ¼­ Å×ÀÌºí¿¡¼­ name Ä®·³À» °íÀ¯ ÀÎµ¦½º·Î »ý¼ºÇÏ¿©¶ó.´Ü, °íÀ¯ ÀÎµ¦½ºÀÇ ÀÌ¸§À» idx_dept_nameÀ¸·Î Á¤ÀÇÇÑ´Ù
CREATE UNIQUE INDEX idx_dept_name ON department(dname);

SELECT * FROM department ;
SELECT * FROM department WHERE deptno > 2;
SELECT * FROM department WHERE dname > 'r°¡';
SELECT * FROM department WHERE dname IS NOT NULL;

SELECT /*+ index(d idx_dept_name) */ * FROM department d;
SELECT /*+ index(d pk_department) */ * FROM department d;
SELECT /*+ index_desc(d pk_department) */ * FROM department d;



DESC tbl_board;

SELECT * FROM tbl_board;


--ÇÑÆäÀÌÁö¿¡ 20¿¡ º¸¿©Áà¾ßÇÏ´Âµ¥ ÀÏ´Ü °¡Á®¿Â ÈÄ¿¡ ¿ª¼ø
SELECT B.*, ROWNUM rn FROM tbl_board B WHERE ROWNUM <= 20 ORDER BY bno DESC;

--±×·¡¼­
SELECT * FROM (
    SELECT A.*, ROWNUM rn from (
        SELECT B.* FROM tbl_board B ORDER BY bno DESC
    ) A WHERE ROWNUM <= 30
) WHERE RN > 20;
--Çß´Â¤§ ¤ÄÄÚ½ºÆ® ³Ê¹«½ÉÇÔ


--pk_board ±âº»Å° Ãß°¡ bno
ALTER TABLE tbl_board MODIFY ( 
    bno CONSTRAINT pk_board PRIMARY KEY
);
--ÄÚ½ºÆ® ÁÙÀÌ±â
SELECT * FROM (
    SELECT /*+ index_desc(A pk_board) */ A.*, ROWNUM rn FROM tbl_board A WHERE ROWNUM <=30
)
WHERE rn > 20;


ALTER TABLE tbl_board DROP CONSTRAINT pk_board;

--ÇÐ»ý Å×ÀÌºíÀÇ birthdate Ä®·³À» ºñ°íÀ¯ ÀÎµ¦½º·Î »ý¼ºÇÏ¿©¶ó. ºñ°íÀ¯ ÀÎµ¦½ºÀÇ ÀÌ¸§Àº idx_stud_birthdate·Î Á¤ÀÇÇÑ´Ù
CREATE INDEX idx_stud_birthdate ON student(birthdate);

SELECT * FROM student WHERE birthdate = '79/07/02';

--ÇÐ»ý Å×ÀÌºíÀÇ deptno, grade Ä®·³À» °áÇÕ ÀÎµ¦½º·Î »ý¼ºÇÏ¿©¶ó. °áÇÕ ÀÎµ¦½ºÀÇ ÀÌ¸§Àº idx_stud_dno_grade ·Î Á¤ÀÇÇÑ´Ù
CREATE INDEX idx_stud_dno_grade ON student(deptno, grade);

SELECT * FROM student WHERE deptno = 101 AND grade = 4;

DROP INDEX idx_stud_dno_grade;

--ÇÐ»ý Å×ÀÌºíÀÇ deptno¿Í name Ä®·³À¸·Î °áÇÕ ÀÎµ¦½º¸¦ »ý¼ºÇÏ¿©¶ó.´Ü, deptno Ä®·³À» ³»¸²Â÷¼øÀ¸·Î name Ä®·³Àº ¿À¸§Â÷¼øÀ¸·Î »ý¼ºÇÏ¿©¶ó
CREATE INDEX idx_stud_dno_name ON student(deptno DESC, name);

SELECT * FROM student WHERE deptno > 0 AND name > '°¡';
SELECT /*+ index_desc(student idx_stud_dno_name) */ * FROM student;


SELECT * FROM USER_INDEXES;

SELECT *
FROM user_indexes
JOIN user_ind_columns USING (index_name);

SELECT * FROM dict WHERE table_name LIKE 'USER%IND%';


SELECT studno, name, deptno, profno FROM student;
--ÇÐ¹ø ÀÌ¸§ ÇÐ°ú¹øÈ£ ±³¼ö¹øÈ£¸¦ °¡Áö´Â ½ºÆ©´øÆ® tmp »ý¼º
CREATE TABLE stud_tmp AS
SELECT studno, name, deptno, profno FROM student;

DROP TABLE stud_tmp;

--ÇÐ¹ø ÀÌ¸§ ÇÐ°ú¹øÈ£ ±³¼ö¹øÈ£¸¦ °¡Áö´Â ½ºÆ©´øÆ® tmp ºä »ý¼º
CREATE VIEW stud_tmp AS
SELECT studno, name, deptno, profno FROM student;

SELECT * FROM stud_tmp;
SELECT * FROM user_views;

CREATE OR REPLACE VIEW stud_tmp AS
SELECT studno, name, deptno, profno FROM student;

INSERT INTO stud_tmp VALUES ('12345', '±è±è±è', 101, NULL);
INSERT INTO stud_tmp VALUES (12346, 'ÀÌ±è±è', NULL, NULL);

SELECT * FROM HR.employees;

SELECT *
FROM
    HR.employees A
JOIN
    department B
ON 
    a.employee_id = B.deptno;
    
--ÇÐ»ý Å×ÀÌºí°ú ºÎ¼­ Å×ÀÌºíÀ» Á¶ÀÎÇÏ¿© 102¹ø ÇÐ°ú ÇÐ»ýµéÀÇ ÇÐ¹ø, ÀÌ¸§,ÇÐ³â, ÇÐ°ú ÀÌ¸§À¸·Î Á¤ÀÇµÇ´Â º¹ÇÕ ºä¸¦ »ý¼ºÇÏ¿©¶ó.
CREATE OR REPLACE VIEW view_comp_test AS
SELECT 
    studno, name, grade, dname
FROM 
    student 
NATURAL JOIN 
    department;
    
SELECT * FROM view_comp_test;

INSERT INTO view_comp_test VALUES (12345, 'ÀÌÀÌÀÌ', '3', 'ÄÄÇ»ÅÍ°øÇÐ°ú');
DELETE FROM view_comp_test WHERE studno = 12345;
ROLLBACK;

SELECT * FROM student;

--ÇÐ»ýµé Åº»ý¿¬µµº° ÀÎ¿ø¼ö¸¦ ±¸ÇÏ¿©¶ó ±×¸®°í ÀÌ µ¥ÀÌÅÍ¸¦ »ç¿ëÇØ view_comp_test2 ºä»ý¼º
CREATE OR REPLACE VIEW view_comp_test2 AS
SELECT 
    (TO_CHAR(birthdate, 'YYYY')) birth, COUNT(*) cnt
FROM
    student
GROUP BY
    TO_CHAR(birthdate, 'YYYY');
    
SELECT * FROM view_comp_test2;

--ÀÎ¶óÀÎ ºä¸¦ »ç¿ëÇÏ¿© ÇÐ°úº°·Î ÇÐ»ýµéÀÇ Æò±Õ Å°¿Í Æò±Õ ¸ö¹«°Ô, ÇÐ°úÀÌ¸§À» ­t·ÂÇÏ¿©¶ó.

SELECT AH, AW, dname
FROM (
    SELECT 
        deptno, AVG(height) AH , AVG(weight)AW
    FROM
        student
    GROUP BY deptno
) NATURAL JOIN department;


GRANT SELECT ON department TO HR;


SELECT * FROM HR.employees; --¸Ç³¯ ±æ°Ô ¾²±â ±ÍÂúÀ¸´Ï
--µ¿ÀÇ¾î ¸¸µé±â
CREATE SYNONYM emps FOR HR.employees;
SELECT * FROM emps;

SELECT * FROM department;


SELECT deptno, dname, college, level
FROM department START WITH deptno = 10
CONNECT BY PRIOR deptno = college;

SELECT 
    LPAD(' ', (level-1)*2) || dname D
FROM 
    department 
START WITH 
    deptno = 10
CONNECT BY PRIOR 
    deptno = college;
    
    

    
    
    


    


    