--�μ����̺��Ǻμ��̸�Į������?��?��������ġ���t���Ͽ���
SELECT * FROM department;
SELECT
    dname, INSTR(dname, '��') AS "��"
FROM
    department;

--�������̺�������Į���ǿ��ʿ�?*?�K�ڸ������Ͽ�10����Ʈ�έt���ϰ�
--�������̴�Į���������ʿ�?+?�K�ڸ������Ͽ�12����Ʈ�έt���Ͽ���

SELECT
    position, LPAD(position, 10, '*') AS "*����",
    userid, RPAD(userid, 12, '+') AS "+����"
FROM 
    professor;
    
-- �л� ���̺��� �л� ID�� ���ڸ� �α��ڸ� *�� ���� ��ȭ��ȣ �޼��ڸ��� *�� ����
--INSTR, SUBSTR, LENGTH ���̻��
SELECT
    userid
    , RPAD(SUBSTR(userid, 0 , LENGTH(userid)-2), 12, '*') AS "**"
    ,tel
    ,SUBSTR(tel, 0, LENGTH(tel)-3) || '***' AS "***"
FROM
    student;
    
--�������̺���101�а��������ϱ������(���ٹ�����22��)�Ͽ�
--�Ҽ����Q°�ڸ��ͼ�°�ڸ������ݿø��������Ҽ������ʫQ°�ڸ������ݿø��������t���Ͽ���

SELECT * FROM professor;
SELECT
    deptno, sal
    , ROUND(sal/22, -1) AS "ROUND-1"
    , ROUND(sal/22) AS "ROUND"
    , ROUND(sal/22, 1) AS "ROUND1"
    , ROUND(sal/22, 2) AS "ROUND2"
FROM
    professor
WHERE 
    deptno = 101;
    
--�������̺���101�а��������ϱ������(���ٹ�����22��)�Ͽ�
--�Ҽ����Q°�ڸ��ͼ�°�ڸ����������������Ҽ������ʫQ°�ڸ����������������t���Ͽ���
SELECT
    deptno, sal
    , TRUNC(sal/22, -1) AS "TRUNC-1"
    , TRUNC(sal/22) AS "TRUNC"
    , TRUNC(sal/22, 1) AS "TRUNC1"
    , TRUNC(sal/22, 2) AS "TRUNC2"
FROM
    professor
WHERE 
    deptno = 101;
    
--?�������̺���101���а������Ǳ޿��������������γ���������������Ͽ��t���Ͽ���
SELECT
    deptno, sal, comm
    , MOD(sal, comm) AS "TRUNC-1"
FROM
    professor
WHERE 
    deptno = 101;
    
--��¥
SELECT 
    TO_DATE('2022', 'YYYY') + 2022
FROM 
    DUAL;
    
--?������ȣ��9908�α������Ի��������������Ի�30���Ŀ�60�����ǳ�¥���t���Ͽ���
DESC professor; 
--������Ÿ��Ȯ��

SELECT
    profno, name
    , hiredate
    , hiredate + 30
    , hiredate + 60
FROM
    professor
WHERE
    profno = 9908;
    
--�Ի����� 330�����̐��α�����
--������ȣ, �Ի���, �Ի��Ϸκ����n���ϱ����ǰ�����, �Ի��Ͽ���6�������ǳ�¥���t���Ͽ���
--�Ի��� +17��
DESC professor;
SELECT 
    name
    , profno
    , sysdate AS "���糯¥"
    , hiredate AS "�Ի���"
    , ADD_MONTHS(hiredate, 17*12) AS "�Ի���+17y"
    , ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)) AS "~����"
    , ADD_MONTHS(hiredate, 6) AS "~6����"
FROM
    professor
WHERE
    ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)) < 330
ORDER BY 4;
    
--�����̼������Ǹ�������¥�ʹٰ������Ͽ����ǳ�¥���t���Ͽ���
SELECT 
    sysdate,
    LAST_DAY(sysdate) AS "3�� ����",
    NEXT_DAY(sysdate, 1) AS "�ٰ������Ͽ���",
    NEXT_DAY(sysdate+3, 4) AS "3/6���� ������"
FROM
    DUAL;
    
--�ÁA���������������, ROUND �Լ���TRUNC �Լ��ǰ�����������̴�
SELECT 
    SYSDATE,
    TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') AS NOW
    ,TO_CHAR(TRUNC(SYSDATE), 'YY/MM/DD HH24:MI:SS') AS TRUNC
    ,TO_CHAR(ROUND(SYSDATE), 'YY/MM/DD HH24:MI:SS') AS ROUND
FROM 
    DUAL;
    
--101���а����������Ի�������, ��, �����������ιݿø��Ͽ��t���Ͽ���.
SELECT
    profno, name, hiredate
    , TO_CHAR(HIREDATE, 'YYYY/MM/DD HH24:Mi:SS') AS R1
    , TO_CHAR(ROUND(HIREDATE, 'HH24'), 'YYYY/MM/DD HH24:Mi:SS') AS R2
    , TO_CHAR(ROUND(HIREDATE, 'DD'), 'YYYY/MM/DD HH24:Mi:SS') AS R3
    , TO_CHAR(ROUND(HIREDATE, 'MM'), 'YYYY/MM/DD HH24:Mi:SS') AS R4
