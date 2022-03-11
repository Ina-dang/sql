SELECT * FROM USER_TABLES;
SELECT * FROM ALL_TABLES;
SELECT * FROM DBA_TABLES;



SELECT * FROM USER_SEQUENCES;
SELECT * FROM USER_VIEWS;
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_CONSTRAINTS;


--���������ִ� USER�� �� ������ �������
SELECT table_name FROM dictionary  WHERE table_name LIKE 'USER%';

--������ �̿��� ���������
SELECT 'SELECT * FROM' || table_name || ';' FROM dictionary  WHERE table_name LIKE 'USER%';

--������ ����� ��������� >> ��������
SELECT column_name FROM USER_TAB_COLS WHERE TABLE_NAME = 'TBL_BOARD';
SELECT 'SELECT ' || column_name || ' FROM TBL_BOARD;' FROM USER_TAB_COLS WHERE TABLE_NAME = 'TBL_BOARD';


SELECT BNO FROM TBL_BOARD;
SELECT TITLE FROM TBL_BOARD;
SELECT CONTENT FROM TBL_BOARD;
SELECT HITCOUNT FROM TBL_BOARD;
SELECT REGDATE FROM TBL_BOARD;
SELECT WRITER FROM TBL_BOARD;



--������ ���Ἲ
-- �����߼�

--no(������ȣ), sender, receiver, content, regdate(�߽Žð�), receiverdate(�����ð�)>>�ð������� ī��1ó��

DESC student;
SELECT * FROM professor;


--���� ���̺� �ν��Ͻ�
CREATE TABLE subject (
    subno NUMBER(5)
        CONSTRAINT pk_subject PRIMARY KEY
        DEFERRABLE INITIALLY DEFERRED,
--        USING INDEX TABLESPACE indx, --��� ��
    subname VARCHAR2(20)
        CONSTRAINT nn_subname NOT NULL,
    term VARCHAR2(1)
        CONSTRAINT ck_term CHECK (term in ('1', '2')),
    type VARCHAR2(1)
);

SELECT * FROM SUBJECT;


-- studo Į���� �⺻Ű ���������߰�
ALTER TABLE student
    ADD CONSTRAINT pk_student PRIMARY KEY(studno);

