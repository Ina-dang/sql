CREATE TABLE ȸ������ (
    ID VARCHAR2(1000) PRIMARY KEY,
    ��й�ȣ VARCHAR2(1000),
    ȸ���̸� VARCHAR2(1000),
    ��ȭ��ȣ VARCHAR2(1000)
);

DROP TABLE �Խñ۰���;
CREATE TABLE �Խñ۰��� (
    �۹�ȣ NUMBER PRIMARY KEY,
    ������ VARCHAR2(1000),
    �۳��� VARCHAR2(4000),
    ���ۼ��� REFERENCES ȸ������(ID),
    ���ۼ��� DATE
);

CREATE TABLE ��۰��� (
    ��۹�ȣ NUMBER PRIMARY KEY,
    ��۳��� VARCHAR2(4000),
    ���ۼ��� REFERENCES ȸ������(ID),
    ���ۼ��� DATE,
    �Խñ۹�ȣ REFERENCES �Խñ۰���(�۹�ȣ)
);

CREATE UNIQUE INDEX ȸ��_ID_�̸�_IDX ON ȸ������(ID, ȸ���̸�);

SELECT * FROM ȸ������ WHERE ID = 'A' AND ȸ���̸� = 'A';

CREATE OR REPLACE PROCEDURE ȸ������Ȯ��_PROC(P_ID VARCHAR2) IS
V_��й�ȣ VARCHAR2(1000);
V_ȸ���̸� VARCHAR2(1000);
V_��ȭ��ȣ VARCHAR2(1000);
BEGIN
    SELECT ��й�ȣ, ȸ���̸�, ��ȭ��ȣ 
    INTO V_��й�ȣ, V_ȸ���̸�, V_��ȭ��ȣ
    FROM ȸ������
    WHERE ID = P_ID;
    DBMS_OUTPUT.PUT_LINE(P_ID);
    DBMS_OUTPUT.PUT_LINE('=============');
    DBMS_OUTPUT.PUT_LINE(V_��й�ȣ);
    DBMS_OUTPUT.PUT_LINE(V_ȸ���̸�);
    DBMS_OUTPUT.PUT_LINE(V_��ȭ��ȣ);
    COMMIT;
END;
/

EXEC ȸ������Ȯ��_PROC('ID1');

SET SERVEROUTPUT ON;
INSERT INTO ȸ������ VALUES ('ID1', '1234', '��浿', '02333222');

DROP PROCEDURE ȸ�����;
CREATE OR REPLACE PROCEDURE ȸ�����_PROC(P_ID VARCHAR2, P_��й�ȣ VARCHAR2, P_ȸ���̸� VARCHAR2, P_��ȭ��ȣ VARCHAR2) IS
BEGIN
    INSERT INTO ȸ������ 
    VALUES (P_ID , P_��й�ȣ , P_ȸ���̸� , P_��ȭ��ȣ );
    COMMIT;
END;
/

EXEC ȸ�����_PROC('ID2', '1234', '��浿��', '023332222');


CREATE OR REPLACE PROCEDURE ȸ������_PROC(P_ID VARCHAR2, P_��й�ȣ VARCHAR2, P_ȸ���̸� VARCHAR2, P_��ȭ��ȣ VARCHAR2) IS
BEGIN
    UPDATE ȸ������ SET
    ��й�ȣ = P_��й�ȣ,
    ȸ���̸� = P_ȸ���̸�,
    ��ȭ��ȣ = P_��ȭ��ȣ
    WHERE ID = P_ID;
    COMMIT;
END;
/
EXEC ȸ������_PROC('ID2', '1234', '��浿��', '023332222');

CREATE OR REPLACE PROCEDURE ȸ������_PROC(P_ID VARCHAR2) IS
BEGIN
    UPDATE �Խñ۰��� SET
    ���ۼ��� = NULL
    WHERE ���ۼ��� = P_ID;
    
    UPDATE ��۰��� SET
    ���ۼ��� = NULL
    WHERE ���ۼ��� = P_ID;
    
    DELETE ȸ������ WHERE ID = P_ID;
    COMMIT;
END;
/

EXEC ȸ������_PROC('ID2');

SELECT * FROM ȸ������;


----------------------------------------------------------------�Լ������
CREATE OR REPLACE FUNCTION ȸ������_FN(P_ID VARCHAR2) RETURN VARCHAR2 IS
V_ȸ���̸� VARCHAR2(1000);
BEGIN
    SELECT ȸ���̸�
    INTO V_ȸ���̸�
    FROM ȸ������
    WHERE ID = P_ID;
    RETURN P_ID || ' ' || V_ȸ���̸�;
    COMMIT;
END;
/

SELECT ȸ������_FN('ID1') FROM DUAL;
