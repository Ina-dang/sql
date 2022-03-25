
SELECT * FROM STUDENT;
SELECT * FROM PROFESSOR;
SELECT * FROM department;

SELECT deptno FROM student;
SELECT DISTINCT deptno FROM student;


SELECT DISTINCT deptno AS dn FROM student;

SELECT 
    dname || ' ' || name || '�Դϴ�' 
from 
    student 
JOIN
    department USING(deptno)
WHERE
    dname = '��ǻ�Ͱ��а�';


-- �л����� �й�, �̸�, �а��� �а��� �̸������� �˻��϶�
SELECT * FROM student;
SELECT * FROM department;

SELECT 
    studno, name, dname
FROM 
    student
JOIN
    department USING(deptno)
ORDER BY 3;

--�л����� ������ �а��� �г��� ���� ������ �˻��϶�
SELECT * FROM STUDENT ORDER BY GRADE DESC;

--�л����� ������ �а��� ������ 
SELECT * FROM STUDENT ORDER BY DEPTNO;

--�л����� �й�, �̸��� �а���, �г����� �˻�;
SELECT 
    STUDNO, NAME
FROM 
    STUDENT
ORDER BY 
    DEPTNO, GRADE;
    
--�л��� ���̵� �빮�ڷ� �˻�
SELECT * FROM STUDENT;
SELECT UPPER(USERID) FROM STUDENT;

--()�� ()�г� ()�Դϴ� �˻�
SELECT 
--    CONCAT(DNAME, '�� ', GRADE, '�г� ', NAME, '�Դϴ�.')
    DNAME || ' ' || GRADE || '�г� ' || NAME || '�Դϴ�.'
FROM
    STUDENT
JOIN 
    DEPARTMENT USING(DEPTNO);
    
--�л����� �̸�, �������̵� ù2���� �˻�
SELECT NAME, SUBSTR(USERID, 1, 2) AS "2"
FROM STUDENT;

-- �̸�, �а�, �а��� �ι�° ���� 1�ڸ�
SELECT NAME, DNAME, SUBSTR(DNAME, 2, 1) AS "1"
FROM STUDENT
JOIN DEPARTMENT USING(DEPTNO);

--�а���, �а��� ���� �˻�
SELECT DNAME, LENGTH(DNAME)
FROM DEPARTMENT;

SELECT * FROM STUDENT;

SELECT INSTR(NAME, '��') FROM STUDENT;

--�������̵� 10�ڸ��� ����� ��2�ڸ��� ���̰��ϱ�)
SELECT RPAD(SUBSTR(USERID,1,2), 10, '*') FROM STUDENT; 

--�й�, �̸�, Ű �˻�
SELECT 
    STUDNO, NAME, HEIGHT
FROM    
    STUDENT;
    
    
--�г⺰ ���Ű
SELECT
    GRADE, TRUNC(AVG(HEIGHT), 2)
FROM 
    STUDENT
GROUP BY
    GRADE;
    
-- ��� ���� ���°�� '��������'���� �˻�
SELECT * FROM STUDENT;

SELECT NVL(TO_CHAR(PROFNO), '��������') FROM STUDENT;

--���� Ű ū �л� �˻�
SELECT MAX(HEIGHT) FROM STUDENT;

--�г⺰ ��� ���� �˻�
SELECT TRUNC(AVG(HEIGHT), 2), GRADE
FROM STUDENT
GROUP BY GRADE
ORDER BY GRADE;

--�г⺰ �ο��� ���� ������ ����
SELECT GRADE, COUNT(*)
FROM STUDENT
GROUP BY GRADE
ORDER BY 2 DESC;

--�г⺰ ���ſ� ������ ����
SELECT GRADE, TRUNC(AVG(WEIGHT),2)
FROM STUDENT
GROUP BY GRADE
ORDER BY AVG(WEIGHT) DESC;

-- ���ڰ��а��� �����ϴ� �л����� �й��� �̸� �˻� 
SELECT * FROM DEPARTMENT;
SELECT 
    STUDNO, NAME, DNAME 
FROM 
    STUDENT
JOIN
    DEPARTMENT USING(DEPTNO)
WHERE 
    DNAME = '���ڰ��а�';
    
--�й� 101�Ǵ� 201�л����� STUDNO, NAME, DEPTNO �˻�
SELECT * FROM STUDENT;

SELECT STUDNO, NAME, DEPTNO
FROM STUDENT
WHERE DEPTNO = 101 OR DEPTNO = 201
ORDER BY DEPTNO;

--���� �达�� �л��� �й� �̸� ã��
SELECT STUDNO, NAME
FROM STUDENT
WHERE NAME LIKE '��%';











