SELECT * FROM USER_TABLES;
SELECT * FROM ALL_TABLES;
SELECT * FROM DBA_TABLES;



SELECT * FROM USER_SEQUENCES;
SELECT * FROM USER_VIEWS;
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_CONSTRAINTS;


--내가볼수있는 USER로 된 데이터 사전명들
SELECT table_name FROM dictionary  WHERE table_name LIKE 'USER%';

--사전을 이용한 쿼리만들기
SELECT 'SELECT * FROM' || table_name || ';' FROM dictionary  WHERE table_name LIKE 'USER%';

--쿼리를 만드는 쿼리만들기 >> 생성이유
SELECT column_name FROM USER_TAB_COLS WHERE TABLE_NAME = 'TBL_BOARD';
SELECT 'SELECT ' || column_name || ' FROM TBL_BOARD;' FROM USER_TAB_COLS WHERE TABLE_NAME = 'TBL_BOARD';


SELECT BNO FROM TBL_BOARD;
SELECT TITLE FROM TBL_BOARD;
SELECT CONTENT FROM TBL_BOARD;
SELECT HITCOUNT FROM TBL_BOARD;
SELECT REGDATE FROM TBL_BOARD;
SELECT WRITER FROM TBL_BOARD;



--데이터 무결성
-- 쪽지발송

--no(쪽지번호), sender, receiver, content, regdate(발신시간), receiverdate(읽은시간)>>시간없으면 카톡1처럼

DESC student;
SELECT * FROM professor;


--강좌 테이블 인스턴스
CREATE TABLE subject (
    subno NUMBER(5)
        CONSTRAINT pk_subject PRIMARY KEY
        DEFERRABLE INITIALLY DEFERRED,
--        USING INDEX TABLESPACE indx, --없어서 뺌
    subname VARCHAR2(20)
        CONSTRAINT nn_subname NOT NULL,
    term VARCHAR2(1)
        CONSTRAINT ck_term CHECK (term in ('1', '2')),
    type VARCHAR2(1)
);

SELECT * FROM SUBJECT;


-- studo 칼럼에 기본키 제약조건추가
ALTER TABLE student
    ADD CONSTRAINT pk_student PRIMARY KEY(studno);

CREATE TABLE sugang (
    --외래키 쓰면 이거 안써두됨
    studno
        CONSTRAINT fk_sugang_studno REFERENCES student(studno),
    subno
        CONSTRAINT fk_sugang_subno REFERENCES subject(subno),
    regdate DATE DEFAULT sysdate,
    result NUMBER(3),
        CONSTRAINT pk_sugang PRIMARY KEY (studno, subno)
);

SELECT * FROM sugang;

SELECT * FROM user_constraints;


--? 학생 테이블 인스턴스를 참조하여 studno에 기본 키, idnum에 고유 키,name에 NOT NULL 무결성 제약조건을 추가하여라.
--제약조건명 굳이 안써도 됨 PK제약조건은 인덱스로 사용할거라 좀 신경써줘야함
ALTER TABLE student ADD CONSTRAINT uk_idnum UNIQUE(idnum);
ALTER TABLE student ADD CONSTRAINT uk_userid UNIQUE(userid);
ALTER TABLE student MODIFY (name CONSTRAINT nn_name NOT NULL);

--학과 테이블에 pk없어서 오류 --deptno에 외래키 넣어주기
ALTER TABLE department MODIFY(deptno CONSTRAINT pk_department PRIMARY KEY);
ALTER TABLE student MODIFY ( deptno CONSTRAINT fk_deptno REFERENCES department(deptno));




SELECT * FROM department;
--학과 테이블 college에 fk추가
ALTER TABLE department MODIFY(college CONSTRAINT fk_college REFERENCES department(deptno));
--학과 테이블 name nn 추가
ALTER TABLE department MODIFY(dname CONSTRAINT nn_dname NOT NULL);
-- 교수테이블 profno pk추가
ALTER TABLE professor MODIFY(profno CONSTRAINT pk_professor PRIMARY KEY);

