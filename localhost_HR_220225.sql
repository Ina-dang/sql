SELECT 
    rownum, employee_id, first_name, last_name
FROM  employees
--WHERE rownum <= 10;
WHERE rownum <=20
AND rownum > 10;
--�̷��� �ϸ� ������� �ȳ���



-- �׶� �ʿ��� �� SUB QUERY
-- �ǻ� �÷��� �Ϲ��÷����� ����� (rownum���� 1�� �Ǿ�����)
SELECT RN, ID, FN, LN, rownum
FROM (
    SELECT 
        rownum "RN", employee_id "ID", first_name "FN", last_name "LN"
    FROM  employees
    WHERE rownum <=20 
)
WHERE RN > 10;


--2����������
SELECT RN, ID, FN, LN, rownum
FROM (
    SELECT 
        rownum "RN", employee_id "ID", first_name "FN", last_name "LN"
    FROM  employees
    WHERE rownum <=2 * 10
)
WHERE RN > (2 - 1 ) * 10;


--3������ ���� 5����
SELECT RN, ID, FN, LN, rownum
FROM (
    SELECT 
        rownum "RN", employee_id "ID", first_name "FN", last_name "LN"
    FROM  employees
    WHERE rownum <= 3 * 5
)
WHERE RN > ( 3 - 1 ) * 5;
