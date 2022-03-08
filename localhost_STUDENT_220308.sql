select * from student;

-- DML����
/*
����Ŭ �𺧷���
Ʈ����� ���ۻ��� �̱� ������ ���� Ŀ���������� �ѹ鰡��

�������Է�, INTO���� 
���������� ''
*/

--�л����̺� ȫ�浿�� ������ �Է�
desc student;
-- 1:1������ �Է�������� 408������

/* NULL
������ �Է½��� �ش� �÷��� �𸣰ų� ��Ȯ��

*/

--INSERT ��ɒK���� �������� ����� �̿��Ͽ� �μ� ���̺��� �μ���ȣ�� �μ� �̸��� �Է��ϰ� ������ Į���� NULL�� �Է��Ͽ���.
INSERT INTO department(deptno, dname)
VALUES (900, '������к�');

INSERT INTO department --���ڿ��� �ΰ��ν�
VALUES (301, 'ȯ�溸���а�', '', NULL);

SELECT * FROM department ;

--���� ���̺��� �Ի����� 2006�� 1��1�Ϸ� �Է��Ͽ���.
INSERT INTO professor(profno, name, position, hiredate, deptno)
VALUES (9920, '������', '������', TO_DATE('2006/01/01', 'YYYY/MM/DD'), 102);

SELECT * FROM professor;

--? ���� ���̺��� ���ΟH ���� �Է��� �� �Ի����� �n�� ��¥�� �Է��Ͽ���
INSERT INTO professor
VALUES (9910, '��̼�', 'white', '���Ӱ���', 200, SYSDATE, 10, 101);

--�Խ��� ���̺�
CREATE TABLE TBL_BOARD (
    BNO NUMBER,
    TITLE VARCHAR2(1000),
    CONTENT CLOB,
    HITCOOUNT NUMBER DEFAULT 0, --����Ʈ�صθ� �δ�� 0�̵�
    REGDATE DATE DEFAULT SYSDATE,
    WRITER VARCHAR2(200)
);

CREATE SEQUENCE seq_board;

DROP TABLE TBL_BOARD; --���̺�褸��
DROP SEQUENCE SEQ_BOARD; 

SELECT * FROM tbl_board;
TRUNCATE TABLE TBL_BOARD; --���̺��ڸ���

INSERT INTO tbl_board (BNO, TITLE, CONTENT, WRITER) VALUES (SEQ_BOARD.NEXTVAL, '����1', '����1', 'javaman');
INSERT INTO tbl_board (BNO, TITLE, CONTENT, WRITER) VALUES (SEQ_BOARD.NEXTVAL, '����2', '����2', 'babamba');
INSERT INTO tbl_board (BNO, TITLE, CONTENT, WRITER) VALUES (SEQ_BOARD.NEXTVAL, '����3', '����3', 'amanna');
INSERT INTO tbl_board (BNO, TITLE, CONTENT, WRITER) VALUES (SEQ_BOARD.NEXTVAL, '����4', '����4', 'merona');
INSERT INTO tbl_board (BNO, TITLE, CONTENT, WRITER) VALUES (SEQ_BOARD.NEXTVAL, '����5', '����5', 'vivivic');


INSERT INTO tbl_board
SELECT * FROM tbl_board;


INSERT INTO 
    tbl_board(BNO, TITLE, CONTENT, WRITER)
SELECT 
    SEQ_BOARD.NEXTVAL, TITLE, CONTENT, WRITER
FROM 
    tbl_board;
    
    
SELECT * FROM tbl_board ORDER BY 1 DESC;

--����¡ ó�� ���������� 10����
SELECT 
    A.*, ROWNUM RN
FROM (
    SELECT * FROM tbl_board ORDER BY 1 DESC
) A
WHERE ROWNUM <=10;


--2������
SELECT 
    * 
FROM (
    SELECT 
        A.*, ROWNUM RN
    FROM (
        SELECT * FROM tbl_board ORDER BY 1 DESC
    ) A
    WHERE ROWNUM <=20
)
WHERE RN > 10 ;


--���� �� �Է��� ���� height_info, weight_info ���� ���̺� ����
CREATE TABLE height_info(
    studno NUMBER,
    name VARCHAR2(10),
    height NUMBER
);