--교수테이블 namenn추가
ALTER TABLE professor MODIFY(name CONSTRAINT nn_prof_name NOT NULL); --이름 겹치면안됨

--잘못하면 drop 해야함
--ALTER TABLE (테이블명) DROP CONSTRAINT (잘못된이름);

--교수테잉블 deptno fk추가
ALTER TABLE professor MODIFY(deptno CONSTRAINT fk_prof_deptno REFERENCES department(deptno));
--학생테이블 profno fk추가
ALTER TABLE student MODIFY(profno CONSTRAINT fk_stud_profno REFERENCES professor(profno));

--학생테이블 grade ck 추가(1~4)
ALTER TABLE student MODIFY (grade CONSTRAINT ck_grade CHECK(grade BETWEEN '1' AND 4));

SELECT * FROM user_cons_columns;
SELECT * FROM user_constraints;

--ALTER TABLE student DROP CONSTRAINT ck_grade;

DESC subject;
INSERT INTO subject VALUES (1001, '자바', '1', NULL);
INSERT INTO subject VALUES (1001, '오라클', '2', NULL); --지연상태라 가능 

COMMIT; --커밋하면 오류뜸

SELECT * FROM subject; --입력 전 시점으로 이동

INSERT INTO subject VALUES (1001, '자바', '1', NULL);
INSERT INTO subject VALUES (1001, '오라클', '2', NULL); --다시해도 입력은 됨

DESC subject;
INSERT INTO subject VALUES (1001, '자바', '1', NULL);
INSERT INTO subject VALUES (1002, '오라클', '2', NULL); --제대로된 정보입력
SELECT * FROM subject;

COMMIT;



--부서 테이블에서 name 칼럼을 고유 인덱스로 생성하여라.단, 고유 인덱스의 이름을 idx_dept_name으로 정의한다
CREATE UNIQUE INDEX idx_dept_name ON department(dname);

SELECT * FROM department ;
SELECT * FROM department WHERE deptno > 2;
SELECT * FROM department WHERE dname > 'r가';
SELECT * FROM department WHERE dname IS NOT NULL;

SELECT /*+ index(d idx_dept_name) */ * FROM department d;
SELECT /*+ index(d pk_department) */ * FROM department d;
SELECT /*+ index_desc(d pk_department) */ * FROM department d;



DESC tbl_board;

SELECT * FROM tbl_board;


--한페이지에 20에 보여줘야하는데 일단 가져온 후에 역순
SELECT B.*, ROWNUM rn FROM tbl_board B WHERE ROWNUM <= 20 ORDER BY bno DESC;

--그래서
SELECT * FROM (
    SELECT A.*, ROWNUM rn from (
        SELECT B.* FROM tbl_board B ORDER BY bno DESC
    ) A WHERE ROWNUM <= 30
) WHERE RN > 20;
--했는ㄷ ㅔ코스트 너무심함


--pk_board 기본키 추가 bno
ALTER TABLE tbl_board MODIFY ( 
    bno CONSTRAINT pk_board PRIMARY KEY
);
--코스트 줄이기
SELECT * FROM (
    SELECT /*+ index_desc(A pk_board) */ A.*, ROWNUM rn FROM tbl_board A WHERE ROWNUM <=30
)
WHERE rn > 20;


ALTER TABLE tbl_board DROP CONSTRAINT pk_board;

--학생 테이블의 birthdate 칼럼을 비고유 인덱스로 생성하여라. 비고유 인덱스의 이름은 idx_stud_birthdate로 정의한다
CREATE INDEX idx_stud_birthdate ON student(birthdate);

SELECT * FROM student WHERE birthdate = '79/07/02';

