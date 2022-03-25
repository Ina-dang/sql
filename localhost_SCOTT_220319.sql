SELECT * FROM emp;

--테이블의 구조를 보기위한 명령문

DESC emp; --사원테이블

SELECT * FROM salgrade;

SELECT ename, sal, sal*12+comm AS ANNSAL, comm FROM emp;

SELECT TO_CHAR(HIREDATE, 'YYYY'), COUNT(*)
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY');

SELECT * FROM EMP;

--성과금 없는사람 있는사람
SELECT ENAME, SAL, NVL2(COMM, 'O', 'X') COMM  FROM EMP;
--이름 7칸 앞2글자 빼고 *
SELECT RPAD(SUBSTR(ENAME,1,2), 7, '*') ENAME, SAL, NVL2(COMM, 'O', 'X') COMM  FROM EMP;
 
SELECT * FROM dept;