FROM 
    professor
WHERE 
    deptno = 101;
    
    
SELECT '22-02-02' - 1 FROM DUAL;

INSERT INTO STUDENT(name, birthdate) VALUES ('�Ż���', SYSDATE);
INSERT INTO STUDENT(name, birthdate) VALUES ('�Ż���', '22/02/02');

SELECT * FROM STUDENT;

SELECT SUBSTR(BIRTHDATE, 1, 2) FROM STUDENT;


--TO_CHAR

--?�л����̺����������л����й�����������߿���������t���Ͽ���
SELECT
    studno, name, TO_CHAR(birthdate, 'YYYY/MM')
FROM 
    student
WHERE
    studno = 10101;
    
--�л����̺���102���а��л����̸�, �г�, ����������t���Ͽ���
SELECT
    name, grade, birthdate,
    TO_CHAR(birthdate, 'DAY MON DD YYYY A.M. "TEXT�����ִ�"')
FROM
    student
WHERE
    deptno = 102;
    
--�������̺���101���а����������̸�, ����, �Ի������t���Ͽ���
SELECT
    deptno, name, position, hiredate
    , TO_CHAR(hiredate, 'Mon, "the" DDTH "of" YYYY DDSPTH')
FROM
    professor
WHERE
    deptno = 101;
    
    
--�����������޴±��������̸�, �޿�, ��������, 
--�׸���޿��ͺ�����������������12������������������έt���Ͽ���.
SELECT 
    name, sal, comm 
    , TO_CHAR((sal + comm) * 12, '9,999') AS "ANNUAL"
FROM
    professor
WHERE 
    comm IS NOT NULL;
    
--�� ���ں��� Ŀ���Ծ�
SELECT TO_NUMBER('1,234,567,890', '9,999,999,999') + 1 FROM DUAL;

--�ֹε�Ϲ�ȣ��������������߭t�Ͽ�?YY/MM/DD?���·έt���Ͽ���.
SELECT
    name, idnum
    ,SUBSTR(idnum, 1, 6) AS "TRIM"
    ,TO_DATE(SUBSTR(idnum, 1, 6), 'YYMMDD') AS "BIRTHDATE"
    ,TO_CHAR(TO_DATE(SUBSTR(idnum, 1, 6), 'YY/MM/DD')) AS "BIRTHDATE1"
FROM
    student
WHERE
    idnum IS NOT NULL
ORDER BY 2;


--NVL(P1, P2) : P! NULL�� ���ɼ��� �ִ� �� P2 : NULL �� ��� ��ü��
-- 201���а��������̸�, ����, �޿�, ��������, �޿��ͺ����������հ踦�t���Ͽ���.
--��, ����������NULL�ΰ�쿡�º���������0���ΰ������.
SELECT 
    name, position, 
    sal, comm, 
    sal+comm AS "�հ�",
    sal+NVL(comm, 0) AS "���� 0",
    NVL(sal+comm, sal) AS "��ü��"
FROM
    professor
WHERE 
    deptno = 201;
    
SELECT
    name, position,
    sal, comm,
    NVL2(comm, sal+comm, SAL) AS "NVL2 total"
FROM 
    professor
WHERE
    deptno = 201;
    
    
--COALESCE
SELECT 
    COALESCE(NULL, 1, 2),
    NVL(NVL(NULL,1),2)
FROM DUAL;


--�������̺��������ǼҼ��а���ȣ���а��̸����κ��Q�Ͽ��t���Ͽ���. 
--�а���ȣ��101�̸�?��ǻ�Ͱ��а�?, 102�̸�?��Ƽ�̵���а�?, 201�̸�?���ڰ��а�?, 
--�������а���ȣ��?�����а�?(default)�κ��Q����.

SELECT
    deptno, dname
FROM
    department;
    
SELECT 
    profno
    , deptno
    , DECODE(deptno ,
        101,'��ǻ�Ͱ��а�',
        102,'��Ƽ�̵���а�',
        201,'���ڰ��а�',
        '�����а�') AS "DECODE"
FROM
    professor;

DESC department;

-- �л����� �¾ �޿� ���� ���� ���
SELECT
    name, birthdate
    , SUBSTR(birthdate, 4,2) AS "�߶󳻱�"
    , TO_CHAR(birthdate, 'MM') AS "�߶󳻱�1"
    , DECODE(SUBSTR(birthdate, 4,2),
        01, '�ܿ�',
        02, '�ܿ�',
        03, '��',
        04, '��',
        05, '��',
        06, '����',
        07, '����',
        08, '����',
        09, '����',
        10, '����',
        11, '����',
        12, '�ܿ�') AS "����"
FROM
    student;
    
SELECT
    name, birthdate
    , TO_CHAR(birthdate, 'MM') AS "�߶󳻱�1"
    , TRUNC(TO_CHAR(birthdate, 'MM') / 3) AS "�߶󳻱�"
    , DECODE(TRUNC(TO_CHAR(birthdate, 'MM') /3),
        1, '��',
        2, '����',
        3, '����',
        '�ܿ�') AS "season" 
FROM
    student;
    
    