SELECT * fROM TAB;
-- 계정 / 권한


--계정생성
CREATE USER STUDENT IDENTIFIED BY 1234;

--권한부여
GRANT CONNECT, RESOURCE TO STUDENT;

--HR 계정 LOCK 해제 및 비밀번호 변경 
-- HR계정 휴먼리소스 사전에 있는 오라클 샘플 데이터인데 잠겨있음 비밀번호도 이상ㅇ할꺼
ALTER USER HR IDENTIFIED BY 1234;
ALTER USER HR IDENTIFIED BY 1234 ACCOUNT UNLOCK;
ALTER USER HR ACCOUNT UNLOCK IDENTIFIED BY 1234;

