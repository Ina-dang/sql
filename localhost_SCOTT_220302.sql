--�μ�10��30�����ϴ¸�������̸����μ���ȣ���̸��Ǿ��ĺ����������ĵǵ������ǹ��������϶�.

SELECT * FROM emp;

SELECT
    ename, empno, deptno
FROM
    emp
WHERE
    deptno in (10,30)
ORDER BY 1;


-- 1982�⿡�Ի��Ѹ�������̸����Ի��������ϴ����ǹ���?
SELECT * FROM emp;

SELECT
    ename, hiredate
FROM
    emp
WHERE
    hiredate LIKE '82%';
    
-- ���ʽ����޴¸���������ؼ��̸�, �޿��׸����ʽ�������ϴ����ǹ��������϶�. 
-- �ܱ޿��ͺ��ʽ������ؼ�������������
SELECT * FROM emp;
SELECT
    ename, sal, comm
FROM
    emp
ORDER BY 
    comm DESC, 2 DESC;

--���ʽ����޿���20% �̻��̰�μ���ȣ��30�θ�������������ؼ�
--�̸�, �޿��׸����ʽ�������ϴ����ǹ��������϶�

SELECT 
    deptno, ename, sal, comm
FROM
    emp
WHERE
    comm >= sal*0.2
AND
    deptno = 30;