SELECT * FROM height_info;


CREATE TABLE weight_info(
    studno NUMBER,
    name VARCHAR2(10),
    weight NUMBER
);

SELECT * FROM weight_info;

--�л� ���̺��� 2�г� �̻��� �л��� �˻��Ͽ� height_info ���̺��� �й�, �̸�, Ű, weight_info ���̺��� �й�, �̸�, �����Ը� ���� �Է��Ͽ���.
--�̰��ϱ����� 2�г� ���� �ʿ�
SELECT * FROM student WHERE grade = '2'; --�÷��̸��� ���� ������ ���̺��� �� ��
-- ALL ���� INTO ��ġ�� ���̺��
INSERT ALL 
INTO height_info VALUES (studno, name, height)
INTO weight_info VALUES (studno, name, weight)
SELECT * FROM student WHERE grade = '2'; 

SELECT * FROM height_info;
SELECT * FROM weight_info;

TRUNCATE TABLE height_info; --���̺� ����
TRUNCATE TABLE weight_info; --���̺� ����

/*
�л� ���̺��� 2�г� �̻��� �л��� �˻��Ͽ� 
height_info ���̺��� Ű�� 170���� ū �л��� �й�, �̸�, Ű�� �Է��ϰ�
weight_info ���̺��� �����԰� 70���� ū �л��� �й�, �̸�,�����Ը� ���� �Է��Ͽ���.
��, Ű�� 170���� �۰�, �����԰� 70���� ū �л��� weight_info ���̺퐢 �Է�����.
*/

INSERT ALL 
WHEN height > 170 THEN 
INTO height_info VALUES (studno, name, height)
WHEN weight > 70 THEN
INTO weight_info VALUES (studno, name, weight)
SELECT * FROM student WHERE grade >= '2'; 

SELECT * FROM height_info;
SELECT * FROM weight_info;

--INSERT ALL ��� FIRST ����غ���
INSERT FIRST 
WHEN height > 170 THEN 
INTO height_info VALUES (studno, name, height)
WHEN weight > 70 THEN
INTO weight_info VALUES (studno, name, weight)
SELECT * FROM student WHERE grade >= '2'; 

SELECT * FROM height_info;
SELECT * FROM weight_info;


--? PIVOTING INSERT �� �ǽ��ϱ� ���� ���� ���̺�

CREATE TABLE sales (
    sales_no NUMBER, -- pk
    week_no NUMBER,
    sales_mon NUMBER,
    sales_tue NUMBER,
    sales_wed NUMBER,
    sales_thu NUMBER,
    sales_fri NUMBER
);

TRUNCATE TABLE sales;

INSERT INTO sales VALUES (1101, 4, 100, 150, 80, 60, 120);
INSERT INTO sales VALUES (1102, 5, 300, 300, 230, 120, 150);

SELECT * FROM sales;
SELECT * FROM sales_data;

CREATE TABLE sales_data (
    sales_no NUMBER,
    week_no NUMBER,
    day_no NUMBER,
    sales NUMBER    
);

TRUNCATE TABLE sales_data;

INSERT ALL
INTO sales_data VALUES (sales_no, week_no, 1, sales_mon)
INTO sales_data VALUES (sales_no, week_no, 2, sales_tue)
INTO sales_data VALUES (sales_no, week_no, 3, sales_wed)
INTO sales_data VALUES (sales_no, week_no, 4, sales_thu)
INTO sales_data VALUES (sales_no, week_no, 5, sales_fri)
SELECT * FROM sales;

INSERT ALL
INTO seles_data VALUES (sales_no, week_no) 
SELECT * FROM sales;

SELECT * FROM sales_data ORDER BY 2,3;


--SALES DATE��� ������ ��ո���, ������
SELECT 
    week_no, AVG(sales), SUM(sales)
FROM
    sales_data
GROUP BY 
    week_no;
    
