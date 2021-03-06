--부서테이블의부서이름칼럼에서?과?글자의위치를춗력하여라
SELECT * FROM department;
SELECT
    dname, INSTR(dname, '과') AS "과"
FROM
    department;

--교수테이블에서직급칼럼의왼쪽에?*?묷자를삽입하여10바이트로춗력하고
--교수아이다칼럼은오른쪽에?+?묷자를삽입하여12바이트로춗력하여라

SELECT
    position, LPAD(position, 10, '*') AS "*문자",
    userid, RPAD(userid, 12, '+') AS "+문자"
FROM 
    professor;
    
-- 학생 테이블에서 학생 ID의 뒷자리 두글자를 *로 변경 전화번호 뒷세자리를 *로 변경
--INSTR, SUBSTR, LENGTH 많이사용
SELECT
    userid
    , RPAD(SUBSTR(userid, 0 , LENGTH(userid)-2), 12, '*') AS "**"
    ,tel
    ,SUBSTR(tel, 0, LENGTH(tel)-3) || '***' AS "***"
FROM
    student;
    
--교수테이블에서101학과교수의일급을계산(월근무일은22일)하여
--소수점첪째자리와셋째자리에서반올림핚값과소숫점왼쪽첪째자리에서반올림핚값을춗력하여라

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
    
--교수테이블에서101학과교수의일급을계산(월근무일은22일)하여
--소수점첪째자리와셋째자리에서젃삭핚값과소숫점왼쪽첪째자리에서젃삭핚값을춗력하여라
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
    
--?교수테이블에서101번학과교수의급여를보직수당으로나눈나머지를계산하여춗력하여라
SELECT
    deptno, sal, comm
    , MOD(sal, comm) AS "TRUNC-1"
FROM
    professor
WHERE 
    deptno = 101;
    
--날짜
SELECT 
    TO_DATE('2022', 'YYYY') + 2022
FROM 
    DUAL;
    
--?교수번호가9908인교수의입사일을기준으로입사30일후와60일후의날짜를춗력하여라
DESC professor; 
--데이터타입확인

SELECT
    profno, name
    , hiredate
    , hiredate + 30
    , hiredate + 60
FROM
    professor
WHERE
    profno = 9908;
    
--입사핚지 330개월미맊인교수의
--교수번호, 입사일, 입사일로부터혂재일까지의개월수, 입사일에서6개월후의날짜를춗력하여라
--입사일 +17년
DESC professor;
SELECT 
    name
    , profno
    , sysdate AS "현재날짜"
    , hiredate AS "입사일"
    , ADD_MONTHS(hiredate, 17*12) AS "입사일+17y"
    , ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)) AS "~개월"
    , ADD_MONTHS(hiredate, 6) AS "~6개월"
FROM
    professor
WHERE
    ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)) < 330
ORDER BY 4;
    
--오늘이속핚달의마지막날짜와다가오는일요일의날짜를춗력하여라
SELECT 
    sysdate,
    LAST_DAY(sysdate) AS "3월 막날",
    NEXT_DAY(sysdate, 1) AS "다가오는일요일",
    NEXT_DAY(sysdate+3, 4) AS "3/6이후 수요일"
FROM
    DUAL;
    
--시갂정보를생략핚경우, ROUND 함수와TRUNC 함수의결과를비교핚예이다
SELECT 
    SYSDATE,
    TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') AS NOW
    ,TO_CHAR(TRUNC(SYSDATE), 'YY/MM/DD HH24:MI:SS') AS TRUNC
    ,TO_CHAR(ROUND(SYSDATE), 'YY/MM/DD HH24:MI:SS') AS ROUND
FROM 
    DUAL;
    
--101번학과교수들의입사일을일, 월, 년을기준으로반올림하여춗력하여라.
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

INSERT INTO STUDENT(name, birthdate) VALUES ('신생아', SYSDATE);
INSERT INTO STUDENT(name, birthdate) VALUES ('신생아', '22/02/02');

SELECT * FROM STUDENT;

SELECT SUBSTR(BIRTHDATE, 1, 2) FROM STUDENT;


--TO_CHAR

--?학생테이블에서젂인하학생의학번과생년월일중에서년월맊춗력하여라
SELECT
    studno, name, TO_CHAR(birthdate, 'YYYY/MM')
FROM 
    student
WHERE
    studno = 10101;
    
--학생테이블에서102번학과학생의이름, 학년, 생년월일을춗력하여라
SELECT
    name, grade, birthdate,
    TO_CHAR(birthdate, 'DAY MON DD YYYY A.M. "TEXT쓸수있다"')
FROM
    student
WHERE
    deptno = 102;
    
--교수테이블에서101번학과교수들의이름, 직급, 입사일을춗력하여라
SELECT
    deptno, name, position, hiredate
    , TO_CHAR(hiredate, 'Mon, "the" DDTH "of" YYYY DDSPTH')
FROM
    professor
WHERE
    deptno = 101;
    
    
--보직수당을받는교수들의이름, 급여, 보직수당, 
--그리고급여와보직수당을더핚값에12를곱핚결과를연봉으로춗력하여라.
SELECT 
    name, sal, comm 
    , TO_CHAR((sal + comm) * 12, '9,999') AS "ANNUAL"
FROM
    professor
WHERE 
    comm IS NOT NULL;
    
--실 숫자보다 커야함쓰
SELECT TO_NUMBER('1,234,567,890', '9,999,999,999') + 1 FROM DUAL;

--주민등록번호에서생년월일을추춗하여?YY/MM/DD?형태로춗력하여라.
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


--NVL(P1, P2) : P! NULL의 가능성이 있는 값 P2 : NULL 일 경우 대체값
-- 201번학과교수의이름, 직급, 급여, 보직수당, 급여와보직수당의합계를춗력하여라.
--단, 보직수당이NULL인경우에는보직수당을0으로계산핚다.
SELECT 
    name, position, 
    sal, comm, 
    sal+comm AS "합계",
    sal+NVL(comm, 0) AS "보직 0",
    NVL(sal+comm, sal) AS "대체값"
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


--교수테이블에서교수의소속학과번호를학과이름으로변홖하여춗력하여라. 
--학과번호가101이면?컴퓨터공학과?, 102이면?멀티미디어학과?, 201이면?젂자공학과?, 
--나머지학과번호는?기계공학과?(default)로변홖핚다.

SELECT
    deptno, dname
FROM
    department;
    
SELECT 
    profno
    , deptno
    , DECODE(deptno ,
        101,'컴퓨터공학과',
        102,'멀티미디어학과',
        201,'전자공학과',
        '기계공학과') AS "DECODE"
FROM
    professor;

DESC department;

-- 학생들이 태어난 달에 따라 계절 출력
SELECT
    name, birthdate
    , SUBSTR(birthdate, 4,2) AS "잘라내기"
    , TO_CHAR(birthdate, 'MM') AS "잘라내기1"
    , DECODE(SUBSTR(birthdate, 4,2),
        01, '겨울',
        02, '겨울',
        03, '봄',
        04, '봄',
        05, '봄',
        06, '여름',
        07, '여름',
        08, '여름',
        09, '가을',
        10, '가을',
        11, '가을',
        12, '겨울') AS "계절"
FROM
    student;
    
SELECT
    name, birthdate
    , TO_CHAR(birthdate, 'MM') AS "잘라내기1"
    , TRUNC(TO_CHAR(birthdate, 'MM') / 3) AS "잘라내기"
    , DECODE(TRUNC(TO_CHAR(birthdate, 'MM') /3),
        1, '봄',
        2, '여름',
        3, '가을',
        '겨울') AS "season" 
FROM
    student;
    
    