
CREATE TABLE ȸ������ (
    ID VARCHAR2(1000) PRIMARY KEY,
    ��й�ȣ VARCHAR2(1000),
    ȸ���̸� VARCHAR2(1000),
    ��ȭ��ȣ VARCHAR2(1000)
);

DROP TABLE ȸ������;

CREATE TABLE �Խñ۰��� (
    �۹�ȣ NUMBER PRIMARY KEY,
    ������ VARCHAR2(1000),
    �۳��� VARCHAR2(4000),
    ���ۼ��� VARCHAR2(1000),
    ���ۼ��� DATE
);

CREATE TABLE ��۰��� (
    ��۹�ȣ NUMBER PRIMARY KEY,
    ��۳��� VARCHAR2(4000),
    ����ۼ��� VARCHAR2(1000),
    ����ۼ��� DATE
);
/

INSERT INTO ȸ������ VALUES ('ID1', '1234', '��浿', '023332222');

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE ȸ������Ȯ��_PROC(p_id VARCHAR2) IS
    V_PW VARCHAR2(1000);
    V_NAME VARCHAR2(1000);
    V_NUM VARCHAR2(1000);
bEGIN
    SELECT ��й�ȣ, ȸ���̸�, ��ȭ��ȣ INTO V_PW, V_NAME, V_NUM
    FROM ȸ������ WHERE ID = P_ID;
    
    dbms_output.put_line(p_id);
    DBMS_OUTPUT.PUT_LINE('-------------');
    dbms_output.put_line(V_PW);
    dbms_output.put_line(V_NAME);
    dbms_output.put_line(V_NUM);
END;
/

CREATE OR REPLACE PROCEDURE ȸ�����_PROC IS
P_ID ȸ������.ID%TYPE;
P_��й�ȣ ȸ������.��й�ȣ%TYPE;
P_ȸ���̸� ȸ������.ȸ���̸�%TYPE;
P_��ȭ��ȣ ȸ������.��ȭ��ȣ%TYPE;
BEGIN
--    INSERT id, ��й�ȣ, ȸ���̸�, ��ȭ��ȣ
--    INTO p_id, p_��й�ȣ, p_ȸ���̸�, p_��ȭ��ȣ
    
    COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE ȸ������_PROC IS
P_ID ȸ������.ID%TYPE;
P_��й�ȣ ȸ������.��й�ȣ%TYPE;
P_ȸ���̸� ȸ������.ȸ���̸�%TYPE;
P_��ȭ��ȣ ȸ������.��ȭ��ȣ%TYPE;
BEGIN
--    DBMS_OUTPUT.PUT_LINE();
--    UPDATE
    COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE ȸ������_PROC IS
P_ID ȸ������.ID%TYPE;
P_��й�ȣ ȸ������.��й�ȣ%TYPE;
P_ȸ���̸� ȸ������.ȸ���̸�%TYPE;
P_��ȭ��ȣ ȸ������.��ȭ��ȣ%TYPE;
BEGIN
--    DELETE FROM ȸ������ WHERE ;
    COMMIT;    
END;
/


CREATE OR REPLACE FUNCTION ȸ������_FN IS 
 P_ID := VARCHAR2(1000);
BEGIN
    IF
        P_ID = 'ȫ�浿';
        dbms_output.put_line('ID ' || P_ID);
    END IF;
END;
/