--�ٽ��Ǻ��� �ϱ�
SELECT SALES_NO, WEEK_NO, DAY_NO, SALES FROM sales_DATA ORDER BY 2, 3; -- >>10�� �÷��ø���
SELECT 
    SALES_NO, 
    WEEK_NO,
    MAX(CASE WHEN DAY_NO = 1 THEN SALES END) SALES_MON,
    MAX(CASE WHEN DAY_NO = 2 THEN SALES END) SALES_TUE,
    MAX(CASE WHEN DAY_NO = 3 THEN SALES END) SALES_WED,
    MAX(CASE WHEN DAY_NO = 4 THEN SALES END) SALES_THU,
    MAX(CASE WHEN DAY_NO = 5 THEN SALES END) SALES_FRI
FROM 
    SALES_DATA
GROUP BY 
    SALES_NO, WEEK_NO;
    
--�Ǵٽ� �Ǻ���
SELECT SALES_NO, WEEK_NO, 1 DAY_NO, SALES_MON SALES FROM sales UNION
SELECT SALES_NO, WEEK_NO, 2 DAY_NO, SALES_TUE SALES FROM sales UNION
SELECT SALES_NO, WEEK_NO, 3 DAY_NO, SALES_WED SALES FROM sales UNION
SELECT SALES_NO, WEEK_NO, 4 DAY_NO, SALES_THU SALES FROM sales UNION
SELECT SALES_NO, WEEK_NO, 5 DAY_NO, SALES_FRI SALES FROM sales;

--�޷¸����

SELECT ROWNUM RN FROM DICT WHERE ROWNUM <= 31; 


SELECT * 
FROM (
    SELECT ROWNUM RN FROM DICT WHERE ROWNUM <= 31
);

--MOD ���������� ����Ұ�
SELECT 
    CASE WHEN MOD (RN, 7) = 1 THEN RN END ��
FROM (
    SELECT ROWNUM RN FROM DICT WHERE ROWNUM <= 31
);

--MOD ���������� ����Ұ�1
SELECT 
    CASE WHEN MOD (RN, 7) = 1 THEN RN END ��,
    CASE WHEN MOD (RN, 7) = 2 THEN RN END ��,
    CASE WHEN MOD (RN, 7) = 3 THEN RN END ȭ,
    CASE WHEN MOD (RN, 7) = 4 THEN RN END ��,
    CASE WHEN MOD (RN, 7) = 5 THEN RN END ��,
    CASE WHEN MOD (RN, 7) = 6 THEN RN END ��,
    CASE WHEN MOD (RN, 7) = 0 THEN RN END ��
    
FROM (
    SELECT ROWNUM RN FROM DICT WHERE ROWNUM <= 31
);

--MOD ���������� ����Ұ�2 ����� ������ ���� �׷������ٲ� 
--������ ��
SELECT 
    TRUNC((RN-1)/7),
    CASE WHEN MOD (RN, 7) = 1 THEN RN END ��,
    CASE WHEN MOD (RN, 7) = 2 THEN RN END ��,
    CASE WHEN MOD (RN, 7) = 3 THEN RN END ȭ,
    CASE WHEN MOD (RN, 7) = 4 THEN RN END ��,
    CASE WHEN MOD (RN, 7) = 5 THEN RN END ��,
    CASE WHEN MOD (RN, 7) = 6 THEN RN END ��,
    CASE WHEN MOD (RN, 7) = 0 THEN RN END ��
    
FROM (
    SELECT ROWNUM RN FROM DICT WHERE ROWNUM <= 31
);


--MOD ���������� ����Ұ�3 ���������� �����
SELECT 
    MAX(CASE WHEN MOD (RN, 7) = 1 THEN RN END) ��,
    MAX(CASE WHEN MOD (RN, 7) = 2 THEN RN END) ��,
    MAX(CASE WHEN MOD (RN, 7) = 3 THEN RN END) ȭ,
    MAX(CASE WHEN MOD (RN, 7) = 4 THEN RN END) ��,
    MAX(CASE WHEN MOD (RN, 7) = 5 THEN RN END) ��,
    MAX(CASE WHEN MOD (RN, 7) = 6 THEN RN END) ��,
    MAX(CASE WHEN MOD (RN, 7) = 0 THEN RN END) ��
FROM (
    SELECT ROWNUM RN FROM DICT WHERE ROWNUM <= 31
)
GROUP BY TRUNC((RN-1)/7)
ORDER BY TRUNC((RN-1)/7);


