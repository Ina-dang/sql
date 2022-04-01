

SET SERVEROUTPUT ON;

SELECT * FROM employees ORDER BY employee_id DESC;
SELECT MAX(EMPLOYEE_ID) + 1 FROM EMPLOYEES;

--DECLARE
--    V_EMPLOYEE_ID employees.employee_id%TYPE;
--    V_FIRST_NAME employees.first_name%TYPE;
--    V_LAST_NAME employees.last_name%TYPE;
--    V_EMAIL employees.email%TYPE;
--    V_HIRE_DATE employees.hire_date%TYPE;
--    V_JOB_ID employees.job_id%TYPE;
--    V_DEPARTMENT_ID employees.department_id%TYPE;
--BEGIN
--    SELECT MAX(employee_id) + 1, first_name, last_name, email, hire_date, job_id, department_id
--    INTO V_EMPLOYEE_ID, V_first_name, V_last_name, V_email, V_hire_date, V_job_id, v_department_id
--    FROM employees 
--    GROUP BY first_name, last_name, email, hire_date, job_id, department_id;
--    DBMS_OUTPUT.PUT_LINE(V_EMPLOYEE_ID || V_FIRST_NAME || V_LAST_NAME || V_EMAIL || V_HIREDATE || V_DEPARTMENT_ID);
--END;
--/

DECLARE
    V_EMPLOYEE_ID employees.employee_id%TYPE;
BEGIN
    SELECT MAX(employee_id) + 1
    INTO V_EMPLOYEE_ID
    FROM employees ;
    DBMS_OUTPUT.PUT_LINE(V_EMPLOYEE_ID);
    
    INSERT INTO
    employees(employee_id, first_name, last_name, email, hire_date, job_id, department_id)
    VALUES 
    (V_EMPLOYEE_ID, 'Harrison', 'Ford', 'HARRIS', SYSDATE, 'ST_MAN',50);
    
    COMMIT;
END;
/

--INSERT INTO
--    department(employee_id, first_name, last_name, email, hire_date, job_id, department_id)
--VALUES 
--    (V_EMPLOYEE_ID, 'Harrison', 'Ford', 'HARRIS', SYSDATE, 'ST_MAN',50);


--프로시저
CREATE OR REPLACE PROCEDURE PROC_TEST(V_EMAIL EMPLOYEES.EMAIL%TYPE) IS
    V_EMPLOYEE_ID employees.employee_id%TYPE;
BEGIN
    SELECT MAX(employee_id) + 1
    INTO V_EMPLOYEE_ID
    FROM employees ;
    DBMS_OUTPUT.PUT_LINE(V_EMPLOYEE_ID);
    
    INSERT INTO
    employees(employee_id, first_name, last_name, email, hire_date, job_id, department_id)
    VALUES 
    (V_EMPLOYEE_ID, 'Harrison', 'Ford', V_EMAIL, SYSDATE, 'ST_MAN',50);
    
    COMMIT;
END;
/ 

EXEC PROC_TEST('HARI3');

SELECT * FROM employees ORDER BY employee_id desc;

    
--    SELECT rownum, rownum FROM employees;
    
--구구단 중 3단 출력
DECLARE
    J NUMBER := 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE( 3 || '*' || J || '=' || 3 * J);
    J := J + 1;
    DBMS_OUTPUT.PUT_LINE( 3 || '*' || J || '=' || 3 * J);
    J := J + 1;
    DBMS_OUTPUT.PUT_LINE( 3 || '*' || J || '=' || 3 * J);
    J := J + 1;
    DBMS_OUTPUT.PUT_LINE( 3 || '*' || J || '=' || 3 * J);
    J := J + 1;
    DBMS_OUTPUT.PUT_LINE( 3 || '*' || J || '=' || 3 * J);
    J := J + 1;
    DBMS_OUTPUT.PUT_LINE( 3 || '*' || J || '=' || 3 * J);
    J := J + 1;
    DBMS_OUTPUT.PUT_LINE( 3 || '*' || J || '=' || 3 * J);
    J := J + 1;
    DBMS_OUTPUT.PUT_LINE( 3 || '*' || J || '=' || 3 * J);
    J := J + 1;
    DBMS_OUTPUT.PUT_LINE( 3 || '*' || J || '=' || 3 * J);
END;
/




-- 사원 테이블에서 201번의 사원 이름과 이메일 주소를 출력하는 익명블록
SELECT * FROM employees WHERE employee_id = 201;
DECLARE
    V_FIRST_NAME employees.first_name%TYPE;
    V_LAST_NAME employees.last_name%TYPE;
    V_EMAIL employees.email%TYPE;
BEGIN
    SELECT first_name, last_name, email
    INTO V_FIRST_NAME, V_LAST_NAME, V_EMAIL
    FROM employees
    WHERE employee_id = 201;
    DBMS_Output.Put_Line('name : '||V_FIRST_NAME || ' ' || V_LAST_NAME || ' / email : ' || V_EMAIL);
END;
/
       


DECLARE
  vn_num1 NUMBER := 5;
  vn_num2 NUMBER := 2;
BEGIN
    IF vn_num1 >= vn_num2 THEN
        DBMS_OUTPUT.PUT_LINE(vn_num1 || '이 큰 수');
    ELSE
        DBMS_OUTPUT.PUT_LINE(vn_num2 || '이 큰 수');
    END IF;
