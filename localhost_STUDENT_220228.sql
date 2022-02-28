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
    
--// 10101 ������ �л��� �������� ã��
SELECT * 
FROM professor 
WHERE 
    profno = 9903;

SELECT * FROM student;
--���� �������� ���»���
SELECT * FROM professor WHERE profno = null;

-- '' ���ڿ� ==> ���̰� 0 �̸� null�� ó��
-- = null

--����ð������� ��Į���Լ�
SELECT 
    SYSDATE, 
    TO_CHAR(SYSDATE, 'MM/DD') MD,  --�Լ�. �ε� �� ���� ��(SYSDATE, MMDD �־��µ� �ϳ��� ��ȯ)
    TO_CHAR(NULL, 'MM/DD') NV, --null�� ���ڷ� ���� null�� ��ȯ
    TO_CHAR(SYSDATE, NULL) NV2
FROM 
    DUAL;


--�����տ���    
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

-- divisor is equal to zero �����߻�
SELECT
    2 / 0
FROM 
    DUAL;
    
    
--���� ���̺��� �̸�, ����,  �������� ���
SELECT * FROM PROFESSOR;
SELECT
    name, position, sal
FROM
    professor;

-- �������̺��� ���������� �޴� ������ �̸�, ����, �������� ���
SELECT
    name, position, comm
FROM
    professor
WHERE 
    COMM IS NOT NULL;


-- �������̺��� ���������� �����ʴ� ������ �̸�, ����, �������� ���
SELECT
    name, position, comm
FROM
    professor
WHERE 
    COMM IS NULL;
    
--�������̺��� �޿��� ���������� ���Ѱ��� sal_com�̶�� �������� ���
SELECT * FROM professor;
SELECT  
    name, sal, comm, sal+comm AS sal_com
FROM 
    professor
WHERE
    sal+comm IS NOT NULL;
    
--102�� �а��� �л��� 1 �ɴ� 4�г� �л��� �̸� �г� �а���ȣ ���
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

--102�� �а��� �л� �߿��� 4�г� �л��̰ų� �Ҽ��а��� ������� 1�г� �л��� �̸�, �г�, �а� ��ȣ�� �t���Ͽ���
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
    
--? 1�г� �̸鼭 �����԰� 70kg �̻��� �л��� ����(stud_heavy)�� 1�г� �̸鼭 101�� �а��� �Ҽӵ� �л�(stud_101)���� ������ �� ���� ���̺� ����
--���ǹ����� ó��

CREATE TABLE STUD_HEAVY AS --���̺� ����
SELECT * FROM STUDENT WHERE GRADE = 1 AND WEIGHT >= 70;

CREATE TABLE STUD_101 AS --���̺� ����
SELECT * FROM STUDENT WHERE GRADE = 1 AND deptno = 101;

SELECT * FROM STUD_HEAVY;
SELECT * FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
UNION --������
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
UNION ALL --�ߺ�������
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
INTERSECT --������
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;

SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_HEAVY
MINUS --������
SELECT STUDNO, NAME, DEPTNO, WEIGHT
FROM STUD_101;


/*
1 2 3 
4 5 6
7 8 9
�����*/
--�߸�
SELECT 1,2,3 FROM DUAL
UNION
SELECT 4,5,6 FROM DUAL
UNION 
SELECT 7,8,9 FROM DUAL;

--�������� ���ϴ� ��
SELECT 
    (rownum-1)*3+1 N1, (rownum-1)*3+2 N2, (rownum-1)*3+3 N3
FROM
    student
WHERE
    rownum <= 3;

-- �޷¸���µ� ����
SELECT
    *
FROM
    ALL_OBJECTS;
    


--�л� ���̺��� �̸��� �����ټ����� �����Ͽ� �̸�, �г�, ��ȭ��ȣ�� �t���Ͽ���
SELECT 
    name, grade, tel 
FROM 
    student 
WHERE 
    tel IS NOT NULL
ORDER BY 1;

--�г� ��������
SELECT 
    name, grade, tel 
FROM 
    student 
WHERE 
    tel IS NOT NULL
ORDER BY 2 DESC;

--�г�, �̸� ��������
SELECT 
    name, grade, tel 
FROM 
    student 
WHERE 
    tel IS NOT NULL
ORDER BY 2 DESC, 1 DESC;
    
    
--�л� ���̺��� �й�, �̸�, ź���⵵ ��ȸ
SELECT
    studno, name, birthdate, TO_CHAR(birthdate, 'YYYY') AS YY
FROM   
    student;
    
--�л� ���̺��� ���Ű ��ո����� ��ȸ
SELECT 
    MIN(studno), AVG(height) AS "��� Ű" , avg(weight) AS "��� ������"
FROM
    student;
    
    
--�л� ���̺��� ?�迵��? �л��� �̸�, ����� ���̵� �t���Ͽ���. �׸��� ����� ���̵��� �Q �K�ڸ� ��K�ڷ� ���Q�Ͽ� �t���Ͽ���
SELECT
    name, INITCAP(userid), LOWER(userid), UPPER(userid)
FROM
    student
WHERE
    name = '�迵��';

--�μ� ���̺��� �μ� �̸��� ���̸� �K�� ���� ����Ʈ ���� ���� �t���Ͽ���
SELECT
    dname, LENGTH(dname),LENGTHB(dname)
FROM
    department;
    
--�л� ���̺��� 1�г� �л��� �ֹε�� ��ȣ���� ������ϰ� �¾ ���� �߭t�Ͽ� �̸�, �ֹι�ȣ, �������, �¾ ���� �t���Ͽ���.
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




    