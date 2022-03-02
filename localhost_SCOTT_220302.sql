--부서10과30에속하는모든사원의이름과부서번호를이름의알파벳순으로정렬되도록질의문을형성하라.

SELECT * FROM emp;

SELECT
    ename, empno, deptno
FROM
    emp
WHERE
    deptno in (10,30)
ORDER BY 1;


-- 1982년에입사한모든사원의이름과입사일을구하는질의문은?
SELECT * FROM emp;

SELECT
    ename, hiredate
FROM
    emp
WHERE
    hiredate LIKE '82%';
    
-- 보너스를받는모든사원에대해서이름, 급여그리고보너스를출력하는질의문을형성하라. 
-- 단급여와보너스에대해서내림차순정렬
SELECT * FROM emp;
SELECT
    ename, sal, comm
FROM
    emp
ORDER BY 
    comm DESC, 2 DESC;

--보너스가급여의20% 이상이고부서번호가30인많은모든사원에대해서
--이름, 급여그리고보너스를출력하는질의문을형성하라

SELECT 
    deptno, ename, sal, comm
FROM
    emp
WHERE
    comm >= sal*0.2
AND
    deptno = 30;

