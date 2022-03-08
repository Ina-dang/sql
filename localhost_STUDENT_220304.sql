--������ �л���

SELECT 
    * 
FROM
    student;
    
SELECT
    name,
    CASE 
    WHEN TO_CHAR(birthdate, 'MM') BETWEEN 3 AND 5 THEN '��' 
    WHEN TO_CHAR(birthdate, 'MM') BETWEEN 6 AND 8 THEN '����' 
    WHEN TO_CHAR(birthdate, 'MM') BETWEEN 9 AND 11 THEN '����' 
    ELSE '�ܿ�'
    END,
    count(*)        
FROM
    student
GROUP BY
   name, TO_CHAR(birthdate, 'MM');
   
   
   
   
-- �л� ź�� ������ �ο���

SELECT
    studno, name, birthdate, ADD_MONTHS(birthdate, -2), TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q')
FROM
    student;
    
SELECT 
    CASE
        WHEN TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q') = 1 THEN '��'
        WHEN TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q') = 2 THEN '����'
        WHEN TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q') = 3 THEN '����'
        ELSE '�ܿ�'
    END SEASONS, 
    COUNT(*)
FROM student
WHERE birthdate IS NOT NULL
GROUP BY TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q')
ORDER BY TO_CHAR(ADD_MONTHS(birthdate, -2), 'Q'); 


SELECT studno, name, S.deptno, dname
FROM student S, department D
WHERE S.deptno = d.deptno
AND studno = 10101;

SELECT * FROM student, department, professor;
--10101�л��� �й�, �̸�, �а���ȣ, �а��̸�, ��米����ȣ, ��米���̸�
SELECT 
    studno, S.name, S.deptno, dname, S.profno, P.name AS "��米��"
FROM 
    student S, department D, professor P
WHERE 
    S.deptno = D.deptno  --���߿� �ֵ��� �ܷ�Ű �ɰ���
    AND S.profno = P.profno --�ֵ��� �⺻Ű
    AND studno = 10101;


--10101�л��� �й�, �̸�, �а���ȣ, �а��̸�, ��米����ȣ, ��米���̸�
SELECT
    studno, S.name, S.deptno, dname, profno, P.name
FROM student S
JOIN department D ON S.deptno = D.deptno
JOIN professor P USING(profno)
WHERE studno = 10101;



SELECT * FROM student, department;
--ASNI
SELECT * FROM student CROSS JOIN department;


--�л����̺���μ����̺���EQUI JOIN�Ͽ��й�, �̸�, �а���ȣ, �Ҽ��а��̸�, �а���ġ���t���Ͽ���
SELECT * FROM student, department;
SELECT 
    name, deptno, dname, loc
FROM 
    student
NATURAL JOIN
    department
WHERE
    deptno = deptno ;
    
SELECT 
    name, deptno, dname, loc
FROM 
    student
JOIN
    department USING(deptno)
WHERE
    deptno = deptno ;
    
    
--NATURAL JOIN���̿��Ͽ�������ȣ, �̸�, �а���ȣ, �а��̸����t���Ͽ���.
SELECT profno, name, deptno, dname
FROM
    professor
NATURAL JOIN
    department;
    
--�������̺���޿�������̺���NON-EQUI JOIN�Ͽ��������α޿�������t���Ͽ���.
SELECT 
    name, sal, grade, hisal, losal
FROM
    professor
JOIN
    salgrade 
--ON sal BETWEEN losal AND hisal;
ON sal <= hisal AND sal >= losal;
    
SELECT * FROM professor;
SELECT * FROM salgrade;

--4�� 2��¥�� ���ڰ� ����� ���̺� �ΰ�
CREATE TABLE J1(
    A NUMBER,
    B NUMBER
);
CREATE TABLE J2(
    A NUMBER,
    C NUMBER
);   

INSERT INTO J1 VALUES (1, 1);
INSERT INTO J1 VALUES (2, 2);
INSERT INTO J1 VALUES (3, 3);
INSERT INTO J1 VALUES (4, 4);

INSERT INTO J2 VALUES (1, 5);
INSERT INTO J2 VALUES (2, 6);
INSERT INTO J2 VALUES (5, 6);
INSERT INTO J2 VALUES (NULL, 7);

SELECT * FROM J1, J2;
SELECT * FROM J2;

SELECT 
    *
FROM
    J1
NATURAL JOIN
    J2;
    
SELECT * FROM J1, J2;    
SELECT * FROM J1 JOIN J2 ON J1.A = J2.A;
SELECT * FROM J1 JOIN J2 ON J1.A != J2.A;
SELECT * FROM J1 CROSS JOIN J2;



SELECT * FROM STUDENT;

DELETE student WHERE studno = 30303 OR studno is null;

SELECT 
    DISTINCT studno
FROM 
    STUDENT
WHERE 
    profno IS NOT NULL
ORDER BY 1;

--���л��� 16 ��米�� ���� 6 �ִ� 10 
-- 8 ���� 3 �л����� ����

--���������� ���� �л��� ���
SELECT studno, s.name, profno, p.name
FROM
    student s
RIGHT JOIN
    professor p USING(profno);

--����л�, �������� ���� �л� ��� FULL
SELECT studno, s.name, profno, p.name
FROM
    student s
FULL JOIN
    professor p USING(profno);
    
    
--���������� ���� �л��鸸
SELECT studno, s.name, profno, p.name
FROM
    student s
LEFT JOIN
    professor p USING(profno)
WHERE
    profno IS NULL;
    
--����л��� ���� �����鸸
SELECT studno, s.name, profno, p.name
FROM
    student s
RIGHT JOIN
    professor p USING(profno)
WHERE
    studno IS NULL;
    
    
--���� ����
SELECT studno, s.name, profno, p.name
FROM
    student s
FULL JOIN
    professor p USING(profno)
WHERE
    profno IS NULL OR studno IS NULL;
    
    
    
--�л����̺���������̺��������Ͽ��̸�, �г�, �����������̸�, �������t���Ͽ���. 
--��, �����������������������л��̸����Բ��t���Ͽ���.

SELECT 
    s.name, grade, p.name AS "��������", position
FROM
    student s
LEFT JOIN
    professor p USING(profno)
ORDER BY 2, 1;


--(+)��� >> ������ ����
SELECT 
    s.name, grade, p.name AS "��������", position
FROM
    student s, professor p
WHERE
    s.profno = p.profno(+)
UNION ALL
SELECT 
    s.name, grade, p.name AS "��������", position
FROM
    student s, professor p
WHERE
    s.profno(+) = p.profno
ORDER BY 2, 1;

SELECT
    s.profno, p.profno, s.deptno, p.deptno
FROM student s, professor p;


--�μ����̺���SELF JOIN���̿��Ͽ��μ��̸��������μ����̸����t���Ͽ���.
SELECT * FROM department d1, department d2;

SELECT 
    d1.dname || '�� �����а���' || NVL2(d2.dname, d2.dname || '�Դϴ�', '�����ϴ�') AS RESULT
FROM 
    department d1
LEFT JOIN department d2 ON d1.college = d2.deptno;

SELECT * 
FROM 
    professor 
WHERE 
    position = (
    SELECT 
        position
    FROM
        professor
    WHERE 
        name = '������'
);



