SELECT * FROM employees;
--���, �̸�, ��, ����� ��� ��ȸ

SELECT
    E1.employee_id, E1.first_name, E1.last_name, E1.manager_id, E1.salary --����
    , E2.employee_id AS "��� id", E2.first_name  AS "���", E2.last_name AS "��� ", E2.manager_id AS "����ǻ�� id", E2.salary AS "��絷" --��粨
    , E3.employee_id AS "���� id", E3.first_name  AS "����", E3.last_name AS "���� ", E3.manager_id AS "�����ǻ�� id", E3.salary AS "���絷" --����ǻ��
FROM 
    employees E1, employees E2, employees E3
WHERE
    E1.manager_id = E2.employee_id(+)
AND
    E2.employee_id = E3.employee_id(+)
ORDER BY 1;

SELECT
    E1.employee_id, E1.first_name, E1.last_name, E1.manager_id, E1.salary --����
    , E2.employee_id AS "��� id", E2.first_name  AS "���", E2.last_name AS "��� ", E2.manager_id AS "����ǻ�� id", E2.salary AS "��絷" --��粨
    , E3.employee_id AS "���� id", E3.first_name  AS "����", E3.last_name AS "���� ", E3.manager_id AS "�����ǻ�� id", E3.salary AS "���絷" --����ǻ��
FROM 
    employees E1
LEFT JOIN
    employees E2 ON e1.manager_id = e2.employee_id
    LEFT JOIN
    employees E3 ON e2.manager_id = e3.employee_id
ORDER BY 1;    

SELECT 1 + 2 * ( 3 + 4 ) FROM DUAL;