CREATE TABLE sugang (
    --�ܷ�Ű ���� �̰� �Ƚ�ε�
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


--? �л� ���̺� �ν��Ͻ��� �����Ͽ� studno�� �⺻ Ű, idnum�� ���� Ű,name�� NOT NULL ���Ἲ ���������� �߰��Ͽ���.
--�������Ǹ� ���� �Ƚᵵ �� PK���������� �ε����� ����ҰŶ� �� �Ű�������
ALTER TABLE student ADD CONSTRAINT uk_idnum UNIQUE(idnum);
ALTER TABLE student ADD CONSTRAINT uk_userid UNIQUE(userid);
ALTER TABLE student MODIFY (name CONSTRAINT nn_name NOT NULL);

--�а� ���̺� pk��� ���� --deptno�� �ܷ�Ű �־��ֱ�
ALTER TABLE department MODIFY(deptno CONSTRAINT pk_department PRIMARY KEY);
ALTER TABLE student MODIFY ( deptno CONSTRAINT fk_deptno REFERENCES department(deptno));




SELECT * FROM department;
--�а� ���̺� college�� fk�߰�
ALTER TABLE department MODIFY(college CONSTRAINT fk_college REFERENCES department(deptno));
--�а� ���̺� name nn �߰�
ALTER TABLE department MODIFY(dname CONSTRAINT nn_dname NOT NULL);
-- �������̺� profno pk�߰�
ALTER TABLE professor MODIFY(profno CONSTRAINT pk_professor PRIMARY KEY);

--�������̺� namenn�߰�
ALTER TABLE professor MODIFY(name CONSTRAINT nn_prof_name NOT NULL); --�̸� ��ġ��ȵ�

--�߸��ϸ� drop �ؾ���
--ALTER TABLE (���̺��) DROP CONSTRAINT (�߸����̸�);

--�������׺� deptno fk�߰�
ALTER TABLE professor MODIFY(deptno CONSTRAINT fk_prof_deptno REFERENCES department(deptno));
--�л����̺� profno fk�߰�
ALTER TABLE student MODIFY(profno CONSTRAINT fk_stud_profno REFERENCES professor(profno));

--�л����̺� grade ck �߰�(1~4)
ALTER TABLE student MODIFY (grade CONSTRAINT ck_grade CHECK(grade BETWEEN '1' AND 4));

SELECT * FROM user_cons_columns;
SELECT * FROM user_constraints;

--ALTER TABLE student DROP CONSTRAINT ck_grade;

DESC subject;
INSERT INTO subject VALUES (1001, '�ڹ�', '1', NULL);
INSERT INTO subject VALUES (1001, '����Ŭ', '2', NULL); --�������¶� ���� 

COMMIT; --Ŀ���ϸ� ������

SELECT * FROM subject; --�Է� �� �������� �̵�

INSERT INTO subject VALUES (1001, '�ڹ�', '1', NULL);
INSERT INTO subject VALUES (1001, '����Ŭ', '2', NULL); --�ٽ��ص� �Է��� ��

DESC subject;
INSERT INTO subject VALUES (1001, '�ڹ�', '1', NULL);
INSERT INTO subject VALUES (1002, '����Ŭ', '2', NULL); --����ε� �����Է�
SELECT * FROM subject;

COMMIT;



--�μ� ���̺��� name Į���� ���� �ε����� �����Ͽ���.��, ���� �ε����� �̸��� idx_dept_name���� �����Ѵ�
CREATE UNIQUE INDEX idx_dept_name ON department(dname);

SELECT * FROM department ;
SELECT * FROM department WHERE deptno > 2;
SELECT * FROM department WHERE dname > 'r��';
SELECT * FROM department WHERE dname IS NOT NULL;

SELECT /*+ index(d idx_dept_name) */ * FROM department d;
SELECT /*+ index(d pk_department) */ * FROM department d;
SELECT /*+ index_desc(d pk_department) */ * FROM department d;



DESC tbl_board;

SELECT * FROM tbl_board;


--���������� 20�� ��������ϴµ� �ϴ� ������ �Ŀ� ����
SELECT B.*, ROWNUM rn FROM tbl_board B WHERE ROWNUM <= 20 ORDER BY bno DESC;

--�׷���
SELECT * FROM (
    SELECT A.*, ROWNUM rn from (
        SELECT B.* FROM tbl_board B ORDER BY bno DESC
    ) A WHERE ROWNUM <= 30
) WHERE RN > 20;
--�ߴ¤� ���ڽ�Ʈ �ʹ�����


--pk_board �⺻Ű �߰� bno
ALTER TABLE tbl_board MODIFY ( 
    bno CONSTRAINT pk_board PRIMARY KEY
);
--�ڽ�Ʈ ���̱�
SELECT * FROM (
    SELECT /*+ index_desc(A pk_board) */ A.*, ROWNUM rn FROM tbl_board A WHERE ROWNUM <=30
)
WHERE rn > 20;


ALTER TABLE tbl_board DROP CONSTRAINT pk_board;

--�л� ���̺��� birthdate Į���� ����� �ε����� �����Ͽ���. ����� �ε����� �̸��� idx_stud_birthdate�� �����Ѵ�
CREATE INDEX idx_stud_birthdate ON student(birthdate);

SELECT * FROM student WHERE birthdate = '79/07/02';

--�л� ���̺��� deptno, grade Į���� ���� �ε����� �����Ͽ���. ���� �ε����� �̸��� idx_stud_dno_grade �� �����Ѵ�
CREATE INDEX idx_stud_dno_grade ON student(deptno, grade);

SELECT * FROM student WHERE deptno = 101 AND grade = 4;

DROP INDEX idx_stud_dno_grade;

--�л� ���̺��� deptno�� name Į������ ���� �ε����� �����Ͽ���.��, deptno Į���� ������������ name Į���� ������������ �����Ͽ���
CREATE INDEX idx_stud_dno_name ON student(deptno DESC, name);

SELECT * FROM student WHERE deptno > 0 AND name > '��';
SELECT /*+ index_desc(student idx_stud_dno_name) */ * FROM student;


SELECT * FROM USER_INDEXES;

SELECT *
FROM user_indexes
JOIN user_ind_columns USING (index_name);

SELECT * FROM dict WHERE table_name LIKE 'USER%IND%';


SELECT studno, name, deptno, profno FROM student;
--�й� �̸� �а���ȣ ������ȣ�� ������ ��Ʃ��Ʈ tmp ����
CREATE TABLE stud_tmp AS
SELECT studno, name, deptno, profno FROM student;

DROP TABLE stud_tmp;

--�й� �̸� �а���ȣ ������ȣ�� ������ ��Ʃ��Ʈ tmp �� ����
CREATE VIEW stud_tmp AS
SELECT studno, name, deptno, profno FROM student;

SELECT * FROM stud_tmp;
SELECT * FROM user_views;

CREATE OR REPLACE VIEW stud_tmp AS
SELECT studno, name, deptno, profno FROM student;

INSERT INTO stud_tmp VALUES ('12345', '����', 101, NULL);
INSERT INTO stud_tmp VALUES (12346, '�̱��', NULL, NULL);

SELECT * FROM HR.employees;

SELECT *
FROM
    HR.employees A
JOIN
    department B
ON 
    a.employee_id = B.deptno;
    
--�л� ���̺�� �μ� ���̺��� �����Ͽ� 102�� �а� �л����� �й�, �̸�,�г�, �а� �̸����� ���ǵǴ� ���� �並 �����Ͽ���.
CREATE OR REPLACE VIEW view_comp_test AS
SELECT 
    studno, name, grade, dname
FROM 
    student 
NATURAL JOIN 
    department;
    
SELECT * FROM view_comp_test;

INSERT INTO view_comp_test VALUES (12345, '������', '3', '��ǻ�Ͱ��а�');
DELETE FROM view_comp_test WHERE studno = 12345;
ROLLBACK;

SELECT * FROM student;

--�л��� ź�������� �ο����� ���Ͽ��� �׸��� �� �����͸� ����� view_comp_test2 �����
CREATE OR REPLACE VIEW view_comp_test2 AS
SELECT 
    (TO_CHAR(birthdate, 'YYYY')) birth, COUNT(*) cnt
FROM
    student
GROUP BY
    TO_CHAR(birthdate, 'YYYY');
    
SELECT * FROM view_comp_test2;

--�ζ��� �並 ����Ͽ� �а����� �л����� ��� Ű�� ��� ������, �а��̸��� �t���Ͽ���.

SELECT AH, AW, dname
FROM (
    SELECT 
        deptno, AVG(height) AH , AVG(weight)AW
    FROM
        student
    GROUP BY deptno
) NATURAL JOIN department;


GRANT SELECT ON department TO HR;


SELECT * FROM HR.employees; --�ǳ� ��� ���� ��������
--���Ǿ� �����
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
    
    

    
    
    


    


    