SELECT * FROM STUDENT;

--�л� ���̺��� �й�, �̸�, �а���ȣ ��ȸ
SELECT studno, name, deptno FROM student;

--�л� ���̺��� �а���ȣ ���ļ� ��ȸ
SELECT deptno FROM student ORDER BY 1;

--�л� ���̺��� �а���ȣ �ߺ������� ������ȸ
SELECT DISTINCT deptno FROM student ORDER BY 1;

SELECT ALL name, deptno FROM student; --���ǻ� ALL ����

SELECT DISTINCT 
    name, deptno 
FROM
    student
WHERE
    deptno = 201 --conditional
ORDER BY 1;


-- �л����̺��� �а� �� �ο����� ��ȸ
SELECT 
    deptno, COUNT(*)
FROM  
    student
GROUP BY 
    deptno
HAVING COUNT
    (*) >= 5;


SELECT * FROM STUDENT;    
-- �л� ���̺��� �ߺ��Ǵ� �а���ȣ�� �����ϰ� ���
SELECT DISTINCT deptno FROM student;

-- �л� ���̺��� �ߺ��Ǵ� �а���ȣ, �г� �����ϰ� ���
SELECT DISTINCT deptno, grade FROM student ORDER BY 1, 2;

--�پ��� ���Ĺ��
SELECT DISTINCT deptno, grade FROM student ORDER BY 1 DESC, 2 DESC;
SELECT deptno, grade FROM student ORDER BY studno;

--�����ͺ��̽� ���ڿ� ���ͷ� : ''
SELECT 'HELLO WORLD' FROM DUAL;
SELECT 'HELLO WORLD' FROM student; --��Ʃ��Ʈ �� 17����ŭ�� ����� ����

--�л��� �̸��� '�ȳ�' ����
SELECT name || '�ȳ�' FROM student; --����Ŭ������ ����
SELECT CONCAT(name, '�ȳ�') AS HI FROM STUDENT S; --��������

--�й��� "�й�" �̸����� "�̸�" 
SELECT studno AS "�й�", name AS "�̸�" FROM STUDENT;
SELECT studno "�й�", name "�̸�" FROM STUDENT;

--�μ����̺� �μ��̸� ����"dept_name", �μ���ȣ Į���� ������ "DN"
SELECT * FROM department;
SELECT dname, deptno FROM department;
SELECT 
    dname AS "dept_name",
    deptno AS "DN" 
FROM 
    department;

--�л����̺��� �й��� �̸�Į�� ���� "Student"���� ���̱�
SELECT * FROM student;
SELECT studno, name FROM student;
SELECT studno || name FROM student;
SELECT studno || name AS "Student" FROM student;
SELECT studno || ' ' || name As "Student" FROM student ORDER BY 1;

SELECT * FROM department;
SELECT deptno, dname FROM department;
SELECT deptno || dname FROM department;
SELECT deptno || ' ' || dname AS "department" FROM department ORDER BY 1;

--�л� ������ poundȯ�� Į���̸� weight_pound 1kg�� 2.2
SELECT * FROM student;
SELECT studno, name, weight FROM student;
SELECT studno, name, weight, weight * 2.2 AS "weight_pound" FROM student ORDER BY 1;

/* ���� �߿侲
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
*/

SELECT deptno, COUNT(*)
FROM student
WHERE weight IS  NOT NULL
GROUP BY deptno
HAVING COUNT(deptno) >= 5
ORDER BY deptno;

-- ��ǻ�ʹ� FROM >> HAVING >> GROUP BY >> WHERE >> SELECT >> ORDER BY ������ �ؼ�

SELECT * FROM STUDENT;


--���̺� ����
CREATE TABLE EX_TYPE (
    C CHAR(10), --C��� �̸��� CHARŸ�Ժ����� 10ĭ
    V VARCHAR(10) --2����� ��
);

--���̺� ����
DROP TABLE EX_TYPE;

--������ �Է�
INSERT INTO EX_TYPE VALUES ('sql', 'sql');
SELECT * FROM EX_TYPE;
SELECT * FROM EX_TYPE;

--
SELECT * 
FROM EX_TYPE
--WHERE c = 'sql'; --�Ѵٰ���
WHERE c = 'sql           ';

SELECT *
FROM EX_TYPE
WHERE v = 'sql';
--WHERE v = 'sql       '; --�Ұ���

SELECT *
FROM EX_TYPE
WHERE C = V || '       '; --��� �� ���
--WHERE C = V; --������̰� �ٸ��Ƿ� ����

--���� ����
RTRIM('abc   ');
LTRIM('    abc');

SELECT 1
FROM DUAL
--WHERE 1=0; --�����̶� �ȳ���
--WHERE 1=1; --���̶� ����
WHERE 1='1'; --���̶� ����, ���ڷ� Ÿ�� ����


SELECT 3.14 + 1 FROM DUAL;
SELECT studno, name, birthdate, sysdate, ROUND(sysdate-birthdate) FROM STUDENT WHERE studno = 10101;

--�� ��¥ ���
SELECT SYSDATE - TO_DATE('93/07/07') FROM DUAL;

SELECT SYSDATE FROM DUAL; --����Ϸг���

SELECT 
--    "NOW"
    TO_CHAR(SYSDATE , 'YY/MM/DD HH24:MI:SS') NOW,
--    "1DAY AFTER"
    TO_CHAR(SYSDATE + 1  , 'YY/MM/DD HH24:MI:SS') AS "1DAY AFTER",
--    "3 HOURS AFTER"
    TO_CHAR(SYSDATE + 3/24 , 'YY/MM/DD HH24:MI:SS') AS "3HOURS AFTER",
--    "30MINUTS AFTER"
    TO_CHAR(SYSDATE + 30/24/60 , 'YY/MM/DD HH24:MI:SS') AS "30MINUTES AFTER",

    ADD_MONTHS(SYSDATE, 1) AS "ADD MONTHS"
FROM DUAL; --������

SELECT TO_CHAR(TO_DATE('83/05/09'), 'YY/MM/DD HH24:MI:SS') FROM DUAL;
SELECT ROUND(SYSDATE) FROM DUAL;
SELECT ROUND(SYSDATE -1/24, 'YY') FROM DUAL;
SELECT ROUND(SYSDATE -1/24, 'MM') FROM DUAL;

SELECT ROWID, S.* FROM STUDENT S; --�������� �� �Ⱦ�
SELECT ROWNUM, S.* FROM STUDENT S ORDER BY STUDNO DESC; --��� �� �߾��� >> ��ȸ�ÿ� ���Դ� ����� ����
