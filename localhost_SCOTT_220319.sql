SELECT * FROM emp;

--���̺��� ������ �������� ��ɹ�

DESC emp; --������̺�

SELECT * FROM salgrade;

SELECT ename, sal, sal*12+comm AS ANNSAL, comm FROM emp;

SELECT TO_CHAR(HIREDATE, 'YYYY'), COUNT(*)
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY');

SELECT * FROM EMP;

--������ ���»�� �ִ»��
SELECT ENAME, SAL, NVL2(COMM, 'O', 'X') COMM  FROM EMP;
--�̸� 7ĭ ��2���� ���� *
SELECT RPAD(SUBSTR(ENAME,1,2), 7, '*') ENAME, SAL, NVL2(COMM, 'O', 'X') COMM  FROM EMP;
 
SELECT * FROM dept;