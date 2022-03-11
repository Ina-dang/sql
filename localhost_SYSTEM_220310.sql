--VIEW 생성 권한을 student 계정에 부여
GRANT CREATE VIEW TO student;
GRANT CREATE SYNONYM TO student;

--VIEW,SYNONYM 생성 권한을 student 계정에 부여
GRANT CREATE VIEW, CREATE SYNONYM TO student;

GRANT SELECT ON HR.employees TO student;