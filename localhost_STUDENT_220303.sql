--�������̺����Ҽ��а������󺸳ʽ����ٸ��԰���Ͽ��t���Ͽ���. �а���ȣ���κ��ʽ��´��������̰������.
--�а���ȣ��101�̸麸�ʽ��±޿���10%, 102�̸�20%, 201�̸�30%, �������а���0%�̴�.

SELECT 
    name, sal, deptno,
    DECODE(deptno,
        101, sal * 0.1,
        102, sal * 0.1,
        103, sal * 0.1,
        0 ) BONUS, --�̷����� DECODE�� �� ��������
    CASE deptno
        WHEN 101 THEN sal * 0.1
        WHEN 102 THEN sal * 0.1
        WHEN 103 THEN sal * 0.1
        ELSE 0
    END BONUS1
FROM
    professor;
    


SELECT
    studno, name, birthdate, TO_CHAR(birthdate, 'MM') AS "��",
    CASE
        WHEN TO_CHAR(birthdate, 'MM') IN (3,4,5) THEN '��'
        WHEN TO_CHAR(birthdate, 'MM') BETWEEN 6 AND 8 THEN '����'
        WHEN TO_CHAR(birthdate, 'MM') BETWEEN 9 AND 11 THEN '����'
        ELSE '�ܿ�'
    END AS "seasons"
    
FROM
    student;
    
    

--��������
SELECT  
    studno,
    name,
    CASE
        WHEN M IN (3,4,5) THEN '��'
        WHEN M BETWEEN 6 AND 8 THEN '����'
        WHEN M BETWEEN 9 AND 11 THEN '����'
        ELSE '�ܿ�'
    END AS "seasons"
FROM (
    SELECT
        studno, name, birthdate, TO_CHAR(birthdate, 'MM') AS "M"
    FROM
        student
);


SELECT
    deptno
FROM
    student
WHERE 
    deptno IS NOT NULL
GROUP BY
    deptno
HAVING 
    COUNT(deptno) <= 5 ;
    
    
--101���а������߿��������������޴±����Ǽ����t���Ͽ���.
SELECT
    COUNT(comm)
FROM
    professor
WHERE 
    deptno = 101;
    
--?101���а��л����Ǹ�������հ��հ踦�t���Ͽ���.
SELECT
    SUM(WEIGHT), AVG(WEIGHT)
FROM
    student
WHERE 
    deptno = 101;
    
--102���а��л��߿����ִ�Ű���ּ�Ű���t���Ͽ���.
SELECT
    MAX(height), MIN(height)
FROM   
    student
WHERE
    deptno = 102;
    

SELECT
    deptno, COUNT(deptno)
FROM
    student
WHERE 
    deptno IS NOT NULL
GROUP BY
    deptno;
    
    
SELECT
    position, COUNT(*)
FROM
    professor
GROUP BY position;    
    
SELECT
    deptno, position, COUNT(*)
FROM
    professor
GROUP BY deptno, position;


--�������̺����а����α������ͺ����������޴±��������t���Ͽ���
SELECT
    deptno, COUNT(*), COUNT(COMM)
FROM
    professor
GROUP BY 
    deptno
ORDER BY 1;


--�а����μҼӱ���������ձ޿�, �ּұ޿�, �ִ�޿����t���Ͽ���.
SELECT
   deptno, AVG(SAL), MIN(SAL), MAX(SAL)
FROM
    professor
GROUP BY 
    deptno;

--�׻� �׷���̴� ����� �����ؾ��Ѵ�
SELECT 
    deptno, sal
FROM
    professor
ORDER BY 1  ;



--��ü�л����Ҽ��а����γ�����, �����а��л����ٽ��г⺰�α׷����Ͽ�, �а����г⺰�ο���, ��ո����Ը��t���Ͽ���, 
--��, ��ո����Դ¼Ҽ������ϫQ��°�ڸ������ݿø�����.

SELECT
    deptno, grade, COUNT(*), ROUND(AVG(WEIGHT))
FROM 
    STUDENT
WHERE 
    deptno IS NOT NULL
GROUP BY
    deptno, grade
ORDER BY 1, 2;


