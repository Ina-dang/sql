--MEMBER 
--권한, 주소, 이메일(인증)

-- javaman MEMBER, MANAGER, ADMIN

-- id, auth
-- javaman role_member 
-- javaman role_manager
-- javaman role_admin

-- 8진수로 javaman  (예전에 755 권한생각)
-- ADMIN, MANAGER, MEMBER
-- 0      0        1           >> 일반회원
-- 1      1        1           >> 최고관리자

-- ADMIN, SUPERVISOR, MANAGER, MEMBER >> 32지수




SELECT * FROM TBL_MEMBER;

DELETE TBL_MEMBER WHERE ID = 'kaka';



-- 주소
DROP TABLE TBL_MUSINSA_SAMPLE;
CREATE TABLE TBL_MUSINSA_SAMPLE (
    NO NUMBER PRIMARY KEY,
    TITLE VARCHAR2(2000),
    INFO VARCHAR2(4000),
    PRICE VARCHAR2(1000),
    LINK VARCHAR2(2000)
);

SELECT * FROM TBL_MUSINSA_SAMPLE;