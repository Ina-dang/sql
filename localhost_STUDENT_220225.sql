SELECT * FROM tab;

SELECT * FROM STUDENT;

SELECT DISTINCT deptno, name
FROM student
ORDER BY 1 DESC;

SELECT 'Hello world' AS "HI" FROM DUAL;

SELECT * FROM ex_type;

--�л� ���̺��� 1�г� �л��� �˻�, �й�, �̸�, �а���ȣ ���
SELECT * FROM student;
SELECT grade, studno, name, deptno FROM student ORDER BY 1;

SELECT 
    studno, name, deptno 
FROM 
    student 
WHERE
--    grade = 1; --�׷��̵尡 ���ڿ��̹Ƿ�
--    TO_NUMBER(grade) = 1; >> �����δ� �̷��� �ڵ�����ȯ�ؼ� ����
    grade = '1'; --�̰� ���� ȿ����
    
DESC STUDENT; --�׷��̵� �������¹�

--�л� ���̺��� ������ 70kg ������ �л��� �˻��Ͽ� �̸� �г� �а���ȣ ������ ���
SELECT * FROM student;
SELECT studno, name, grade, deptno, weight 
FROM student 
WHERE weight <= 70 ;

--�л� ���̺��� 1�г��̸鼭 ������ 70kg �̻��� �л��� �˻��Ͽ� �̸� �г� �а���ȣ ������ ���
SELECT * FROM student;

SELECT 
    studno, name, grade, deptno, weight 
FROM 
    student 
WHERE 
    grade = 1
AND
    weight >= 70 ;
    
--�л� ���̺��� 1�г��̰ų� �����԰� 70kg �̻��� �л��� �˻��Ͽ� �̸�, �г�, ������, �а���ȣ�� �t���Ͽ���
SELECT 
    studno, name, grade, deptno, weight 
FROM 
    student 
WHERE 
    grade = 1
OR
    weight >= 70 ;
    
--BETWEEN �����ڸ� ����Ͽ� �����԰� 50kg���� 70kg ������ �л��� �й�, �̸�, �����Ը� �t���Ͽ���
SELECT
    studno, name, weight
FROM
    student
WHERE 
--    weight 
    -- �ܼ��������϶��� �ص忬���ڰ� �� ª���� ������ ���� ��Ʈ���� �ξ� ȿ����
    weight * 2.2
    -- ���� pound�θ� �ٲ㵵 �׷���
BETWEEN 
    50 AND 70;
    
--�л����̺��� 81�⿡�� 83�⵵�� �¾ �л��� �̸��� ��������� ����ض�
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


--ANDŸ������ �ϴ¹�
SELECT 
    name, birthdate 
FROM 
    student
WHERE 
    TO_CHAR(birthdate, 'YY') >= 81
AND 
    TO_CHAR(birthdate, 'YY') <= 83;
    
--INŸ������ �ϴ� ��
SELECT 
    name, birthdate 
FROM 
    student
WHERE 
    TO_CHAR(birthdate, 'YY') 
IN 
    (81, 82, 83);

--IN �����ڸ� ����Ͽ� 102�� �а��� 201�� �а� �л��� �̸�, �г�, �а���ȣ�� �t���Ͽ���
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


--or �����ڷ�
SELECT 
    name, grade, deptno 
FROM 
    student
WHERE 
    deptno = 102 OR deptno = 201;
     
     
--LIKE������
-- �л� ���̺��� ���� ?��?���� �л��� �̸�, �г�, �а� ��ȣ�� �t���Ͽ���
SELECT 
    name, grade, deptno
FROM 
    student
WHERE
    name
LIKE
    '��%'
ORDER BY 1;

--�̸��߿� '��'�� ���� �л��� �й�, �̸� ��ȸ
SELECT 
    name, grade, deptno
FROM 
    student
WHERE
    name
LIKE
    '_%��%'
ORDER BY 1;

INSERT INTO student(name) VALUES ('������');

--? �л� ���̺��� �̸��� 3����, ���� "��?���� ������ ���ڰ� "��?���� ������ �л��� �̸�, �г�, �а� ��ȣ�� �t���Ͽ���
SELECT * FROM student;
SELECT
    name, grade, deptno
FROM 
    student
WHERE
    name
LIKE
    '��_��';



