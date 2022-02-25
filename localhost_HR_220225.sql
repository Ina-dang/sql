SELECT 
    rownum, employee_id, first_name, last_name
FROM  employees
--WHERE rownum <= 10;
WHERE rownum <=20
AND rownum > 10;
--이렇게 하면 결과값이 안나옴



-- 그때 필요한 게 SUB QUERY
-- 의사 컬럼을 일반컬럼으로 만들것 (rownum보면 1로 되어있음)
SELECT RN, ID, FN, LN, rownum
FROM (
    SELECT 
        rownum "RN", employee_id "ID", first_name "FN", last_name "LN"
    FROM  employees
    WHERE rownum <=20 
)
WHERE RN > 10;


--2페이지보기
SELECT RN, ID, FN, LN, rownum
FROM (
    SELECT 
        rownum "RN", employee_id "ID", first_name "FN", last_name "LN"
    FROM  employees
    WHERE rownum <=2 * 10
)
WHERE RN > (2 - 1 ) * 10;


--3페이지 보기 5개씩
SELECT RN, ID, FN, LN, rownum
FROM (
    SELECT 
        rownum "RN", employee_id "ID", first_name "FN", last_name "LN"
    FROM  employees
    WHERE rownum <= 3 * 5
)
WHERE RN > ( 3 - 1 ) * 5;