--�Ҽ��а����α����޿��հ�͸���а��������Ǳ޿��հ踦�t���Ͽ���
SELECT
    deptno, sum(sal)
FROM
    professor
GROUP BY
    ROLLUP(deptno);
    
--ROLLUP �����ڸ��̿��Ͽ��а������޺�������, �а���������, ��ü���������t���Ͽ���.
SELECT
    deptno, position, count(*), GROUPING(deptno), GROUPING(position)
FROM
    professor
GROUP BY
    ROLLUP(deptno, position);
--    CUBE(deptno, position);



--�а��������г⺰�ο������¾�⵵���ο������t���Ͽ���.
SELECT
    deptno, grade, TO_CHAR(birthdate, 'YY') AS YY, count(*)
FROM
    student
GROUP BY
    GROUPING SETS((deptno, grade), (deptno, TO_CHAR(birthdate, 'YY')));
    
    
    
--�л�����4���̻����г⿡���ؼ��г�, �л���, ���Ű, ��ո����Ը��t���Ͽ���.
-- ��, ���Ű����ո����Դ¼Ҽ����Q��°�ڸ������ݿø��ϰ�, �t�¼��������Ű�����������ͳ����������έt���Ͽ���
SELECT
    grade, COUNT(*), ROUND(AVG(height)), ROUND(AVG(weight))
FROM
    student
WHERE
    grade IS NOT NULL
GROUP BY
    grade
HAVING
    COUNT(*) >= 4
ORDER BY
    3 DESC;
    
SELECT
    grade, count(grade)
FROM
    student
GROUP BY
    grade;
    
    
--�а��� �л��� ��� ������
SELECT 
    deptno, AVG(weight)
FROM 
    student
WHERE 
    deptno IS NOT NULL
GROUP BY 
    deptno
ORDER BY 1;

--�а��� �л��� ��� �������� �ִ� ��� ������
SELECT 
    deptno, MAX(AVG(weight))
FROM 
    student
WHERE 
    deptno IS NOT NULL
GROUP BY 
    deptno
ORDER BY 1;


    
--�а��� �л��� ��� �������� �ִ� ��� ������
SELECT DEPTNO, A_WEIGHT
FROM
    (SELECT
        deptno, AVG(weight) A_WEIGHT
    FROM
        student
    GROUP BY
        deptno) A,
    (SELECT
        MAX(AVG(weight)) B_WEIGHT
    FROM
        student
    GROUP BY 
        deptno) B
WHERE B.B_WEIGHT = A.A_WEIGHT;



--������ �̿��� �л��̸��� �а��̸� �˻�
SELECT 
    studno, name,
    student.deptno, 
    department.dname
FROM
    student, department
WHERE
    student.deptno = department.deptno;
    
    
SELECT
    *
FROM
    (SELECT
        rownum A
    FROM
        dict
    WHERE
        rownum <=4) A,    
    (SELECT
        (rownum-1) * 2 + 1 B
    FROM
        dict
    WHERE
        rownum <=3) B
WHERE A.A = B.B;


SELECT 
    studno, name, D.deptno, dname
FROM 
    student S, department D
WHERE
    S.deptno = D.deptno;
    
SELECT 
    *
FROM
    student;
    
    
--??������?�л����й�, �̸�, �а��̸��׸����а���ġ���t���Ͽ���.
SELECT
    studno, name, dname, loc
FROM
    student S, department D
WHERE
    name = '������'
AND
    S.deptno = D.deptno;
    
    
SELECT
    studno, name, dname, loc
FROM
    student
NATURAL JOIN 
    department
WHERE
    name = '������';
        
        
-- �й�, �л��̸�, ������ȣ, ��米���̸�
SELECT
    studno, S.name, S.profno, P.name
FROM
    student S, professor P
WHERE
    S.profno = P.profno;
    
    
SELECT
    *
FROM
    student, professor;

--ASNI grammer
SELECT
    studno, S.name, S.profno, P.name
FROM
    student S
JOIN 
    professor P
ON
    S.profno = P.profno;
    
SELECT
    studno, S.name, profno, P.name
FROM
    student S
JOIN 
    professor P
USING
    (profno);
    
    
