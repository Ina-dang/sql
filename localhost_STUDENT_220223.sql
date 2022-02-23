--�Ʊ� ����־��� �����ͺ��̽��� ���
SELECT * FROM STUDENT;

--�л����� Ű ���� ����
SELECT * FROM STUDENT ORDER BY HEIGHT DESC;

--�л����� �ο���, ���Ű, ��� ������
SELECT COUNT(*), AVG(HEIGHT),  AVG(WEIGHT) fROM STUDENT;

--�а��� �л����� �ο���, ���Ű, ���, ������
SELECT DEPTNO, COUNT(*), AVG(HEIGHT),  AVG(WEIGHT) fROM STUDENT GROUP BY DEPTNO;


SELECT * FROM PROFESSOR;
SELECT * FROM DEPARTMENT; 
SELECT * FROM SALGRADE; 

--��ο��� ���
SELECT 'HELLO WORLD' FROM DUAL;

--�л��� �й�, �̸�, �а��̸��� ��ȸ
--SELECT STUDNO, NAME, DNAME
--FROM STUDENT
--NATURAL JOIN DEPARTMENT;

SELECT STUDNO, NAME, DNAME
FROM STUDENT S, DEPARTMENT D
WHERE S.DEPTNO = D.DEPTNO;

SELECT STUDNO, NAME, (SELECT DNAME FROM DEPARTMENT D WHERE D.DEPTNO = S.DEPTNO) AS DNAME
FROM STUDENT S;


--���� ������ �����ͺ��̽� �������� ������ ��� ���̺� �Է�
SELECT * FROM TAB;

--�л� ���̺� ���� Ȯ��
DESC STUDENT;

--�ð����
SELECT SYSDATE FROM DUAL; --����
SELECT SYSDATE + 3 FROM DUAL; --3�� �� ���갡��
SELECT SYSDATE - 1 FROM DUAL; --�Ϸ����� ���ɾ�

--����
SELECT 1000 * 200 FROM DUAL;
SELECT 240 / 3 FROM DUAL;
SELECT 2 + 3 * 10 FROM DUAL;

--�μ����̺��� �μ��̸�(DNAME)�� �μ���ȣ(DEPTNO) ���
SELECT * FROM TAB; --�ִ������� Ȯ��
SELECT* FROM DEPARTMENT; --���� ���ִ��� Ȯ��
SELECT DNAME, DEPTNO FROM DEPARTMENT; --�� ���� Ȯ���ؼ� ���

--�������̺��� �����̸��� ������ ���
SELECT NAME, POSITION FROM PROFESSOR;

/* SQL ��ɹ��� ǥ�� ����
SELECT [DISTINCT] {*}
FROM TABLE
[WHERE CONDITION]
[GROUP BY GROUP_BY_EXPRESSION]
[HAVING GROUP_CONDITION]
[ORDER BY COLUMN];
*/

--�л����̺����ߺ��Ǵ��а���ȣ(deptno)�������ϰ�t���Ͽ���
SELECT DISTINCT DEPTNO FROM STUDENT;

--�л����̺����ߺ��Ǵ��а���ȣ, �г������ϰ�t���Ͽ���
SELECT * FROM STUDENT; 
SELECT DISTINCT DEPTNO, GRADE FROM STUDENT;



