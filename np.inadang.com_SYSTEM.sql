CREATE USER INADANG IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO INADANG;

SELECT * FROM all_users;

SELECT * FROM DBA_USERS WHERE USERNAME = 'INADANG';

ALTER USER INADANG IDENTIFIED BY 1234;