END;
/

DECLARE
    vn_salary NUMBER := 0;
    vn_department_id NUMBER := 0;
BEGIN
    vn_department_id := ROUND(DBMS_RANDOM.VALUE (10, 120), -1);
    DBMS_OUTPUT.PUT_LINE(vn_department_id);
    SELECT salary
    INTO vn_salary
    FROm employees
    WHERE department_id = vn_department_id
    AND ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE(vn_salary);
    
IF vn_salary BETWEEN 1 AND 3000 THEN
    DBMS_OUTPUT.PUT_LINE('낮음');
ELSIF vn_salary BETWEEN 3001 AND 5000 THEN
    DBMS_OUTPUT.PUT_LINE('중간');
ELSIF vn_salary BETWEEN 6001 AND 10000 THEN
    DBMS_OUTPUT.PUT_LINE('높음');
ELSE 
    DBMS_OUTPUT.PUT_LINE('최상위');
END IF;
END;
/

    CASE
        WHEN vn_salary BETWEEN 1 AND 3000 THEN
        CASE
            WHEN VN_SALARY BETWEEN 1 AND 1000 THEN
            DBMS_OUTPUT.PUT_LINE('SO낮음');
        END CASE;
        DBMS_OUTPUT.PUT_LINE('낮음');
        WHEN vn_salary BETWEEN 3001 AND 5000 THEN
        DBMS_OUTPUT.PUT_LINE('중간');
        WHEN vn_salary BETWEEN 6001 AND 10000 THEN
        DBMS_OUTPUT.PUT_LINE('높음');
        ELSE 
        DBMS_OUTPUT.PUT_LINE('최상위');
    END CASE;
END;
/

SELECT 
    ROUND(1234.567),
    ROUND(1234.567, 2),
    ROUND(1234.567, 1),
    ROUND(1234.567, 0),
    ROUND(1234.567, -1)
FROM DUAL;

SELECT * FROM employees WHERE department_id = 20;
SELECT ROUND(DBMS_RANDOM.VALUE (10, 120)), ROUND(DBMS_RANDOM.VALUE (10, 120)), ROUND(DBMS_RANDOM.VALUE (10, 120))
FROM DUAL;


SET SERVEROUTPUT ON;
DECLARE
    I NUMBER := 2;
    J NUMBER := 1;
    
BEGIN
    LOOP
        J := 1;
        LOOP
            DBMS_OUTPUT.PUT_LINE( I || '*' || J || '=' || I * J);
            J := J + 1;
            EXIT WHEN J = 10;
        END LOOP;    
        
            I := I + 1;
            EXIT WHEN I = 10;
        END LOOP;    
END;
/

DECLARE
    I NUMBER := 1;
    V_SUM NUMBER := 0;
BEGIN
    WHILE 
        I <= 100
    LOOP
--        IF MOD(I,2) = 1 THEN
--            V_SUM := V_SUM + I;
--            DBMS_OUTPUT.PUT_LINE( I );
--        END IF;

--        V_SUM := V_SUM + I;
--        IF
--        V_SUM >= 100 THEN EXIT;
--        END IF;
--        I := 2 + I;

        V_SUM := V_SUM + I;
        EXIT WHEN V_SUM > 100;
        
        I := 2 + I;

    END LOOP;
            DBMS_OUTPUT.PUT_LINE(V_SUM);    
END;
/        
        
--FOR 루프를 사용해서 1에서 20의 합계
DECLARE
    V_SUM NUMBER := 0;
BEGIN
    FOR I IN 1..20
    LOOP
--        DBMS_OUTPUT.PUT_LINE (I);
        V_SUM := V_SUM + I;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(V_SUM);
END;
/

--거꾸로
BEGIN
    FOR I IN REVERSE 1..20
    LOOP
        DBMS_OUTPUT.PUT_LINE (I);
    END LOOP;
END;
/

--구구단
DECLARE
 I NUMBER := 2;
 J NUMBER := 1;
BEGIN
    FOR I IN 2..9
    LOOP
        FOR J IN 1..9
        LOOP
            NULL;
        DBMS_OUTPUT.PUT_LINE(I || '*' || J || '=' || I * J);
        END LOOP;
    END LOOP;
END;
/

--내장함수
SELECT 1234.567, ROUND(1234.567) FROM DUAL;                      



CREATE OR REPLACE FUNCTION MY_MOD (NUM1 NUMBER, NUM2 NUMBER) 
    RETURN NUMBER
IS
    VN_REMAINDER NUMBER := 0;
    VN_QUOTIENT NUMBER := 0;

BEGIN
    VN_QUOTIENT := FLOOR(NUM1/ NUM2);
    VN_REMAINDER := NUM1 - (NUM2 * VN_QUOTIENT);

    RETURN VN_REMAINDER;

END;
/

SELECT MOD(5, 2), MY_MOD(5, 2) FROM DUAL;

SELECT MY_MOD(14, 3) REMINDER FROM DUAL;

-- 함수선언 GET DATE
-- 매개변수 X
-- 반환값은 현재시간 -7일
-- 반환타입 DATE

--반환타입없으면 변수 안써도됨
CREATE OR REPLACE FUNCTION GETDATE RETURN DATE IS
BEGIN 
RETURN SYSDATE - 7;
END;
/

SELECT SYSDATE, GETDATE FROM DUAL;
SELECT * FROM JOBS;

