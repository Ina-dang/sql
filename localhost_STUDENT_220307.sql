SELECT deptno FROM student;

SELECT s.name, studno, s.deptno, profno, p.name, position
FROM student S
LEFT JOIN professor P USING(profno)
ORDER BY profno, studno;





SELECT *
FROM professor
WHERE position = '����';

--����� ���̵� ?jun123?�� �л��� ���� �г��� �л��� �й�, �̸�, �г��� �t���Ͽ���
SELECT * FROM STUDENT;

SELECT studno, name, grade
FROM student
WHERE 
    GRADE = ( 
        SELECT grade
        FROM student
        WHERE userid = 'jun123'
    );

--101�� �а� �л����� ��� �����Ժ��� �����԰� ���� �л��� �̸�, �а���ȣ, �����Ը� �t���Ͽ���
SELECT
    name, deptno, weight
FROM
    student
WHERE 
    WEIGHT <     
    (SELECT 
        AVG(weight)
    FROM
        student
    WHERE
        deptno=101);
        
--20101�� �л��� �г��� ����, Ű�� 20101�� �л����� ū �л��� �̸�, �г�, Ű�� �t���Ͽ���
(SELECT grade
FROM student
WHERE studno = 20101);

SELECT height
FROM student
WHERE studno = 20101;

SELECT name, grade, height
FROM student
WHERE 
    grade = (
        SELECT grade
        FROM student
        WHERE studno = 20101
    )
AND 
    height > (
    SELECT height
    FROM student
    WHERE studno = 20101
    ) ;

--�����̵���к�(�μ���ȣ:100)�� �Ҽӵ� ��� �л��� �й�, �̸�,�а� ��ȣ�� �t���Ͽ���

SELECT studno, name, deptno
FROM student
WHERE deptno IN (
    SELECT deptno
    FROM department
    WHERE college = (
        SELECT deptno
        FROM department
        WHERE dname = '�����̵���к�'
        )
    );
    
    
--��� �л� �߿��� 4�г� �л� �߿��� Ű�� ���� ���� �л����� Ű�� ū �л��� �й�, �̸�, Ű�� �t���Ͽ���

SELECT studno, name, height
FROM student
WHERE height > ANY (
    SELECT height
    FROM student
    WHERE grade = 4
    );
    
SELECT studno, name, height
FROM student
WHERE height > (
    SELECT MIN(height)
    FROM student
    WHERE grade = 4
    );
    
---��� �л� �߿��� 4�г� �л� �߿��� Ű�� ���� ū �л����� Ű�� ū �л��� �й�, �̸�, Ű�� �t���Ͽ���
SELECT studno, name, height
FROM student
WHERE height > ALL (
    SELECT height
    FROM student
    WHERE grade = 4
    );
    
SELECT studno, name, height
FROM student
WHERE height > (
    SELECT MAX(height)
    FROM student
    WHERE grade = 4
    );
    
---��� �л� �� Ű�� ���� ū 4�г� �л� ���� Ű�� ���� �л��� �й�, �̸�, Ű�� �t���Ͽ���
SELECT height
FROM student
WHERE grade = 4;
    
SELECT studno, name, height
FROM student
WHERE height < ANY (
    SELECT height
    FROM student
    WHERE grade = 4
    );
    
SELECT studno, name, height
FROM student
WHERE height < (
    SELECT MAX(height)
    FROM student
    WHERE grade = 4
    )
ORDER BY 3;

--���������� �޴� ������ �� ���̶� ������ ��� ������ ������ȣ, �̸�, �������� �׸��� �޿��� ���������� ���� �t���Ͽ��� 

SELECT profno, name, comm, sal+comm
FROM professor
WHERE EXISTS (
    SELECT *
    FROM professor
    WHERE comm IS NOT NULL
    )
ORDER BY 3;
    
SELECT profno, name, comm, sal+comm
FROM professor
WHERE NOT EXISTS (
    SELECT *
    FROM professor
    WHERE comm IS NOT NULL
    );

--PAIRWISE �� ����� ���� �г⺰�� �����԰� �ּ��� �л��� �̸�, �г�, �����Ը� �t���Ͽ���
 
SELECT
    name, grade, weight
FROM
    student
WHERE 
    (GRADE, WEIGHT) IN (
    SELECT 
        grade, MIN(weight)
    FROM
        student
    GROUP BY grade
    )
ORDER BY 2,3;
    
-- UNPAIRWISE �� ����� ���� �г⺰�� �����԰� �ּ��� �л��� �̸�, �г�, �����Ը� �t���Ͽ���
SELECT
    name, grade, weight
FROM
    student
WHERE GRADE IN (
    SELECT 
        grade
    FROM
        student
    GROUP BY grade)
AND WEIGHT IN (
    SELECT
        MIN(weight)
    FROM
        student
    GROUP BY grade
    )
ORDER BY 3;

--�� �а� �л��� ��� Ű���� Ű�� ū �л��� �̸�, �а� ��ȣ, Ű�� �t���Ͽ���

SELECT 
    studno, name, deptno, height
FROM 
    student S1
WHERE 
    height > (
    SELECT
    AVG(height)
    FROM
        student S2
    WHERE S1.deptno = S2.deptno
    GROUP BY deptno
    );
    
--�й�, �̸�, �а���ȣ, �а��̸��� ���Ѱ��� join, subquery��

SELECT
    studno, name, deptno
FROM
    student;
    
SELECT
    deptno, dname
FROM
    department;

SELECT studno, name, S.deptno, dname
FROM
    student S
JOIN 
    department D ON s.deptno = d.deptno;

SELECT studno, name, deptno, dname
FROM student
NATURAL JOIN department;

SELECT studno, name, s.deptno, (
    SELECT
        dname
    FROM
        department D
    WHERE
        d. deptno = s. deptno) dname
FROM student s;


--+ �������̸���� (����)
SELECT studno, name, profno, (
    SELECT
        name
    FROM
        professor P
    WHERE
        p.profno = s.profno) pname, (
    SELECT
        dname
    FROM
        department D
    WHERE
        d. deptno = s. deptno) dname
FROM student s;


--ȫ�浿
INSERT INTO student
VALUES (10110, 'ȫ�浿', 'hong', '1', '850101143098', '85/01/01', '041)630-3114', 170,70, 101,9903);

SELECT * FROM STUDENT;

ROLLBACK;

COMMIT;






