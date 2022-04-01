SELECT * FROM STUDENT;

SET SERVEROUTPUT ON; 
SET TIMING ON;

DECLARE
    vi_num NUMBER;
BEGIN
    vi_num := 100;
    DBMS_OUTPUT.PUT_LINE(vi_num);
END;
/

DECLARE
    a INTEGER := 2**2*3**2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('a = ' || TO_CHAR(a));
END;
/

DECLARE
    V_NAME STUDENT.NAME%TYPE;
    V_DEPTNO STUDENT.DEPTNO%TYPE;
BEGIN
    SELECT name, deptno 
    INTO V_NAME, V_DEPTNO
    FROM student
    WHERE studno = 10101;
    DBMS_OUTPUT.PUT_LINE(V_NAME || '-' || V_DEPTNO);
END;
/
    