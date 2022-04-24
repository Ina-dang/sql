SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT * FROM SALGRADE;
SELECT * FROM BONUS;

SELECT  'public class ' || INITCAP('emp') || ' {' from dual
UNION ALL
SELECT * FROM
(SELECT 
 
    CASE
        WHEN DATA_TYPE = 'NUMBER' THEN '    private int '
        ELSE '      private string'
    END
    || lower(COLUMN_NAME) || ';'
FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'EMP' ORDER BY COLUMN_ID)
UNION ALL
SELECT '}' from dual;