--학생 테이블의 deptno, grade 칼럼을 결합 인덱스로 생성하여라. 결합 인덱스의 이름은 idx_stud_dno_grade 로 정의한다
CREATE INDEX idx_stud_dno_grade ON student(deptno, grade);

SELECT * FROM student WHERE deptno = 101 AND grade = 4;

DROP INDEX idx_stud_dno_grade;

--학생 테이블의 deptno와 name 칼럼으로 결합 인덱스를 생성하여라.단, deptno 칼럼을 내림차순으로 name 칼럼은 오름차순으로 생성하여라
CREATE INDEX idx_stud_dno_name ON student(deptno DESC, name);

SELECT * FROM student WHERE deptno > 0 AND name > '가';
SELECT /*+ index_desc(student idx_stud_dno_name) */ * FROM student;


SELECT * FROM USER_INDEXES;

SELECT *
FROM user_indexes
JOIN user_ind_columns USING (index_name);

SELECT * FROM dict WHERE table_name LIKE 'USER%IND%';


SELECT studno, name, deptno, profno FROM student;
--학번 이름 학과번호 교수번호를 가지는 스튜던트 tmp 생성
CREATE TABLE stud_tmp AS
SELECT studno, name, deptno, profno FROM student;

DROP TABLE stud_tmp;

--학번 이름 학과번호 교수번호를 가지는 스튜던트 tmp 뷰 생성
CREATE VIEW stud_tmp AS
SELECT studno, name, deptno, profno FROM student;

SELECT * FROM stud_tmp;
SELECT * FROM user_views;

CREATE OR REPLACE VIEW stud_tmp AS
SELECT studno, name, deptno, profno FROM student;

INSERT INTO stud_tmp VALUES ('12345', '김김김', 101, NULL);
INSERT INTO stud_tmp VALUES (12346, '이김김', NULL, NULL);

SELECT * FROM HR.employees;

SELECT *
FROM
    HR.employees A
JOIN
    department B
ON 
    a.employee_id = B.deptno;
    
--학생 테이블과 부서 테이블을 조인하여 102번 학과 학생들의 학번, 이름,학년, 학과 이름으로 정의되는 복합 뷰를 생성하여라.
CREATE OR REPLACE VIEW view_comp_test AS
SELECT 
    studno, name, grade, dname
FROM 
    student 
NATURAL JOIN 
    department;
    
SELECT * FROM view_comp_test;

INSERT INTO view_comp_test VALUES (12345, '이이이', '3', '컴퓨터공학과');
DELETE FROM view_comp_test WHERE studno = 12345;
ROLLBACK;

SELECT * FROM student;

--학생들 탄생연도별 인원수를 구하여라 그리고 이 데이터를 사용해 view_comp_test2 뷰생성
CREATE OR REPLACE VIEW view_comp_test2 AS
SELECT 
    (TO_CHAR(birthdate, 'YYYY')) birth, COUNT(*) cnt
FROM
    student
GROUP BY
    TO_CHAR(birthdate, 'YYYY');
    
SELECT * FROM view_comp_test2;

--인라인 뷰를 사용하여 학과별로 학생들의 평균 키와 평균 몸무게, 학과이름을 춗력하여라.

SELECT AH, AW, dname
FROM (
    SELECT 
        deptno, AVG(height) AH , AVG(weight)AW
    FROM
        student
    GROUP BY deptno
) NATURAL JOIN department;


GRANT SELECT ON department TO HR;


SELECT * FROM HR.employees; --맨날 길게 쓰기 귀찮으니
--동의어 만들기
CREATE SYNONYM emps FOR HR.employees;
SELECT * FROM emps;

SELECT * FROM department;


SELECT deptno, dname, college, level
FROM department START WITH deptno = 10
CONNECT BY PRIOR deptno = college;

SELECT 
    LPAD(' ', (level-1)*2) || dname D
FROM 
    department 
START WITH 
    deptno = 10
CONNECT BY PRIOR 
    deptno = college;
    
    

    
    
    


    


    