--MOD ���������� ����Ұ�3 ���������� ����� >> DICT�� �������� ���̽ǰŶ�� �ߴ�



--���� ��ȣ�� 9903�� ������ �n�� ������ ?�α���?�� �����Ͽ���
UPDATE professor SET 
POSITION = '�α���';
--�̰͸� �ϸ� �� �α�����
SELECT * FROM professor;
ROLLBACK;

UPDATE professor SET 
POSITION = '�α���'
WHERE profno = 9903;
SELECT * FROM professor;


--���������� �̿��Ͽ� �й��� 10201�� �л��� �г�� �а� ��ȣ�� 10103 �й� �л��� �г�� �а� ��ȣ�� �����ϰ� �����Ͽ���

SELECT studno, grade, deptno
FROM student
WHERE studno = 10103;

SELECT studno, grade, deptno
FROM student
WHERE studno = 10201;

SELECT 
    studno, grade, deptno
FROM
    student
WHERE 
    studno IN (10201, 10103);


--�� ����
UPDATE student SET
--GRADE = (SELECT grade FROM student WHERE studno = 10103),
--DEPTNO = (SELECT deptno FROM student WHERE studno = 10103)
(grade, deptno) = (SELECT grade,deptno FROM student WHERE studno = 10103)
WHERE studno = 10201;
SELECT * FROM student;

--�� ��
UPDATE student SET
(grade, deptno) = (SELECT grade, deptno FROM student WHERE studno = 10103)
WHERE studno = 10201;



--�л� ���̺��� �й��� 20103�� �л��� �����͸� �����Ͽ���
DELETE FROM STUDENT
WHERE studno = 30303;

DELETE FROM STUDENT
WHERE name = '������';

SELECT * FROM student;


--�л� ���̺��� ��ǻ�Ͱ��а��� �Ҽӵ� �л��� ��� �����Ͽ���.

DELETE FROM student
WHERE deptno = (
SELECT deptno FROM department WHERE dname = '��ǻ�Ͱ��а�');

ROLLBACK;


/*professor ���̺�� professor_temp ���̺��� ���Ͽ�
professor ���̺� �ִ� ��� �����ʹ� professor_temp ���̺�
�� �����Ϳ� ���� �����ϰ�, professor ���̺� ���� �����ʹ�
�߱Է� �Է�����.*/

CREATE TABLE professor_temp AS 
SELECT *
FROM professor
WHERE position = '����';

UPDATE professor temp
SET position = '������'
WHERE position = '����';

INSERT INTO professor_temp
VALUES(9999, '�赵��', 'arom21', '���Ӱ���', 200, SYSDATE, 10, 101);

SELECT * FROM professor;
--�ΰ��� �ش� ������ȣ ��ġ�� �� ������Ʈ�ϰ� �ƴҶ� �μ�Ʈ
SELECT * FROM professor_temp;

MERGE INTO professor p
USING professor_temp p2
ON (p.profno = p2.profno)
WHEN MATCHED THEN 
    UPDATE SET position = p2.position
WHEN NOT MATCHED THEN
    INSERT values(p2.profno, p2.name, p2.userid, p2.position, p2.sal, p2.hiredate, p2.comm, p2.deptno);

    
--���۹�ȣ 3 2�� �����ϴ� �ִ밪 100�� sequence ���� �̸��� seq_test
CREATE SEQUENCE seq_test
START WITH 3 
INCREMENT BY 2
MAXVALUE 100;

DROP SEQUENCE seq_test;

--CURRVAL, NEXTVAL
SELECT seq_test.CURRVAL FROM DUAL;
SELECT seq_test.NEXTVAL FROM DUAL;
SELECT seq_test.NEXTVAL, seq_test.NEXTVAL,seq_test.NEXTVAL,seq_test.NEXTVAL FROM DUAL;

SELECT * FROM professor;
--profno, name, position, sal, comm, userid, hiredate, deptno �� �ٲٱ�

CREATE TABLE prof2 AS
SELECT profno, name, position, sal, comm, userid, hiredate, deptno FROM professor;

SELECT * FROM prof2;

RENAME professor TO prof;
RENAME prof2 TO professor;

SELECT * FROM professor;





