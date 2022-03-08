SELECT * FROM employees;
--사번, 이름, 성, 상급자 사번 조회

SELECT
    E1.employee_id, E1.first_name, E1.last_name, E1.manager_id, E1.salary --내꺼
    , E2.employee_id AS "상사 id", E2.first_name  AS "상사", E2.last_name AS "상사 ", E2.manager_id AS "상사의상사 id", E2.salary AS "상사돈" --상사꺼
    , E3.employee_id AS "상상사 id", E3.first_name  AS "상상사", E3.last_name AS "상상사 ", E3.manager_id AS "상상사의상사 id", E3.salary AS "상상사돈" --상사의상사
FROM 
    employees E1, employees E2, employees E3
WHERE
    E1.manager_id = E2.employee_id(+)
AND
    E2.employee_id = E3.employee_id(+)
ORDER BY 1;

SELECT
    E1.employee_id, E1.first_name, E1.last_name, E1.manager_id, E1.salary --내꺼
    , E2.employee_id AS "상사 id", E2.first_name  AS "상사", E2.last_name AS "상사 ", E2.manager_id AS "상사의상사 id", E2.salary AS "상사돈" --상사꺼
    , E3.employee_id AS "상상사 id", E3.first_name  AS "상상사", E3.last_name AS "상상사 ", E3.manager_id AS "상상사의상사 id", E3.salary AS "상상사돈" --상사의상사
FROM 
    employees E1
LEFT JOIN
    employees E2 ON e1.manager_id = e2.employee_id
    LEFT JOIN
    employees E3 ON e2.manager_id = e3.employee_id
ORDER BY 1;    

SELECT 1 + 2 * ( 3 + 4 ) FROM DUAL;

